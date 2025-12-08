// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ExampleMapping {

    mapping (address => uint) public balances;

    function sendMoney() public payable  {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public  {
        uint balanceToSendOut = balances[msg.sender];
        balances[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }

}