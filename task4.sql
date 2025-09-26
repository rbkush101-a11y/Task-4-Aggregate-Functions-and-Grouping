-- Task 4: Aggregate Functions & Grouping

-- 1. Count how many books are in each genre
SELECT genre, COUNT(*) AS total_books
FROM books
GROUP BY genre;

-- 2. Average available copies per genre
SELECT genre, ROUND(AVG(available_copies), 2) AS avg_copies
FROM books
GROUP BY genre
ORDER BY avg_copies DESC;

-- 3. Total number of borrowings per member
SELECT m.member_id, m.first_name, m.last_name, COUNT(b.borrowing_id) AS borrow_count
FROM members m
LEFT JOIN borrowings b ON m.member_id = b.member_id
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY borrow_count DESC;

-- 4. Most borrowed book
SELECT bk.title, COUNT(b.borrowing_id) AS times_borrowed
FROM books bk
JOIN borrowings b ON bk.book_id = b.book_id
GROUP BY bk.title
ORDER BY times_borrowed DESC
LIMIT 1;

-- 5. Members who borrowed more than 3 books
SELECT m.member_id, m.first_name, m.last_name, COUNT(b.borrowing_id) AS borrow_count
FROM members m
JOIN borrowings b ON m.member_id = b.member_id
GROUP BY m.member_id, m.first_name, m.last_name
HAVING COUNT(b.borrowing_id) > 3;

-- 6. Highest published year (latest book) per genre
SELECT genre, MAX(published_year) AS latest_year
FROM books
GROUP BY genre;

-- 7. Count distinct genres borrowed by members
SELECT COUNT(DISTINCT bk.genre) AS distinct_genres_borrowed
FROM borrowings b
JOIN books bk ON b.book_id = bk.book_id;

-- 8. Average published year of borrowed books
SELECT ROUND(AVG(bk.published_year), 0) AS avg_pub_year
FROM borrowings b
JOIN books bk ON b.book_id = bk.book_id;

-- 9. Total available copies of books per author
SELECT author, SUM(available_copies) AS total_copies
FROM books
GROUP BY author;

-- 10. Member with earliest join date (oldest membership)
SELECT first_name, last_name, MIN(join_date) AS earliest_join
FROM members;
