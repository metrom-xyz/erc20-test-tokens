// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/DrippableERC20Token.sol";

contract CounterTest is Test {
    function testIntantiate() public {
        string memory _name = "Name";
        string memory _symbol = "SYMBOL";
        uint8 _decimals = 18;

        DrippableERC20Token _token = new DrippableERC20Token(
            _name,
            _symbol,
            _decimals
        );

        assertEq(_token.name(), _name);
        assertEq(_token.symbol(), _symbol);
        assertEq(_token.decimals(), _decimals);
    }

    function testDrip() public {
        uint8 _decimals = 18;
        DrippableERC20Token _token = new DrippableERC20Token(
            "Name",
            "SYMBOL",
            _decimals
        );
        uint256 _requestedAmount = 10;
        _token.drip(_requestedAmount);
        assertEq(_token.balanceOf(address(this)), _requestedAmount * 10 ** _decimals);
    }

    function testDripZeroDecimals() public {
        uint8 _decimals = 0;
        DrippableERC20Token _token = new DrippableERC20Token(
            "Name",
            "SYMBOL",
            _decimals
        );
        uint256 _requestedAmount = 10;
        _token.drip(_requestedAmount);
        assertEq(_token.balanceOf(address(this)), _requestedAmount);
    }
}
