//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Al momento del deploy hay que cargar nombre y simbolo
contract Token is ERC20{
    constructor(string memory nombre, string memory simbolo) ERC20(nombre, simbolo) {
        _mint(msg.sender, 1000);
    }

}
