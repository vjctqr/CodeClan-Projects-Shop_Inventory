DROP TABLE stock_inventory;
DROP TABLE ebikes;
DROP TABLE brands;

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    contact_number INT 
);

CREATE TABLE ebikes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    brand_id INT REFERENCES brands(id) ON DELETE CASCADE,
    retail_price INT,
    cost INT
);

CREATE TABLE stock_inventory(
    id SERIAL PRIMARY KEY,
    brand_id INT REFERENCES brands(id) ON DELETE CASCADE,
    ebike_id INT REFERENCES ebikes(id) ON DELETE CASCADE
);

