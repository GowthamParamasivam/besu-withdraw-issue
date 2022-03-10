// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract WithdrawTest {

    event CurrencyFromContractTransferred(address toAddress, uint amount);
    
    constructor() {}

    receive() external payable {}

    /**
     * @dev Recover Currency from the contract address by owner
     *
     * Requirements:
     * - @param user cannot be the zero address.
     * - @param amount cannot be greater than balance.
     * 
     * Emits a {CurrencyFromContractTransferred} event.
     */
    function withdrawCurrencyFromContract(address user, uint256 amount) external {
        require(user != address(0), "Address cant be zero address");
        require(amount <= address(this).balance, "Amount exceeds balance");
        address payable _owner = payable(user);        
        _owner.transfer(amount);
        emit CurrencyFromContractTransferred(user, amount);
    }
}