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

Because it represents orders made in the past as well as ongoing orders, there
are two dates and a boolean to keep track of its status: When the order was
received, when we shipped the order (NULL if not yet shipped), and whether the
client received the package.

Orders can only have one product, unfortunately. If the client's cart had
multiple products at checkout, our database would probably track each product
as its own order. Realistically, we should have another table to keep track of
shipping status instead of bundling it all into `orders`, but that was outside
the scope of this project.

## Who did what

### For the Midterm

The SQL script itself (`create_db.sql`) was written by Christian and Aadesh.
Christian created the database layout and inserted static data and example
products. Aadesh inserted all of the test data after the products (so,
everything past line 251). Aadesh also fortified the database by explicitly
naming constraints, fixing key issues in the `products` table, and adding a
number of tests to verify constraints and integrity.

The idea for our business was brainstormed by Aadesh and Kirtis. Christian
designed the structure and purpose of the database. The .mwb file was compiled
by Aadesh.

### For the Final

Kirtis managed the project timeline and coordinated task assignments between
team members. He wrote the project documentation, created the indexes on join
conditions and WHERE clause columns, and developed the Evaluate & Synthesize
analytical query using GROUP BY with ROLLUP. Kirtis also handled the final
submission to the GitHub repo.

Christian built the subquery that retrieves orders for a specific client
without hardcoding the client_id. He also continued refining the database
design from the midterm, adding an additional order record that uses DEFAULT
values to address midterm feedback.

Aadesh developed the stored procedure (`sp_calculate_client_revenue`) which
uses a cursor and loop to iterate through clients, calculates total revenue
from received orders, and classifies each client as High Value or Standard
using IF logic. He also wrote the stored function (`fn_calculate_order_total`)
that calculates the total cost of an order including tax, handling NULL tax
values with an IF statement. Aadesh created the updatable single table view
(`vw_premium_flavors`) on the flavors table, and performed the backup and
restore of the database. The updated .mwb ERD file was also compiled by Aadesh.


## Public data

The names and addresses of real coffee shops were used, but our state data was
mostly fabricated by Aadesh.
