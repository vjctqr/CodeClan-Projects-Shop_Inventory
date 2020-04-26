DROP TABLE ebikes;
DROP TABLE types;
DROP TABLE brands;



CREATE TABLE types(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    motor VARCHAR(255)
);

CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    contact_number INT 
);

CREATE TABLE ebikes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    retail_price INT,
    cost INT,
    type_id INT REFERENCES types(id) ON DELETE CASCADE,
    brand_id INT REFERENCES brands(id) ON DELETE CASCADE
);

