# CSD138 Midterm Group Project

## Members:
- Kirtis (PM)
- Christian (Dev)
- Aadesh (Dev)


## The Idea

We wanted to make a coffee shop database for our final project. For the
midterm, as a sort of intermediate step, we decided to make the database for
the shop's coffee *supplier*. So, a coffee bean company.

## The Model

Our database has three "source" tables: `farms`, `clients`, and `flavors`.
These are static data representing, respectively, the farms we get our beans
from, the shops (clients) that buy our beans, and the varieties (flavors) of
beans we carry.

There are a few intermediate tables that link these data together.

First, a record in the `inventory` table represents a unique pairing of a
flavor and a farm. For example, our farm in Cuba could export both Light Roast
and Cuban Dark Roast. Our Brazilian farms also export Light Roast, but their
exports are a separate inventory record from the Cuban counterpart. The idea is
that, when an order is made, a query something like this will be used to
determine whether a given flavor is in stock:

```sql
SELECT * FROM inventory WHERE flavor_id = (
  SELECT flavor_id FROM flavors WHERE flavor_name = 'Light Roast'
);
```

The `products` table represents a flavor of bean packed into a certain sized
bag. It isn't directly used anywhere in our DB. It's what an e-commerce site
would use to sell our product. For example, a 5lb bag and 10lb bag of Original
Roast may be the same *flavor*, but they'd be listed as different products
under different prices on our site. The idea is that the query would multiply
the flavor's `price_per_lb` value with the product's `item_weight`. As for the
name to be displayed...

... The `products_readable` view is a way to view products by name and weight
without having to write a long query. The `product_name` field was originally
going to be part of `products`, but that ended up being impossible to generate
on the fly.

Lastly, the holy grail of the project: the `orders` table. This represents
orders made by clients. Understandably, it depends on basically every other
table in the database.

Because it represents 

## Who did what

The SQL script itself (`create_db.sql`) was written by Christian and Aadesh.
Christian created the database layout and inserted static data and example
products. Aadesh inserted all of the test data after the products (so,
everything past line 251). Aadesh also fortified the database by explicitly
naming constraints, fixing key issues in the `products` table, and adding a
number of tests to verify constraints and integrity.

The idea for our business was brainstormed by Aadesh and Kirtis. Christian
designed the structure and purpose of the database. The .mwb file was compiled
by Aadesh.

## Public data

The names and addresses of real coffee shops were used, but our state data was
mostly fabricated by Aadesh.
