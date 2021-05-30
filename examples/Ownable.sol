//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
  address private owner;

  event OwnerSet(address indexed oldOwner, address indexed newOwner);

  modifier isOwner() {
    require(msg.sender == owner, "Caller is not owner");
    _;
  }

  constructor() {
    owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
    emit OwnerSet(address(0), owner);
  }

  function changeOwner(address newOwner) public isOwner {
    emit OwnerSet(owner, newOwner);
    owner = newOwner;
  }

  function getOwner() external view returns (address, address) {
    return (owner, owner);
  }
}