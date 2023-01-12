// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import { PermanentStorage } from "contracts/PermanentStorage.sol";
import "test/utils/Addresses.sol";

contract RegisterCurveIndexes is Addresses {
    address[] COMPOUND_POOL_UNDERLYING_COINS;
    address[] COMPOUND_POOL_COINS;
    bool constant COMPOUND_POOL_SUPPORT_GET_DX = true;

    address[] USDT_POOL_UNDERLYING_COINS;
    address[] USDT_POOL_COINS;
    bool constant USDT_POOL_SUPPORT_GET_DX = true;

    address[] Y_POOL_UNDERLYING_COINS;
    address[] Y_POOL_COINS;
    bool constant Y_POOL_SUPPORT_GET_DX = true;

    address[] C3_POOL_COINS;
    bool constant C3_POOL_SUPPORT_GET_DX = false;

    address[] ANKRETH_POOL_COINS;
    bool constant ANKRETH_POOL_SUPPORT_GET_DX = false;

    address[] TRICRYPTO2POOL_COINS;
    bool constant TRICRYPTO2POOL_SUPPORT_GET_DX = false;

    constructor() {
        COMPOUND_POOL_UNDERLYING_COINS = [DAI_ADDRESS, USDC_ADDRESS];
        COMPOUND_POOL_COINS = [cDAI_ADDRESS, cUSDC_ADDRESS];

        USDT_POOL_UNDERLYING_COINS = [DAI_ADDRESS, USDC_ADDRESS, USDT_ADDRESS];
        USDT_POOL_COINS = [cDAI_ADDRESS, cUSDC_ADDRESS, USDT_ADDRESS];

        Y_POOL_UNDERLYING_COINS = [DAI_ADDRESS, USDC_ADDRESS, USDT_ADDRESS, TUSD_ADDRESS];
        Y_POOL_COINS = [yDAI_ADDRESS, yUSDC_ADDRESS, yUSDT_ADDRESS, yTUSD_ADDRESS];

        C3_POOL_COINS = [DAI_ADDRESS, USDC_ADDRESS, USDT_ADDRESS];

        ANKRETH_POOL_COINS = [ETH_ADDRESS, ANKRETH_ADDRESS];

        TRICRYPTO2POOL_COINS = [USDT_ADDRESS, WBTC_ADDRESS, WETH_ADDRESS];
    }

    function _registerCurveIndexes(PermanentStorage pm) internal {
        // register Compound pool
        pm.setCurvePoolInfo(CURVE_COMPOUND_POOL_ADDRESS, COMPOUND_POOL_UNDERLYING_COINS, COMPOUND_POOL_COINS, COMPOUND_POOL_SUPPORT_GET_DX);

        // register USDT pool
        pm.setCurvePoolInfo(CURVE_USDT_POOL_ADDRESS, USDT_POOL_UNDERLYING_COINS, USDT_POOL_COINS, USDT_POOL_SUPPORT_GET_DX);

        // register Y pool
        pm.setCurvePoolInfo(CURVE_Y_POOL_ADDRESS, Y_POOL_UNDERLYING_COINS, Y_POOL_COINS, Y_POOL_SUPPORT_GET_DX);

        // register 3 pool
        pm.setCurvePoolInfo(CURVE_3_POOL_ADDRESS, new address[](0), C3_POOL_COINS, C3_POOL_SUPPORT_GET_DX);

        // register ANKRETH pool
        pm.setCurvePoolInfo(CURVE_ANKRETH_POOL_ADDRESS, new address[](0), ANKRETH_POOL_COINS, ANKRETH_POOL_SUPPORT_GET_DX);

        // register tricrypto2 pool
        pm.setCurvePoolInfo(CURVE_TRICRYPTO2_POOL_ADDRESS, new address[](0), TRICRYPTO2POOL_COINS, TRICRYPTO2POOL_SUPPORT_GET_DX);
    }
}
