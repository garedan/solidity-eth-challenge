// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;  // especifica la version de Solidity usada en el contrato

contract MyContract {
    // variables de estado
    uint256 public myVariable;

    // eventos
    event MyEvent(uint256 indexed myValue);

    // constructor
    constructor(uint256 initialValue) {
        myVariable = initialValue;
    }

    // funciones
    function setVariable(uint256 newValue) public {
        myVariable = newValue;
        emit MyEvent(myVariable);
    }
}