//contracts/LutoToken.sol
//SPDX-License-Identifier: MIT
/*
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract LutoToken is ERC20Capped { //no need to pass ERC20 and ERC20Capped bcs ERC20 is included in ERC20Capped

    address payable public owner;
    uint256 public blockReward;

    constructor(uint256 cap, uint256 reward) ERC20("LutoToken", "LUT") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 50000000 * (10 ** decimals())); //initialSuplay  50 milion tokens
        blockReward = reward * (10 ** decimals());
    }

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        //  to != block.coinbase --> check if address of miner is not the same as address to ,it prevents miner from self rewarding
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)) {
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    modifier onlyOwner {
        require(msg.sender = owner, "Only owner can access this function");
        _;
    }
}*/