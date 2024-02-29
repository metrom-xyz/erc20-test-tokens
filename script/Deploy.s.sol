// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "src/DrippableERC20Token.sol";

contract Deploy is Script {
    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        DrippableERC20Token _aToken = new DrippableERC20Token("A token", "AAA", 18);
        console2.log("A token deployed at address: ", address(_aToken));

        DrippableERC20Token _bToken = new DrippableERC20Token("B token", "BBB", 6);
        console2.log("B token deployed at address: ", address(_bToken));

        DrippableERC20Token _cToken = new DrippableERC20Token("C token", "CCC", 0);
        console2.log("C token deployed at address: ", address(_cToken));

        vm.stopBroadcast();
    }
}
