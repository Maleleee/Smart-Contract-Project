
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContractProject {
    uint256 public balance;

    // Modifier to check if the sender has enough balance to withdraw
    modifier hasSufficientBalance(uint256 amount) {
        require(balance >= amount, "Insufficient balance. You do not have enough Ether to withdraw.");
        _;
    }

    // Modifier to check if the balance is already zero before resetting
    modifier notZeroBalance() {
        require(balance > 0, "Balance is already zero.");
        _;
    }

    // Function to deposit Ether (in Wei) and update the balance
    function deposit() public payable {
        // `msg.value` gives the amount of Ether sent in Wei (not ETH).
        // `require` to ensure the deposit is valid
        require(msg.value > 0, "You must send a positive amount of Ether.");
        
        balance += msg.value; // Add the deposit amount to the balance (in Wei)
    }

    // Function to withdraw Ether (in Wei) from the contract
    function withdraw(uint256 amount) public hasSufficientBalance(amount) {
        // `require` to check if there is enough balance for the withdrawal
        require(balance >= amount, "Insufficient balance to withdraw the requested amount.");
        
        balance -= amount; // Subtract the withdrawal amount from the balance

        // `assert` to ensure the balance cannot be negative (for internal consistency)
        assert(balance >= 0); // This should always pass if the contract behaves correctly

        // Transfer Ether to the sender
        payable(msg.sender).transfer(amount); // Transfer the amount in Wei
    }

    // Function to reset the balance to zero (only if balance is greater than zero)
    function resetBalance() public notZeroBalance {
        // Use `revert` to stop the function if the balance is already zero
        if (balance == 0) {
            revert("Balance is already zero. Cannot reset an empty balance.");
        }

        // If the balance is non-zero, reset it to zero
        balance = 0;
    }

    // Example of a function to check the balance (in Wei)
    function checkBalance() public view returns (uint256) {
        return balance; // Balance is in Wei
    }
}