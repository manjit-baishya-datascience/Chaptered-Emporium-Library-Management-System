-- removing older schema if exists
DROP SCHEMA IF EXISTS chaptered_emporium;

-- create new schema
CREATE SCHEMA IF NOT EXISTS chaptered_emporium;

-- creating table - [books]
DROP TABLE IF EXISTS chaptered_emporium.books;
CREATE TABLE IF NOT EXISTS chaptered_emporium.books(
    isnb VARCHAR(20) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    author_ID INT NOT NULL REFERENCES chaptered_emporium.author(author_ID),
    publisher_ID INT NOT NULL REFERENCES chaptered_emporium.publisher(publisher_ID),
    published_month INT,
    published_year INT,
    price INT NOT NULL,
    quantity INT NOT NULL,
    total_issues INT NOT NULL,
    total_renewes INT NOT NULL,
    genre_ID INT NOT NULL REFERENCES chaptered_emporium.genre(genre_ID),
    origin_country VARCHAR(50) NOT NULL
);

-- creating table - [author]
DROP TABLE IF EXISTS chaptered_emporium.author;
CREATE TABLE IF NOT EXISTS chaptered_emporium.author(
    author_ID INT PRIMARY KEY NOT NULL,
    author_name VARCHAR(50) NOT NULL,
    books_published INT,
    origin_country VARCHAR(50)
);

-- creating table - [orders]
DROP TABLE IF EXISTS chaptered_emporium.orders;
CREATE TABLE IF NOT EXISTS chaptered_emporium.orders(
    order_ID INT PRIMARY KEY NOT NULL,
    isbn VARCHAR(20) NOT NULL REFERENCES chaptered_emporium.books(isbn),
    genre_ID INT NOT NULL REFERENCES chaptered_emporium.genre(genre_ID),
    customer_ID INT NOT NULL REFERENCES chaptered_emporium.customer(customer_ID),
    month INT NOT NULL,
    year INT NOT NULL,
    quantity INT NOT NULL,
    payment_method VARCHAR(10) NOT NULL
);

-- creating table - [customer]
DROP TABLE IF EXISTS chaptered_emporium.customer;
CREATE TABLE IF NOT EXISTS chaptered_emporium.customer(
    customer_ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone BIGINT NOT NULL,
    address VARCHAR(100) NOT NULL,
    is_member BIT NOT NULL,
    total_issues INT NOT NULL,
    total_renewes INT NOT NULL,
    is_student BIT NOT NULL,
    currently_issued INT NOT NULL,
    age INT NOT NULL
);

-- creating table - [publisher]
DROP TABLE IF EXISTS chaptered_emporium.publisher;
CREATE TABLE IF NOT EXISTS chaptered_emporium.publisher(
    publisher_ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    total_publication INT,
    total_books_here INT NOT NULL
);

-- creating table - [genre]
DROP TABLE IF EXISTS chaptered_emporium.genre;
CREATE TABLE IF NOT EXISTS chaptered_emporium.genre(
    genre_ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    total_issues INT,
    total_revenues INT NOT NULL,
    total_books INT,
    total_authors INT,
    total_publishers INT
);
