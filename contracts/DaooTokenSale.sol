pragma solidity ^0.5.1;

import "./DappToken.sol";
contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        // Assign an admin
        admin = msg.sender;
        // Token Constract
        tokenContract = _tokenContract;
        // Token Price
        tokenPrice = _tokenPrice;
    }
}