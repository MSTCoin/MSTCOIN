pragma solidity ^0.4.17;

contract ERC20TransferInterface {
    function transfer(address to, uint256 value) public returns (bool);
    function balanceOf(address who) constant public returns (uint256);
}