//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Notas {
    mapping(address => uint8[]) notas;
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
 // solo el dueño del contrato puede cargar notas   
    function cargaNota(address alumno, uint8 nota) public onlyOwner {
    notas[alumno].push(nota);
    }
// en este caso cualquiera puede pedir el promedio de un alumno
    function promedio(address alumno) public view returns(uint8) {
        require(notas[alumno].length > 0, "no tiene notas");
        uint8 suma;
        for (uint i = 0; i < notas[alumno].length; i++) {
            suma += notas[alumno][i];
        }
        return uint8(suma / notas[alumno].length);
    }
    modifier onlyOwner {
        require(msg.sender == owner, "usuario no autorizado");
        _;
    }
}
