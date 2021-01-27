CREATE DATABASE MyStore;
USE MyStore;
CREATE TABLE products (
	name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    category VARCHAR(255) NOT NULL
);
