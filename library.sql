/* Segundo proyecto de base de datos, en este caso uso el ejemplo de
Alexander Wong para hacer toda la estructura de una biblioteca.
Mi intención es refinar mi base de datos anterior (el colegio), y tener una
sintaxis más limpia. */

/*Se crea el procedure para automatizar la creación de la base de datos.
Este punto me costó especialmente porque no entendía que las procedures
se guardaban en una base de datos en sí misma. Gracias Nito. */

DELIMITER \\
CREATE PROCEDURE sp_librarycreation()
BEGIN 
	CREATE DATABASE mylibrary;
END\\
DELIMITER ;

CALL sp_librarycreation;

                    /*==========CREACIÓN DE TABLAS COMIENZO==========*/
CREATE TABLE ml_publisher (
    publisher_name VARCHAR(100) NOT NULL,
    publisher_address VARCHAR(255) NOT NULL,
    publisher_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY(publisher_name)
);

CREATE TABLE ml_book (
    book_id INT NOT NULL AUTO_INCREMENT,
    book_title VARCHAR(255) NOT NULL,
    book_publisher VARCHAR(100) NOT NULL,
    PRIMARY KEY(book_id),
    FOREIGN KEY(book_publisher) REFERENCES ml_publisher(publisher_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ml_facilities (
    facility_id INT NOT NULL AUTO_INCREMENT,
    facility_name VARCHAR(255) NOT NULL,
    facility_address VARCHAR(255) NOT NULL,
    PRIMARY KEY(facility_id)
);

CREATE TABLE ml_borrower (
    borrower_id INT NOT NULL AUTO_INCREMENT,
    borrower_name VARCHAR(255) NOT NULL,
    borrower_address VARCHAR(255) NOT NULL,
    borrower_phoneno VARCHAR(15) NOT NULL,
    PRIMARY KEY(borrower_id)
)
AUTO_INCREMENT=115;

CREATE TABLE ml_loans (
    loan_id INT NOT NULL AUTO_INCREMENT,
    loan_book_id INT NOT NULL,
    loan_facility_id INT NOT NULL,
    loan_borrower_id INT NOT NULL,
    loan_dateout VARCHAR(50) NOT NULL,
    loan_duedate VARCHAR(50) NOT NULL,
    PRIMARY KEY(loan_id),
    FOREIGN KEY(loan_book_id) REFERENCES ml_book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(loan_facility_id) REFERENCES ml_facilities(facility_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(loan_borrower_id) REFERENCES ml_borrower(borrower_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ml_copies (
    copy_id INT NOT NULL AUTO_INCREMENT,
    copy_book_id INT NOT NULL,
    copy_facility_id INT NOT NULL,
    copy_numofcopies INT NOT NULL,
    PRIMARY KEY(copy_id),
    FOREIGN KEY(copy_book_id) REFERENCES ml_book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(copy_facility_id) REFERENCES ml_facilities(facility_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ml_authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    author_book_id INT NOT NULL,
    author_name VARCHAR(255),
    PRIMARY KEY(author_id),
    FOREIGN KEY(author_book_id) REFERENCES ml_book(book_id) ON DELETE CASCADE ON UPDATE CASCADE
);
                /*==========CREACIÓN DE TABLAS FIN==========*/