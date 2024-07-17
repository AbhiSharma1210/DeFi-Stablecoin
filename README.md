## Stabecoin


### About
This project is a stablecoin where users can deposit WETH and WBTC in exchange for a token that will be pegged to the USD.

### Requirements
1. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
2. [foundry](https://getfoundry.sh/)
3. [Openzeppelin](https://www.openzeppelin.com/)

#### Note:
I have used openzeppelin-contracts version 4.8.3 since the ERC20Mock have changes in it.

### Objectives
1. (Relative Stability) Anchored or Pegged to USD.
    1. Utilize Chainlink Price Feed.
    2. Set a function to exchange ETH & BTC to USD.
2. Stability Mechanism (Minting): Algorithmic (Decentralized)
    1. People can only mint the stablecoin with enough collateral (coded)
    2. The code is set in a way that the Stablecoin is almost always overcollateralized. 
3. Collateral type: Exogenous (crypto)
    1. wETH
    2. wBTC