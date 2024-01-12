# Smart Contract Repository

This repository contains two Solidity smart contracts designed for Ethereum-based applications. The contracts utilize OpenZeppelin's ERC20, AccessControl, and ReentrancyGuard, as well as Chainlink's price feed Oracle. The main functionality revolves around minting ERC20 tokens based on ETH/USD price data provided by Chainlink.

## Contracts Overview

1. **Token Contract**: An ERC20 token contract with role-based access control (RBAC) for minting tokens.
2. **OracleCommunication Contract**: A contract to interact with Chainlink's price feed oracle and mint tokens based on the ETH/USD price.

## Features

- **ERC20 Standard**: The token contract follows the ERC20 standard, allowing for a broad range of interoperability with wallets and other contracts.
- **Role-Based Access Control (RBAC)**: The RBAC pattern is used to restrict the minting of tokens to certain addresses or possible to set new roles for different actions.
- **ReentrancyGuard**: This OpenZeppelin contract is used to prevent reentrancy attacks.
- **Chainlink Oracles**: The OracleComm contract uses Chainlink oracles to fetch the latest ETH/USD price, ensuring reliable and tamper-proof data for token minting calculations.

### OpenZeppelin Contracts

- **ERC20**: A standard interface for fungible tokens, allowing for a consistent API across different token implementations.
- **AccessControl**: A contract module which provides a basic access control mechanism, where there is an account (an owner) that can be granted exclusive access to specific functions.
- **ReentrancyGuard**: A contract module that helps prevent reentrant calls to a function.

### Chainlink

- **Price Feed Oracle**: Used to securely and reliably fetch external data (ETH/USD price in this case) for use within the smart contract.

## Building and Testing with Hardhat

### Setup

1. **Install Node.js and npm**: Make sure Node.js and npm are installed on your machine. [Node.js Downloads](https://nodejs.org/en/download/)

2. **Clone the Repository**: Clone this repository to your local machine.

    ```
    git clone [repository_url]
    ```

3. **Install Dependencies**:

    Navigate to the cloned directory and install the necessary dependencies.

    ```
    cd [repository_name]
    npm install
    ```

### Hardhat Usage

- **Compile Contracts**: Compile the smart contracts using Hardhat.

    ```
    npx hardhat compile
    ```

- **Run Tests**: Run the tests written for the contracts.

    ```
    npx hardhat test
    ```

- **Local Blockchain**: Run a local blockchain instance for testing.

    ```
    npx hardhat node
    ```

- **Deploy Contracts**: Deploy the contracts to the local blockchain for testing.

    ```
    npx hardhat run scripts/deploy.js --network localhost
    ```


    For further Aderyn AST analysis

    ```bash
    aderyn .
    ```

    For further Foundry AST analysis and REPL

    ```bash
    forge build
    chisel
    ```

## Conclusion

This repository showcases the integration of Chainlink oracles, OpenZeppelin's security and token standards, and Solidity best practices for smart contract development on Ethereum.

## Contributing

Contributions to expand or improve the repository are welcome! 

[@denizumutdereli](https://www.linkedin.com/in/denizumutdereli)

## Resources and Further Reading
[chainlink data feeds](https://docs.chain.link/data-feeds)