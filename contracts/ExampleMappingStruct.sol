// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WalletWithStructMapping {
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numberOfDeposits;
        mapping (uint => Transaction) deposits;
        uint numberOfWithdrawls;
        mapping (uint => Transaction) withdraws;
    }

    mapping (address => Balance) public balances;

    function despositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numberOfDeposits] = deposit;
        balances[msg.sender].numberOfDeposits += 1;
    }

    function withdrawMoney(address payable  _to, uint256 _amount) public {
        uint256 balance = balances[msg.sender].totalBalance;

        require(balance >= _amount, "Insufficient balance");

        balances[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawl = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdraws[balances[msg.sender].numberOfWithdrawls] = withdrawl;
        balances[msg.sender].numberOfWithdrawls += 1;
        _to.transfer(_amount);
    }

}