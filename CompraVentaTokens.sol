// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    receive() external payable{}
    //numero de tokens por ETH
    uint256 FACTOR = 50;
    constructor() ERC20("MyToken", "MTK") {    
    }

    function compraToken() public payable {
        payable(address(this)).transfer(msg.value);
        _mint(msg.sender, msg.value * FACTOR);
    }
    function saldoContrato() public view returns(uint256) {
       return(address(this).balance);
    }
    function ventaToken(uint256 cantidad) public {
        payable(msg.sender).transfer(cantidad * 10 ** decimals() / FACTOR);
        transfer(address(this),cantidad * 10 ** decimals());
}
}
