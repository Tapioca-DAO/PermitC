// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.22;

contract ContractMock {
    constructor() {}

    fallback() external payable {}
    receive() external payable {}
}
