# Smart Contract Project - Library Management Smart Contract with Error Handling

This smart contract demonstrates basic error-handling mechanisms in Solidity, including require, assert, and revert. It allows users to interact with a library system by adding, borrowing, returning, and checking books. Each function uses error handling to ensure the contract behaves correctly.

## Description

This project is a simple Ethereum smart contract designed to manage a library system. The contract allows users to:

* Add a Book: Allows the owner to add books to the library.
* Borrow a Book: Allows users to borrow books if available.
* Return a Book: Allows users to return books they’ve borrowed.
* Check Book Availability: Lets users check if a book is available for borrowing.
* View Borrowed Books: Displays a list of books a user has borrowed.
* Reset Library: Resets the library system, but only if no books are borrowed.

The contract uses the following error-handling mechanisms:

* require: Ensures preconditions are met before executing functions.
* assert: Used to validate internal contract states.
* revert: Cancels a transaction and reverts any changes if conditions are not met.
The contract is intended to be tested on Remix IDE and demonstrates secure smart contract development practices.


## Getting Started

### Installing

1. Visit Remix IDE:

* Go to https://remix.ethereum.org in your web browser. Remix is a browser-based IDE, so there is no need for any installation.

2. Create a New File:

* In Remix, create a new Solidity file, for example, ExampleContract.sol.
* Copy the provided smart contract code into this file.

### Executing program

1. Compile the Contract:

* In Remix IDE, navigate to the Solidity Compiler tab (icon on the left panel).
* Select the appropriate version (0.8.x) in the compiler dropdown.
* Click Compile SmartContractProject.sol.

2. Deploy the Contract:

* Navigate to the Deploy & Run Transactions tab (Ethereum icon).
* Set the environment to Remix VM (Cancun)
* Click Deploy.

3. Interact with the Contract:

* After deployment, you’ll see the contract listed under Deployed Contracts.
* Expand the contract to interact with the functions (Add Book, Borrow Book, Return Book, Check Availability, View Borrowed Books, and Reset Library).

# Example of Interactions:
* Add a Book: Call the addBook() function, enter a book title, and hit Transact.
* Borrow a Book: Call the borrowBook() function, enter the bookId, and hit Transact. Ensure the book is available.
* Return a Book: Call the returnBook() function, enter the bookId, and hit Transact.
* Check Availability: Call the checkBookAvailability() function to check if a specific book is available for borrowing.
* View Borrowed Books: Call the viewBorrowedBooks() function to see a list of borrowed books.
* Reset Library: Call the resetLibrary() function to reset the library. If books are borrowed, the function will revert with an error.

# Testing and Debugging

* Revert Errors: If the contract fails, check for revert errors such as:

* "This book is not available for borrowing." (when attempting to borrow an unavailable book).
* "You haven't borrowed this book." (when attempting to return a book not borrowed).
* "Books are currently borrowed, cannot reset the library." (when trying to reset the library with borrowed books).

* Assertion Failures: If you encounter an error related to assert, it means there’s a problem with contract consistency (e.g., a book’s title is empty, or the total number of books doesn’t match the expected value).

* Require Failures: Look out for require errors like:

* "This book is not available for borrowing." (in borrowBook()).
* "You haven't borrowed this book." (in returnBook()).

## Help

If you encounter issues while running the contract, you can check the Remix IDE console for transaction logs and error messages.

For common troubleshooting, check the following:

* Ensure that you're using valid book IDs.
* If you see an assertion failure, verify that book titles are correctly added and the total count is correct.
* Use the Remix console to view logs for failed transactions and contract errors.

# Authors

Allen Shoji C. Takahashi 202111055@fit.edu.ph - BSCSSE - FEU Institute of Technology

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
