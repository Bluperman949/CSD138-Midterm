/******************************************************************************
* create_db.sql
*
* Authors: Christian Doolittle
* Description:
*   This script creates the database for our coffee bean company.
******************************************************************************/

DROP DATABASE IF EXISTS coffee;
CREATE DATABASE coffee;
USE coffee;

/*** Create tables ***********************************************************/

-- The farms we source our coffee from.
CREATE TABLE farms (
  farm_id      INT          PRIMARY KEY AUTO_INCREMENT,
  farm_name    VARCHAR(64)  NOT NULL UNIQUE,
  farm_address VARCHAR(256) NOT NULL
);

-- The types of coffee we sell.
CREATE TABLE flavors (
  flavor_id    INT          PRIMARY KEY AUTO_INCREMENT,
  flavor_name  VARCHAR(32)  NOT NULL UNIQUE,
  price_per_lb DECIMAL(3,2) NOT NULL
);

-- How much of each type of coffee we have in stock. This should be read by an
-- intermediate service to determine whether orders can be made on our
-- frontend.
-- Each item in this list represents stock of a given flavor from a given farm.
CREATE TABLE inventory (
  flavor_id     INT           NOT NULL,
  farm_id       INT           NOT NULL,
  lbs_available DECIMAL(10,2) NOT NULL,

  CONSTRAINT FK_inventory_flavors
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id),
  CONSTRAINT FK_inventory_farms
    FOREIGN KEY (farm_id) REFERENCES farms (farm_id),
  -- Stock is identified by a *combination* of farm and flavor, no primary key.
  CONSTRAINT UQ_inventory
    UNIQUE (flavor_id, farm_id)
);

-- The actual items to be listed on our frontend.
-- Each item is just a flavor with a weight - we're selling bags of beans.
CREATE TABLE products (
  product_id   INT          PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(64)  NOT NULL, -- TODO: auto-generate this name
  item_weight  DECIMAL(2,2) NOT NULL,

  flavor_id    INT          NOT NULL,

  CONSTRAINT FK_products_flavors
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id)
);

-- Stores (coffee shops) that have bought our product.
CREATE TABLE clients (
  client_id    INT          PRIMARY KEY AUTO_INCREMENT,
  client_name  VARCHAR(64)  NOT NULL UNIQUE,
  ship_address VARCHAR(256) NOT NULL UNIQUE
);

-- All orders, fulfilled and unfulfilled.
-- TODO: Fill this table with fake data for testing.
CREATE TABLE orders (
  order_id     INT           PRIMARY KEY AUTO_INCREMENT,

  -- When was this order placed?
  order_date   DATETIME      NOT NULL,
  -- When did we ship it to the client?
  ship_date    DATETIME,
  -- Has the order made it to the client? (for selecting "active" orders only)
  received     BOOLEAN       NOT NULL DEFAULT false,

  -- How much did they pay?
  amount       DECIMAL(10,2) NOT NULL,
  tax_percent  DECIMAL(3,2),
  -- TODO: generate amount_total column with tax included

  -- How many items were in this order? (orders can only contain one product)
  item_count   INT           NOT NULL DEFAULT 1,

  client_id    INT           NOT NULL,
  product_id   INT           NOT NULL,

  CONSTRAINT FK_orders_clients
    FOREIGN KEY (client_id) REFERENCES clients (client_id),
  CONSTRAINT FK_orders_products
    FOREIGN KEY (product_id) REFERENCES products (product_id),

  -- Disallow impossible ship times - we can't ship *that* fast
  CONSTRAINT CK_orders_dates
    CHECK (ship_date IS null OR order_date < ship_date),
  -- Disallow receiving orders that haven't been shipped
  CONSTRAINT CK_orders_received_ship_date
    CHECK (NOT (received AND ship_date IS null))
);

/*** Insert static data ******************************************************/
