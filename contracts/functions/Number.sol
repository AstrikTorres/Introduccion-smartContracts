// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Number {
    int public number = 2;

    // private: this function used only in this contract
    function getNumber() private returns(int n) {
        return number;
    }    

    function changeNumber() public returns(int n) {
        number = getNumber() * getNumber();
        return number;
    }

    function resetNumber() public returns(int n) {
        number = 2;
        return number;
    }
}