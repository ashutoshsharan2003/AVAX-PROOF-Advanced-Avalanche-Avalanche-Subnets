// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Gems {
    using SafeMath for uint256;

    IERC20 public gameToken;
mapping(address => uint256) public playerTokens;

event TokensPurchased(address indexed player, uint256 amount);
event TokensRedeemed(address indexed player, uint256 amount);

constructor(address _gameToken) {
    gameToken = IERC20(_gameToken);
}

function purchaseTokens(uint256 _amount) public {
    require(_amount > 0, "Amount must be greater than 0");
    require(gameToken.balanceOf(msg.sender) >= _amount, "Insufficient game tokens");

    bool success = gameToken.transferFrom(msg.sender, address(this), _amount);
    require(success, "Token transfer failed");

    playerTokens[msg.sender] = playerTokens[msg.sender].add(_amount);
    emit TokensPurchased(msg.sender, _amount);
}

function redeemTokens(uint256 _amount) public {
    require(_amount > 0, "Amount must be greater than 0");
    require(playerTokens[msg.sender] >= _amount, "Insufficient tokens");

    playerTokens[msg.sender] = playerTokens[msg.sender].sub(_amount);
    bool success = gameToken.transfer(msg.sender, _amount);
    require(success, "Token transfer failed");

    emit TokensRedeemed(msg.sender, _amount);
}
}