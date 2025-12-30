// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ExampleSmartContract {
    uint public myUint = 123;

    function setMyUint(uint _newUint) public {
        myUint = _newUint;
    }
}