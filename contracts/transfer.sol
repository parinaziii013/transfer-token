// SPDX-License-Identifier: MIT

/**This contract transfers token .
Enter the Value, Deploy it, Enter the address and value**/

pragma solidity ^0.8.0;


contract Transfer {
    address owner; //person who transfers the token
    uint value; //the amount of Transfer contract {


    constructor() payable {
        value = msg.value;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        
        //only the owner can call withdraw function
        require(msg.sender == owner, "Choose the Message Sender Address");
        _;
    }

    function withdraw(address payable _address, uint _value) public onlyOwner  {

        //transfer _value to _address;
        _address.transfer(_value);

        //if  entered the owner address, make an error;
        if (_address == msg.sender){
            revert("Unable for owner");
        }
    }


}