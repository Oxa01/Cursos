// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    receive() external payable{}
    //numero de tokens por ETH
    uint256 FACTOR = 50;
    constructor() ERC20("MyToken", "MTK") {    
    }
    // esta funcion mintea tokens a cambio de ETH
    function compraToken() public payable {
        payable(address(this)).transfer(msg.value);
        _mint(msg.sender, msg.value * FACTOR);
    }
    function saldoContrato() public view returns(uint256) {
       return(address(this).balance);
    }
    //esta funcion permite que los usuarios vendan tokens al contrato a cambio de ETH
    function ventaToken(uint256 cantidad) public {
        payable(msg.sender).transfer(cantidad * 10 ** decimals() / FACTOR);
        transfer(address(this),cantidad * 10 ** decimals());
}
}
