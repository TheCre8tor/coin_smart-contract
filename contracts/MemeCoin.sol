// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MemeCoin is ERC20, Ownable, ERC20Burnable {
    event TokensBurned(address indexed owner, uint256 amount, string message);
    event TokensMinted(address indexed owner, uint256 amount, string message);
    event AdditionalTokensMinted(
        address indexed owner,
        uint256 amount,
        string message
    );

    constructor() ERC20("FoxCoin", "FXC") {
        _mint(msg.sender, 1000 * 10**decimals());

        emit TokensMinted(
            msg.sender,
            1000 * 10**decimals(),
            "Initial supply of tokens minted."
        );
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);

        emit AdditionalTokensMinted(
            msg.sender,
            amount,
            "Additional tokens minted."
        );
    }

    function burn(uint256 amount) public override onlyOwner {
        _burn(msg.sender, amount);

        emit TokensBurned(msg.sender, amount, "Tokens burned");
    }
}
