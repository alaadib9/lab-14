Query 1: CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

This query will create a second table in the lab14_normal database named authors. Confirm the success of this command by typing \d authors in your SQL shell. You should see the authors table schema, as shown above.
Query 2: INSERT INTO authors(name) SELECT DISTINCT author FROM books;

This query will use a simple subquery to retrieve unique author values from the books table and insert each one into the authors table in the name column. This is a great pattern for copying lots of data between tables.
Confirm the success of this command by typing SELECT COUNT(*) FROM authors; in your SQL shell. The number should be greater than zero.
Query 3: ALTER TABLE books ADD COLUMN author_id INT;

This query will add a column to the books table named author_id. This will connect each book to a specific author in the other table.
Confirm the success of this command by typing \d books in your SQL shell. The table schema should now include a column for author_id, in addition to the column for the string author; the author column will be removed in Query 5.
Query 4: UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. The subquery finds the author row that has a name matching the current book's author value. The id of that author row is then set as the value of the author_id property in the current book row.
