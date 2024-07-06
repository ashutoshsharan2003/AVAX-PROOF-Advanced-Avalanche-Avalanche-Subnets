// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Vault {
    using SafeMath for uint256;

    IERC20 public gameToken;
    mapping(address => uint256) public deposits;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    constructor(address _gameToken) {
        gameToken = IERC20(_gameToken);
    }

    function deposit(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        gameToken.transferFrom(msg.sender, address(this), _amount);
        deposits[msg.sender] = deposits[msg.sender].add(_amount);
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        require(deposits[msg.sender] >= _amount, "Insufficient balance");
        deposits[msg.sender] = deposits[msg.sender].sub(_amount);
        gameToken.transfer(msg.sender, _amount);
        emit Withdraw(msg.sender, _amount);
    }
}
