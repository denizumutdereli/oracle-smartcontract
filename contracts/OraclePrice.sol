// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/*
    example feed from oracle: Goerli Testnet eth/usd -> 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
*/

interface TokenInterface {
    function mint(address account, uint256 amount) external;
}

contract OracleCommunication is ReentrancyGuard {
    AggregatorV3Interface internal priceFeed;
    TokenInterface public minter;
    uint public tokenPrice = 200; // 1 token = 2.00 usd, with 2 decimal places
    address public owner;

    event Mint(address account, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(address tokenAddress) {
        minter = TokenInterface(tokenAddress);

        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        owner = msg.sender;
    }

    function getChainlinkDataFeedLatestResponse() public view returns(int) {
        (
            // uint80 roundId,
            ,
            int price,
            ,
            ,
            // uint startedAt,
            // uint timeStamp,
            // uint80 answeredInRound,
        ) = priceFeed.latestRoundData();

        return price;
    }

    function tokenAmount(uint256 amountETH) public view returns(uint256) {
        uint256 ethUsd = uint256(getChainlinkDataFeedLatestResponse());
        uint256 amountUSD = amountETH * ethUsd / 10**18; // ETH has 18 decimal places
        uint256 amountToken = amountUSD / tokenPrice / 10**(8/2);
        return amountToken;
    }

    receive() external payable {
        uint256 amountToken = tokenAmount(msg.value);
        minter.mint(msg.sender, amountToken);
        emit Mint(msg.sender, amountToken);
    }

    function withdraw() external onlyOwner nonReentrant {
        payable(owner).transfer(address(this).balance);
    }
}