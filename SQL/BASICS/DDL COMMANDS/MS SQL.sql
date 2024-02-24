create table if EXISTS users(
  user_id INTEGER,
  name varchar(225),
  email varchar(225),
  password varchar(225),)
 
 create table if EXISTS users2(
  user_id2 INTEGER,
  name2 varchar(225),
  email2 varchar(225),
  password2 varchar(225),)
  
  
 insert INTO users2 (user_id2,name2,email2,password2)
 VALUES (001,'anmol','anmolwali10@gmail.com','anmol121');
 select * from users2
 
 /* inserting multiple values
 */
 insert INTO users (user_id2,name2,email2,password2)
 VALUES (1,'anmol','anmolwali10@gmail.com','anmol121'),
        (2,'anmol','abhimanyu@gmail.com','abhimanyu121'),
   		(3,'anmol','nikil@gmail.com','nikhil121');
 
 /* Truncate command empty all content in the table
    and drop command delete the table */

 TRUNCATE TABLE users2;
 drop TABLE users2;
 
 -- constraints in MY SQL--
   CREATE TABLE users3 (
  user_id3 INTEGER NOT NULL,
  name3 VARCHAR(225) NOT NULL,
  email3 VARCHAR(225) UNIQUE NOT NULL,
  password3 VARCHAR(225) NOT NULL,
 -- THIS is also same but this means no combination of name and email is repeated--
  CONSTRAINT user_email_unique UNIQUE (name3,email3),
  CONSTRAINT userpk PRIMARY KEY (user_id3)
   );
 -- combination of two columns for primary key--
 -- CONSTRAINT userpk PRIMARY KEY (user_id3,name3)--
 
-- AUTO_INCREMENT--
/*CREATE TABLE users4 (
  user_id4 INTEGER NOT NULL AUTO_INCREMENT,
  name4 VARCHAR(225) NOT NULL,
  email4 VARCHAR(225) UNIQUE NOT NULL,
  password4 VARCHAR(225) NOT NULL,
  CONSTRAINT user_email_unique UNIQUE (name4, email4),
  PRIMARY KEY (user_id4)
);*/

 --check constraint--
 CREATE TABLE example (
    id INT,
    value INT,
    CONSTRAINT check_value_positive CHECK (value > 0)
);
-- Default constraint--
CREATE TABLE example (
    id INT,
    name VARCHAR(50) DEFAULT 'John',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Foreign Key--
CREATE TABLE users6 (
    user_id INT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users6(user_id)
);

-- Referential actions--
/* 
 Restrict
 CASCADE
 SET NULL
 SET DEFAULT 
 
In MySQL, when you define a foreign key constraint, you can specify the action to be taken when a 
referenced row is updated or deleted. These actions are known as referential actions or referential integrity 
actions. MySQL supports the following referential actions:

ON DELETE: This action specifies what should happen when a referenced row in the parent table is deleted. 
The available options are:

CASCADE: Delete or update the rows from the child table that reference the deleted row in the parent table.
SET NULL: Set the foreign key columns in the child table to NULL when the referenced row in the parent table is 
deleted.
RESTRICT: Prevent the deletion of the referenced row in the parent table if there are corresponding rows in the 
child table.
NO ACTION: This is the same as RESTRICT. It prevents the deletion of the referenced row in the parent table 
if there are corresponding rows in the child table.
 
 ON UPDATE: This action specifies what should happen when the value of the referenced column in the parent 
 table is updated. The available options are the same as for ON DELETE.
 */

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id)
      ON DELETE CASCADE
      ON UPDATE SET NULL
);

/*
The child table has a foreign key constraint referencing the parent table on the parent_id column.
If a row in the parent table is deleted, rows in the child table that reference the deleted row will 
also be deleted (ON DELETE CASCADE).
If a value in the id column of the parent table is updated, the parent_id column in the child table 
will be set to NULL (ON UPDATE SET NULL).
*/

--CASCADE on DELETE:--

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE CASCADE
);
--In this example, if a row in the parent table is deleted, all corresponding --
--rows in the child table will also be deleted.--


/*SET NULL on DELETE*/

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE SET NULL
);

--In this example, if a row in the parent table is deleted, the corresponding parent_id values --
--in the child table will be set to NULL.--


--RESTRICT on DELETE:--

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE RESTRICT
);

/*
In this example, MySQL will prevent the deletion of a row in the parent table if there are 
corresponding rows in the child table.
*/
 

--NO ACTION (Equivalent to RESTRICT) on DELETE:--

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE NO ACTION
);

/*
This is equivalent to using ON DELETE RESTRICT. It will prevent the deletion of a row in the parent 
table if there are corresponding rows in the child table.
*/


--CASCADE on UPDATE:--

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON UPDATE CASCADE
);

/*
In this example, if the value of id in the parent table is updated, all corresponding parent_id values 
in the child table will also be updated.
*/



-- Table Alter commands--

--Add a Column:--
--example--
ALTER TABLE users
ADD email VARCHAR(255);

--Drop a Column:--
ALTER TABLE users
DROP COLUMN email;


--Modify a Column:--
ALTER TABLE users
MODIFY email VARCHAR(100);

--Rename a Column:--

ALTER TABLE users
CHANGE email user_email VARCHAR(100);

--Add a Primary Key Constraint:--

ALTER TABLE users
ADD PRIMARY KEY (user_id);

--Add a Foreign Key Constraint:--

ALTER TABLE orders
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES users(user_id);

--Drop a Primary Key Constraint:--

ALTER TABLE users
DROP PRIMARY KEY;

--Drop a Foreign Key Constraint:--
ALTER TABLE orders
DROP FOREIGN KEY fk_user_id;

 
 
 
 
 
 
 
