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

CREATE TABLE farms (
  farm_id      INT          PRIMARY KEY AUTO_INCREMENT,
  farm_name    VARCHAR(64)  NOT NULL UNIQUE,
  farm_address VARCHAR(256) NOT NULL
);

CREATE TABLE flavors (
  flavor_id    INT          PRIMARY KEY AUTO_INCREMENT,
  flavor_name  VARCHAR(32)  NOT NULL UNIQUE,
  price_per_lb DECIMAL(3,2) NOT NULL
);

CREATE TABLE inventory (
  flavor_id     INT           NOT NULL,
  farm_id       INT           NOT NULL,
  lbs_available DECIMAL(10,2) NOT NULL,
  CONSTRAINT FK_inventory_flavors
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id),
  CONSTRAINT FK_inventory_farms
    FOREIGN KEY (farm_id) REFERENCES farms (farm_id),
  CONSTRAINT UQ_inventory
    UNIQUE (flavor_id, farm_id)
);

CREATE TABLE products (
  product_id   INT          PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(64)  NOT NULL,
  item_weight  DECIMAL(2,2) NOT NULL,
  flavor_id    INT          NOT NULL,
  CONSTRAINT FK_products_flavors
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id)
);

CREATE TABLE clients (
  client_id    INT          PRIMARY KEY AUTO_INCREMENT,
  client_name  VARCHAR(64)  NOT NULL UNIQUE,
  ship_address VARCHAR(256) NOT NULL UNIQUE
);

CREATE TABLE orders (
  order_id     INT           PRIMARY KEY AUTO_INCREMENT,
  order_date   DATETIME      NOT NULL,
  ship_date    DATETIME,
  received     BOOLEAN       NOT NULL DEFAULT false,
  amount       DECIMAL(10,2) NOT NULL,
  tax_percent  DECIMAL(3,2),
  item_count   INT           NOT NULL DEFAULT 1,
  client_id    INT           NOT NULL,
  product_id   INT           NOT NULL,
  CONSTRAINT FK_orders_clients
    FOREIGN KEY (client_id) REFERENCES clients (client_id),
  CONSTRAINT FK_orders_products
    FOREIGN KEY (product_id) REFERENCES products (product_id),
  CONSTRAINT CK_orders_dates
    CHECK (ship_date IS null OR order_date < ship_date),
  CONSTRAINT CK_orders_received_ship_date
    CHECK (NOT (received AND ship_date IS null))
);

/*** Insert static data ******************************************************/
