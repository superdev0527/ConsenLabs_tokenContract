// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "./upgrade_proxy/TransparentUpgradeableProxy.sol";

contract xLON is TransparentUpgradeableProxy {
    constructor(
        address _logic,
        address _admin,
        bytes memory _data
    ) payable TransparentUpgradeableProxy(_logic, _admin, _data) {}
}
