// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Sum {
    int number = 10

    // pure functions: don't can write or reed variables
    // This function not compile 
    function multipliedFor10(int a) public pure returns(int result) {
        result = a * number;
    }
}