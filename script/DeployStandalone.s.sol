// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "src/DrippableERC20Token.sol";

contract DeployStandalone is Script {
    function run(string calldata _name, string calldata _symbol, uint8 _decimals) public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        DrippableERC20Token _token = new DrippableERC20Token(
            _name,
            _symbol,
            _decimals
        );
        console2.log("Token deployed at address: ", address(_token));

        vm.stopBroadcast();
    }
}
