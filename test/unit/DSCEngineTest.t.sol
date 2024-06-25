// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract DSCEngineTest is Test {
    DeployDSC deployer;
    DecentralizedStableCoin dsc;
    DSCEngine dscEngine;
    HelperConfig public config;

    address ethUsdPriceFeed;
    address weth;
    address public USER = makeAddr("user");

    uint256 public constant AMOUNT_COLLATERAL = 10 ether;
    uint256 public constant STARTING_ERC20_BALANCE = 10 ether;
    // error Failed__testGet_usd_value();

    function setUp() public {
        deployer = new DeployDSC();
        (dsc, dscEngine, config) = deployer.run();
        (ethUsdPriceFeed,, weth,,) = config.activeNetworkConfig();

        // Minting the USER
        ERC20Mock(weth).mint(USER, STARTING_ERC20_BALANCE);
    }

    /////////////////
    // Price Tests //
    /////////////////
    function testGet_Usd_Value() public view {
        uint256 ethAmount = 15e18;
        // 15e18 * 3374/ETH = 30,000e18;
        uint256 expectedUsd = 30000e18;
        uint256 actualUsd = dscEngine.getUsdValue(weth, ethAmount);
        console.log("expectedUsd: ", expectedUsd);
        console.log("actualUsd: ", actualUsd);
        assertEq(expectedUsd, actualUsd);
        // assert(expectedUsd == actualUsd); // Use this if assertEq fails or do `foundryup` and re-run the test.
        // bytes32 expected = keccak256(abi.encodePacked(expectedUsd));
        // bytes32 actual = keccak256(abi.encodePacked(actualUsd));
        // assertEq(expected, actual);
    }

    /////////////////////////////
    // Deposit Collateral Test //
    /////////////////////////////
    function testReverts_If_Collateral_Zero() public {
        vm.startPrank(USER);
        ERC20Mock(weth).approve(address(dscEngine), AMOUNT_COLLATERAL);

        vm.expectRevert(DSCEngine.DSCEngine__AmountMoreThanZero.selector);
        dscEngine.depositCollateral(weth, 0);
        vm.stopPrank();
    }
}
