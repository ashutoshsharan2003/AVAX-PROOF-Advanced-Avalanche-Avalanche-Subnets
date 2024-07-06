# GameToken 
This Solidity project implements ERC20 tokens for "GameToken" and "Token" in the GameToken. Players can deposite token,withdraw token,purchaseGems, and redeemGems.

## Contracts Overview
>>Contract 1: GameToken
>>Description: ERC20 token contract for Gametoken.
>>Function:
`constructor`(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) : This is the constructor function of the GameToken contract. It takes three parameters:
1. name: The name of the token (e.g., "Game Token")
2. symbol: The symbol of the token (e.g., "GT")
3. initialSupply: The initial supply of tokens to be minted.This `burn()` will be needed to defined in IERC20 interface in vault.sol


>>Contract 2: Token 
>>Description: ERC20 token contract for Token.
>>Function:
`constructor`(address _gameToken) : This is the constructor function of the Gems contract. It takes one parameter, _gameToken, which is the address of the ERC20 token contract.This `burn()` will be needed to defined in IERC20 interface in vault.sol

`function purchaseTokens`(uint256 _amount) public : This function allows players to purchase game tokens.
1. It checks that the _amount is greater than 0.
2. It checks that the player has a sufficient balance of game tokens to transfer.
3. It transfers the game tokens from the player's address to the Gems contract address using the transferFrom function.
4. It updates the playerTokens mapping to reflect the new token balance.
5. It emits the TokensPurchased event.

`function redeemTokens`(uint256 _amount) public : This function allows players to redeem their game tokens.
1. It checks that the _amount is greater than 0.
2. It checks that the player has a sufficient balance of tokens to redeem.
3. It updates the playerTokens mapping to reflect the new token balance.
4. It transfers the game tokens from the Gems contract address to the player's address using the transfer function.
5. It emits the TokensRedeemed event.


>>Contract 3: Vault
>>Description: ERC20 token contract for Gametoken.
>>Function:
`constructor`(address _gameToken) : This is the constructor function of the Vault contract. It takes one parameter, _gameToken, which is the address of the ERC20 token contract.

`function deposit`(uint256 _amount) public : This function allows users to deposit game tokens into the Vault.

1. It checks that the _amount is greater than 0.
2. It transfers the game tokens from the user's address to the Vault contract address using the transferFrom function.
3. It updates the deposits mapping to reflect the new deposit amount.
4. It emits the Deposit event.

`function withdraw`(uint256 _amount) public : This function allows users to withdraw their deposited game tokens from the Vault.

1. It checks that the _amount is greater than 0.
2. It checks that the user has a sufficient balance of deposited tokens to withdraw.
3. It updates the deposits mapping to reflect the new deposit amount.
4. It transfers the game tokens from the Vault contract address to the user's address using the transfer function.
5. It emits the Withdraw event.


>>NOTE- add this function in IERC20.sol by ctrl +click on IERC20.sol in imported openzipline file.
function burn(uint amount,address _of)external;
This smart contract is deployed on avalanche subnet.


### Getting Started

Prerequisites:
Avalanche subnet deployed and wallet imported in metamask.
Deployment:
Compile and deployment of contracts:

1. Deploy your avalanche subnet.
2. open remix IDE.
3. create new folder GameToken.
4. copy and paste GameToken.sol, Token.sol, Vault.sol into it.
5. Compile all three contracts and switch to avalance subnet network in metamask.
6. Select Injected metamask and deploy Vault and Token contracts individually then using its address deploy vault contract. deploy all 3 using the same wallet account.


#### Interaction
1. Open the deployed contracts in remix IDE.
2. Select the deployed contract and click on the "Use" button.
3. Click on the "Deploy" button to deploy the contract.
4. Click on the "At Address" button to interact with the deployed contract.

>>`GameToken`Contract
The GameToken contract is an ERC20 token contract that allows for the creation of a new token with a specified name, symbol, and initial supply. When the contract is deployed, the initial supply of tokens is minted and assigned to the address that deployed the contract. The GameToken contract provides the following functionality:

1. Token Creation: The contract allows for the creation of a new ERC20 token with a specified name, symbol, and initial supply.
2. Token Minting: The initial supply of tokens is minted and assigned to the contract deployer's address.

>>`Vault` Contract And `GameToken` Contract
The Vault contract is designed to interact with the GameToken contract. It allows users to deposit and withdraw the gameToken tokens. The Vault contract provides the following functionality:

1. Token Deposit: Users can deposit their gameToken tokens into the Vault contract. The contract keeps track of the deposited amounts for each user.
2. Token Withdrawal: Users can withdraw their deposited gameToken tokens from the Vault contract.

The interaction between the GameToken and Vault contracts can be summarized as follows:

1. The GameToken contract is deployed, and the initial supply of tokens is minted and assigned to the contract deployer's address.
2. The Vault contract is deployed, and it is initialized with the address of the GameToken contract.
    Users can interact with the Vault contract to deposit their gameToken tokens.
    >> The Vault contract uses the transferFrom function of the GameToken contract to transfer the tokens from the user's address to the Vault contract.
    >>The Vault contract updates the user's deposit balance in the deposits mapping.
    Users can interact with the Vault contract to withdraw their deposited gameToken tokens.
    >>The Vault contract checks the user's deposit balance and transfers the requested amount of tokens from the Vault contract to the user's address using the transfer function of the GameToken contract.

##### Author 
Ashutosh Sharan
(https://www.linkedin.com/in/ashutosh-sharan-177630249/)
