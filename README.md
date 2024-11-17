# Smart Contract Project - Solidity Project with Error Handling

This smart contract demonstrates basic error-handling mechanisms in Solidity: require, assert, and revert. It allows users to deposit, withdraw, and reset Ether balances, with each function using error handling for validation.

## Description

The Project is a simple Ethereum smart contract that allows users to interact with Ether. It has three key functions:

* Deposit: Allows users to deposit Ether into the contract.

* Withdraw: Allows users to withdraw Ether from the contract while checking for sufficient balance.

* Reset Balance: Allows users to reset the contract's balance to zero, with protections to prevent resetting when the balance is already zero.

Each of these functions utilizes different Solidity error-handling mechanisms to ensure the contract behaves as expected. The contract is built to be tested on Remix IDE and demonstrates basic practices for developing secure smart contracts.


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
* Expand the contract to interact with the functions (Deposit, Withdraw, ResetBalance, and CheckBalance).

# Example of Interactions:
* Deposit: Call the deposit() function, enter a value in Wei (e.g., 1000000000000000000 Wei for 1 Ether), and hit Transact.
* Withdraw: Call the withdraw() function, enter an amount (in Wei) to withdraw, and hit Transact. Ensure there’s enough balance.
* ResetBalance: Call the resetBalance() function to reset the balance to zero. If the balance is already zero, the function will fail with an error message.

# Testing and Debugging

* Revert Errors: If the contract fails, check for revert errors such as "Balance is already zero. Cannot reset an empty balance." or "Insufficient balance to withdraw the requested amount."
* Assertion Failures: If you encounter an error related to assert, it means there’s an issue with contract consistency (e.g., the balance became negative).
* Require Failures: Look out for require errors like "You must send a positive amount of Ether.", which indicate that the transaction did not meet precondition checks

## Help

If you encounter issues while running the contract, you can check the Remix IDE console for transaction logs and error messages.

For common troubleshooting, check the following:

* Ensure that you're using the correct Wei values for Ether (1 Ether = 1000000000000000000 Wei).
* If you see an assertion failure, double-check that the contract’s balance is not negative.
* Use the Remix console to view logs for failed transactions and contract errors.

# Authors

Allen Shoji C. Takahashi 202111055@fit.edu.ph - BSCSSE - FEU Institute of Technology

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
