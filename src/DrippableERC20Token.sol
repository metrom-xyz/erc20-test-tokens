pragma solidity ^0.8.13;

import "solmate/tokens/ERC20.sol";

/// SPDX-License-Identifier: GPL-3.0-or-later
/// @title Drippable ERC20 token
/// @notice A simple drippable ERC20 token to be used in tests.
/// @author Federico Luzzi - <federico.luzzi@protonmail.com>
contract DrippableERC20Token is ERC20 {
    uint256 internal immutable multiplier;

    constructor(string memory _name, string memory _symbol, uint8 _decimals) ERC20(_name, _symbol, _decimals) {
        multiplier = 10 ** _decimals;
    }

    /// @notice Drips some tokens to the caller. Input the amount
    /// you want and the contract will handle scaling using the token's
    /// decimals internally, no need to convert manually before calling.
    /// @param _amount The amount of tests tokens you want. The contract handles
    /// scaling internally, so type the exact amount you want without
    /// manual scaling.
    function drip(uint256 _amount) external {
        _mint(msg.sender, _amount * multiplier);
    }
}
