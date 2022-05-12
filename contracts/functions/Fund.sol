// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Fund {
    // payable function: functions specify for ether transacts
    function sendEther(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }
}