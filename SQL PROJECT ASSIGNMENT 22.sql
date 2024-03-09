use publish_department;

select * from authors_books_mapping;
select * from book_copies;
select * from publishers;
select * from review;
select * from transactions;

alter table review
add review_qty int;

#1
select member_id, transaction_type from transactions where transaction_type = "borrow";

#2
select distinct conditionn from book_copies;

select publishers.publisher_id,publishers.publisher_name,review.review_id,
review.rating,review.review_text from publishers 
inner join review on publishers.publisher_id=review.review_id;

#3
select publisher_name from publishers where (select max(rating) from review) 
= (select max(rating) from review where publishers.publisher_id = review.review_id);

#4
select member_id,transaction_type from transactions
where member_id>5 and transaction_type ='borrow';

#5
select member_id, transaction_type from transactions
where member_id<5 and transaction_type='borrow';

#6 
SELECT review_qty,book_name 
FROM review 
JOIN books  ON book_id = review_id
where review_qty>5;

#7
select sum(amount_paid) from transactions;

#8
select author,book_name, publisher_name,publisher_country 
from publishers
join books
on publisher_id=books_id;

#9 
select book_name,quantity,transaction_type
from books
join transactions
on books_id=transaction_id
where transaction_type="borrow";

#10
select member_id,amount_paid from transactions where amount_paid='0';

#11
SELECT 
  books.book_name,
  MAX(transactions.transaction_type) AS transaction_type,
  COUNT(transactions.transaction_id) AS times
FROM 
  books
JOIN transactions
ON 
  books.books_id = transactions.transaction_id
GROUP BY 
  books.book_name
HAVING 
  MAX(transactions.transaction_type) = 'borrow';
  
#12
SELECT
  books.book_name,
  transactions.transaction_type,
  AVG(EXTRACT(DAY FROM transactions.transaction_date)) AS avg_day
FROM
  books
JOIN
  transactions
ON
  books.books_id = transactions.transaction_id
WHERE
  transactions.transaction_type = 'Borrow'
GROUP BY
  books.book_name, transactions.transaction_type;
  
#13
SELECT YEAR(published_date) AS Year, COUNT(*) AS Total
FROM publishers
GROUP BY Year
ORDER BY Year;

#14
select member_id,transaction_type,times
from transactions
where transaction_type="Borrow"
and times>1;

#15
SELECT book_name, AVG(rating) as avg_rating
FROM books
JOIN review ON books.books_id = review.review_id
GROUP BY books.books_id, book_name;

#16
select sum(copy_number) from book_copies;

#17
create view transact as 
select transaction_id,transaction_date
from transactions
where transaction_id<6;


alter table books
add Author varchar(50);

select * from books;

insert into books(books_id,book_name,quantity,author)
values(1,"The Great Gatsbay",'10',"F.Scott"),
(2,"Jane Eyre",04,"Charlotte bront"),
(3,"Don Quixote",07,"Miguel de"),
(4,"Pride and Prejustice",12,"Jane Austen"),
(5,"Frankestein",06,"Marry Shelly"),
(6,"To kill a MockingBird",02,"Harperlee"),
(7,"Moby Dick",05,"Herman melville"),
(8,"Anna Krenine",03,"Leo Tolstay"),
(9,"Beloved",03,"Toni Morrision"),
(10,"Crime and Punishment",06,"Fyodar")
;
SET SQL_SAFE_UPDATES = 0;

update review
set review_qty=case
when review_id=1 then 12
when review_id=2 then 4
when review_id=3 then 5
when review_id=4 then 6
when review_id=5 then 15
when review_id=6 then 12
when review_id=7 then 7
when review_id=8 then 9
when review_id=9 then 10
when review_id=10 then 8
end;

select * from authors_books_mapping;
select * from book_copies;
select * from publishers;
select * from review;
select * from transactions;
select * from books;






alter table transactions
add times varchar(10);
alter table transactions
add day int;

update transactions
set day=case
when transaction_id=1 then 5
when transaction_id=2 then 4
when transaction_id=3 then 8
when transaction_id=4 then 8
when transaction_id=5 then 7
when transaction_id=6 then 10
when transaction_id=7 then 12
when transaction_id=8 then 7
when transaction_id=9 then 13
when transaction_id=10 then 3
end;

update publishers
set published_date=case
when publisher_id=1 then '2024-01-24'
when publisher_id=2 then '2024-01-05'
when publisher_id=3 then '2023-01-04'
when publisher_id=4 then '2023-10-08'
when publisher_id=5 then '2023-12-01'
when publisher_id=6 then '2023-09-06'
when publisher_id=7 then '2023-10-09'
when publisher_id=8 then '2023-04-06'
when publisher_id=9 then '2023-11-10'
when publisher_id=10 then '2023-12-3'
end;

alter table publishers
add published_date date;

update publishers
set published_date=case
when transaction_id=1 then 2
when transaction_id=2 then 5
when transaction_id=3 then 4
when transaction_id=4 then 8
when transaction_id=5 then 1
when transaction_id=6 then 6
when transaction_id=7 then 10
when transaction_id=8 then 6
when transaction_id=9 then 10
when transaction_id=10 then 3
end;



select * from transact;

