### 1. What is PostgreSQL?

- PostgreSQL হলো একটি ওপেন সোর্স, রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা শক্তিশালী ফিচার এর জন্য পরিচিত এবং এটি SQL কে এক্সপান্ড করে।

### 2. What is the purpose of a database schema in PostgreSQL?

- ডাটাবেস স্কিমা হল ডাটাবেসের ভিতরের একটি সংগঠিত কাঠামো (structure) যা টেবিল, ভিউ, ফাংশন, এবং অন্যান্য অবজেক্ট একসাথে রাখে। (tables, views, indexes, data types, functions, and operators)

স্কিমার মাধ্যমে,
১/ ডাটাগুলোকে গুছিয়ে রাখা যায়।
২/ স্কিমাভিত্তিক এক্সেস কন্ট্রোল করা যায়।
৩/ একই নামে একাধিক টেবিল রাখা যায়, যদি তারা আলাদা স্কিমায় থাকে

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

- প্রাইমারি কিঃ প্রতিটি সারির জন্য ইউনিক আইডি হিসেবে কাজ করে। এটি NULL হতে পারে না।
  ফরেন কিঃ এটি অন্য একটি টেবিলের Primary Key কে নির্দেশ করে। অন্য টেবিলের সাথে সম্পর্ক স্থাপনে ব্যবহার হয়।

### 4. What is the difference between the VARCHAR and CHAR data types?

- VARCHAR: এটা তে সর্বোচ্চ কতটা অক্ষর রাখতে পারে সেটা সেট করা থাকে আর এর কমে কোনো ইনপুট দিলে এক্সট্রা জায়গা নেয় নাহ অপরদিকে,
  CHAR: ক্যারেক্টার স্ট্রিং স্টোর করে রাখে এবং যদি সাইজের চেয়ে কম সাইজের ইনপুট দেয় তাহলে এক্সট্রা খালি যাইগা গুলা ব্লেঙ্ক স্পেস দিয়ে প্যাডেড হয়ে যায়। কোনো টেবিলের ডাটা গুলা একই সাইজের হলে তখন এটা ব্যবহার হয়।

### 5. Explain the purpose of the WHERE clause in a SELECT statement.

- কোনো শর্ত র উপর ভিত্তি করে ডাটা খোজার জন্য where ব্যবহার হয়।

### 6. What are the LIMIT and OFFSET clauses used for?

- LIMIT: নির্দিষ্ট সংখ্যক সারি ফেরত দেয়। আর,
  OFFSET: একটি নির্দিষ্ট সংখ্যক সারি বাদ দিয়ে পরবর্তী সারি থেকে ডাটা দেয়।

### 7. How can you modify data using UPDATE statements?

-

```js
UPDATE customer SET name = abc WHERE id = 1;
```

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

- একাধিক টেবিলের মধ্যে প্রাইমারি কি আর ফরেন কি ব্যবহারের মাধ্যমে কানেক্ট করতে JOIN ব্যবহৃত হয়।

```js
SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;
```

### 9. Explain the GROUP BY clause and its role in aggregation operations.

- GROUP BY নির্দিষ্ট কলামের উপর ভিত্তি করে গ্রুপ করে

```js
SELECT author, COUNT(*) FROM books GROUP BY author;
```

### 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

- COUNT(): নির্দিষ্ট কলামে মোট রেকর্ড সংখ্যা গণনা করে।

```js
SELECT COUNT(*) FROM orders;
```

SUM(): নির্দিষ্ট কলামে নাম্বার গুলোর যোগফল নির্ণয় করে।

```js
SELECT SUM(price) FROM books;
```

AVG(): নির্দিষ্ট একটা কলামের গড় মান নির্ণয় করে।

```js
SELECT COUNT(*) FROM orders;
```
