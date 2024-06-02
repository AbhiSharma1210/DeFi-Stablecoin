// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.20;

/**
 * @title DSCEngine
 * @author Abhinav Sharma
 *
 * The system is designed to be as minimal as possible and maintain 1 token = 1$ peg.
 * This stablecoin has properties:
 *  - Exogeneous Collateral
 *  - Dollar pegged
 *  - Algorithmically Stable
 *
 * It is similar to DAI if DAI had no governance, no fees and was only backed by wETH and wBTC.
 *
 * @notice This contract is the core of the DSC system. It handles all the logic for mining and redeeming DSC, as well as depositing & withdrawing collateral.
 *
 * @notice This contract is VERY loosely based on the MakerDAO DSS (DAI) system.
 */
contract DSCEngine {

}
