// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;
pragma abicoder v2;

import "contracts-test/forkMainnet/AMMWrapperWithPath/Setup.t.sol";
import "contracts-test/utils/BalanceSnapshot.sol";
import "contracts-test/utils/AMMUtil.sol"; // Using the Encode Data function

contract TestAMMWrapperWithPathTradeCurveV1 is TestAMMWrapperWithPath {
    using BalanceSnapshot for BalanceSnapshot.Snapshot;

    function testTradeCurveV1() public {
        uint256 feeFactor = 0;
        AMMLibEIP712.Order memory order = DEFAULT_ORDER;
        order.makerAddr = CURVE_USDT_POOL_ADDRESS;
        bytes memory sig = _signTrade(userPrivateKey, order);
        address[] memory path = new address[](0);
        bytes memory makerSpecificData = _encodeCurveData(1);
        bytes memory payload = _genTradePayload(order, feeFactor, sig, makerSpecificData, path);

        BalanceSnapshot.Snapshot memory userTakerAsset = BalanceSnapshot.take(user, order.takerAssetAddr);
        BalanceSnapshot.Snapshot memory userMakerAsset = BalanceSnapshot.take(user, order.makerAssetAddr);

        userProxy.toAMM(payload);

        userTakerAsset.assertChange(-int256(order.takerAssetAmount));
        userMakerAsset.assertChangeGt(int256(order.makerAssetAmount));
    }
}
