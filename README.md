# Task-4-Aggregate-Functions-and-Grouping
Use aggregate functions and grouping to summarize data

# Task 4 — Aggregate Functions & Grouping (Library Management)

## Overview
This project demonstrates SQL aggregate functions and grouping using a Library Management Database.

## Database Schema
- **Books(book_id, title, author, published_year, genre, available_copies)**
- **Members(member_id, first_name, last_name, email, phone, join_date)**
- **Borrowings(borrowing_id, book_id, member_id, borrow_date, return_date, due_date)**

## Queries
1. Count books by genre  
2. Average available copies per genre  
3. Borrowings per member  
4. Most borrowed book  
5. Members with >3 borrowings  
6. Latest book year per genre  
7. Distinct genres borrowed  
8. Average published year of borrowed books  
9. Total available copies per author  
10. Earliest member join date  

## Tools 
- VS Code 


📌 Interview Questions & Answers

1. What is GROUP BY?
👉 GROUP BY groups rows that share the same values in one or more columns so aggregate functions can be applied.

Example: Count how many books exist in each genre:
    SELECT genre, COUNT(*) 
    FROM books 
    GROUP BY genre;

2. Difference between WHERE and HAVING?
👉 WHERE: Filters rows before grouping.
👉 HAVING: Filters groups after aggregation.

Example: -- WHERE filters books published after 2010
        SELECT * FROM books WHERE published_year > 2010;

        -- HAVING filters genres with more than 5 books
        SELECT genre, COUNT(*) 
        FROM books 
        GROUP BY genre
        HAVING COUNT(*) > 5;

3. How does COUNT(*) differ from COUNT(column)?
👉 COUNT(*) → counts all rows (even if some values are NULL).
👉 COUNT(column) → counts only rows where column is NOT NULL.

Example:    SELECT COUNT(*) AS total_books,
            COUNT(available_copies) AS books_with_copies
            FROM books;

4. Can you group by multiple columns?
👉 Yes. You can group by more than one column to form unique combinations.

Example: Count borrowings grouped by member and genre:
        SELECT m.first_name, bk.genre, COUNT(*) AS borrow_count
        FROM borrowings b
        JOIN members m ON b.member_id = m.member_id
        JOIN books bk ON b.book_id = bk.book_id
        GROUP BY m.first_name, bk.genre;

5. What is ROUND() used for?
👉 ROUND(number, decimals) rounds numeric results to a specified number of decimal places.

Example:    SELECT genre, ROUND(AVG(available_copies), 2) AS avg_copies
            FROM books
            GROUP BY genre;

6. How do you find the highest salary by department? (Library analogy)
👉 Replace “salary by department” with “latest published book by genre”:

Example:    SELECT genre, MAX(published_year) AS latest_book
            FROM books
            GROUP BY genre;


7. What is the default behavior of GROUP BY?
👉 By default, rows with the same column values are grouped together.
⚠️ It does not sort results (must use ORDER BY explicitly).

8. Explain AVG and SUM.
👉 AVG(column) → returns average value of a numeric column.
👉 SUM(column) → returns total of numeric column.

Example:    SELECT AVG(available_copies) AS avg_copies,
            SUM(available_copies) AS total_copies
            FROM books;

9. How to count distinct values?
👉 Use COUNT(DISTINCT column).

Example: Count how many different genres exist in borrowed books:
            SELECT COUNT(DISTINCT bk.genre) AS distinct_genres
            FROM borrowings b
            JOIN books bk ON b.book_id = bk.book_id;

10. What is an aggregate function?
👉 An aggregate function performs a calculation on a set of rows and returns a single value.

Examples: SUM, AVG, COUNT, MAX, MIN.
