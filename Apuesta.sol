//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Apuesta {
    uint256 public pozoTotal;
    address payable public ganador;
    uint256 public importeMayor;

    receive() external payable {
    }

    function acumular() public payable {
        pozoTotal += msg.value;
        if(msg.value > importeMayor) {
            importeMayor = msg.value;
            ganador = payable(msg.sender);
        }
        if(pozoTotal > 10 ether) {
         ganador.transfer(pozoTotal);
         pozoTotal = 0;
         ganador = payable(address(0));
         importeMayor = 0;
        }
    }
}
