// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContract {
    struct Book {
        string title;
        bool isAvailable;
    }

    mapping(uint256 => Book) public books;
    mapping(address => uint256[]) public borrowedBooks;
    uint256 public totalBooks;

    // Declare the event to log the bookId and title
    event BookAdded(uint256 bookId, string title);

    // Modifier to ensure the book is available for borrowing
    modifier bookAvailable(uint256 bookId) {
        require(books[bookId].isAvailable, "This book is not available for borrowing.");
        _;
    }

    // Modifier to ensure the user has borrowed the book
    modifier hasBorrowed(uint256 bookId) {
        bool borrowed = false;
        for (uint256 i = 0; i < borrowedBooks[msg.sender].length; i++) {
            if (borrowedBooks[msg.sender][i] == bookId) {
                borrowed = true;
                break;
            }
        }
        require(borrowed, "You haven't borrowed this book.");
        _;
    }

    // Function to add a new book to the library
    function addBook(string memory title) public {
        uint256 bookId = totalBooks; // Get the current totalBooks as the bookId
        books[bookId] = Book(title, true); // Add the new book and set availability to true
        totalBooks++; // Increment the total number of books

        // Assert that the title is non-empty by checking its byte length
        assert(bytes(books[bookId].title).length > 0); // Ensure that the title is non-empty
        
        // Ensure that the totalBooks variable has been updated correctly
        assert(totalBooks == bookId + 1); 
        
        // Emit the event to log the bookId and title
        emit BookAdded(bookId, books[bookId].title); // Log the bookId and title in the event
    }

    // Function to borrow a book
    function borrowBook(uint256 bookId) public bookAvailable(bookId) {
        books[bookId].isAvailable = false; // Mark the book as unavailable
        borrowedBooks[msg.sender].push(bookId); // Add the book to the user's borrowed list
    }

    // Function to return a borrowed book
    function returnBook(uint256 bookId) public hasBorrowed(bookId) {
        bool found = false;
        // Find and remove the book from the borrowed list
        for (uint256 i = 0; i < borrowedBooks[msg.sender].length; i++) {
            if (borrowedBooks[msg.sender][i] == bookId) {
                found = true;
                borrowedBooks[msg.sender][i] = borrowedBooks[msg.sender][borrowedBooks[msg.sender].length - 1];
                borrowedBooks[msg.sender].pop(); // Remove the book from the borrowed list
                break;
            }
        }
        require(found, "Book not found in your borrowed list.");
        
        books[bookId].isAvailable = true; // Mark the book as available again
    }

    // Function to check if a book is available
    function checkBookAvailability(uint256 bookId) public view returns (bool) {
        return books[bookId].isAvailable;
    }

    // Function to view all borrowed books
    function viewBorrowedBooks() public view returns (string[] memory) {
        string[] memory borrowedTitles = new string[](borrowedBooks[msg.sender].length);
        for (uint256 i = 0; i < borrowedBooks[msg.sender].length; i++) {
            borrowedTitles[i] = books[borrowedBooks[msg.sender][i]].title; // Get the title of each borrowed book
        }
        return borrowedTitles;
    }

    // Function to simulate resetting the library (for testing purposes)
    function resetLibrary() public {
        for (uint256 i = 0; i < totalBooks; i++) {
            if (!books[i].isAvailable) {
                revert("Books are currently borrowed, cannot reset the library.");
            }
        }
        totalBooks = 0; // Reset total number of books
        for (uint256 i = 0; i < borrowedBooks[msg.sender].length; i++) {
            borrowedBooks[msg.sender].pop(); // Clear borrowed books for the user
        }
    }
}
