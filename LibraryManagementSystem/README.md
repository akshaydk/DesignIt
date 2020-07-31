Requirements:
1. Librarian can add books. Member can issue, renew and return the books.
2. There can be multiple copies of same book, called book_item
3. Member can add a notification for a book.
4. Fine should be collected if due date is crossed.
5. Member can lend only certain number of book at any given time.
6. Books will be placed in racks.
6. Placeholders for Account management.

```
Langauge: Ruby
ORM: Sequel
DB: Sqlite
```

Setup: 
1. Create a db with name Library.db in sqlite
2. Run ``` load './loader.rb' ``` to load all the classes in the console.
3. Play with Member and Librarian classes


Things to think of?

1. Can Notifier be exported as a module?
2. Finding the rack position for a new book can be dependent of algorithm. How can we handle multiple algorithms?
