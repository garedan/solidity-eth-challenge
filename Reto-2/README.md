### Reto Smart Contract Standards - Platzi - ETH Dev Program

#### Descripción:

De la lista de Smart Contracts Weekness Clasification, selecciona 2 vulnerabilidades
que te parecieron interesantes y describe la o las soluciones propuestas.

Implementa un contrato inteligente que use la libreria de contratos de OpenZeppelin,
debe utilizar alguno de los contratos que implementa un estandar ERC y un contrato
adicional de tu preferencia de la librería, describe porque elegiste estos contratos.

#### Criterio de aceptación:

[x] Documento especificando las vulnerabilidades seleccionadas y sus soluciones<br/>
[x] Link a repositorio de github con la implementacion de una de las soluciones<br/>
&emsp;[x] Contrato<br/>
&emsp;[x] Pruebas<br/>
&emsp;[x] Descripcion de la elección



[Smart Contract Weakness Classification and Test Cases](https://swcregistry.io/)


#### Vulnerabilidades seleccionadas y sus soluciones

[SWC-135 - Code With No Effects](https://swcregistry.io/docs/SWC-135)

##### Descripción
En Solidity, es posible escribir código que no produce los efectos previstos. Actualmente, el compilador de Solidity no devuelve una advertencia para el código sin efectos. Esto puede conducir a la introducción de código "muerto" que no realiza correctamente una acción prevista.

Por ejemplo, es fácil pasar por alto los paréntesis finales en `msg.sender.call.value(address(this).balance)("");`, lo que podría llevar a que una función proceda sin transferir fondos a msg.sender. Aunque esto debería evitarse comprobando el valor de retorno de la llamada.

##### Solución
Es importante asegurarse cuidadosamente de que su contrato funciona según lo previsto. Escriba pruebas unitarias para verificar el comportamiento correcto del código.

##### Ejemplos de contratos

deposit_box.sol
```javascript
pragma solidity ^0.5.0;

contract DepositBox {
    mapping(address => uint) balance;

    // Accept deposit
    function deposit(uint amount) public payable {
        require(msg.value == amount, 'incorrect amount');
        // Debería actualizar el saldo del usuario
        balance[msg.sender] == amount;
    }
}
```

deposit_box_fixed.sol
```javascript
pragma solidity ^0.5.0;

contract DepositBox {
    mapping(address => uint) balance;

    // Accept deposit
    function deposit(uint amount) public payable {
        require(msg.value == amount, 'incorrect amount');
        // Debería actualizar el saldo del usuario
        balance[msg.sender] = amount;
    }
}
```


[SWC-123 - Requirement Violation](https://swcregistry.io/docs/SWC-123)


##### Descripción
La construcción require() de Solidity está pensada para validar entradas externas de una función. En la mayoría de los casos, estas entradas externas son proporcionadas por los invocadores, pero también pueden ser devueltas por los invocadores. En el primer caso, nos referimos a ellas como violaciones de precondiciones. El incumplimiento de un requisito puede indicar uno de los dos problemas siguientes:

1. Existe un error en el contrato que proporcionó la entrada externa.
2.  La condición utilizada para expresar el requisito es demasiado estricta.

##### Solución
Si la condición lógica requerida es demasiado fuerte, debe debilitarse para permitir todas las entradas externas válidas.

De lo contrario, el fallo debe estar en el contrato que proporciona la entrada externa y se debe considerar la posibilidad de arreglar su código asegurándose de que no se proporcionan entradas no válidas.

##### Ejemplos de contratos

requirement_simple.sol
```javascript
pragma solidity ^0.4.25;

contract Bar {
    Foo private f = new Foo();
    function doubleBaz() public view returns (int256) {
        return 2 * f.baz(0);
    }
}

contract Foo {
    function baz(int256 x) public pure returns (int256) {
        require(0 < x);
        return 42;
    }
}
```

requirement_simple_fixed.sol
```javascript
pragma solidity ^0.4.25;

contract Bar {
    Foo private f = new Foo();
    function doubleBaz() public view returns (int256) {
        return 2 * f.baz(1); //Cambia el contrato externo para no chocar con el requisito excesivo.
    }
}

contract Foo {
    function baz(int256 x) public pure returns (int256) {
        require(0 < x); //También puedes arreglar el contrato cambiando la entrada al tipo uint y eliminando el require
        return 42;
    }
}
```


### Contrato

[MiTokenFungible - Implementa ERC20 y Ownable](https://github.com/garedan/solidity-eth-challenge/blob/main/Reto-2/contracts/MiTokenFungible.sol)

### Test

[Test - ERC20](https://github.com/garedan/solidity-eth-challenge/blob/main/Reto-2/test/MiTokenFungible.test.js)

### Contratos de OpenZeppelin seleccionados 

`ERC20` y `Ownable`

#### Motivo de la elección
Hace solo hace 2 semanas que empece a interiorizarme en el mundo de Solidity, Ethereum, etc. Por lo tanto me parecieron los más fáciles de comprender y ademas se vieron ejemplos en algunos cursos de la ruta de aprendizaje de Solidity Blockchain Developer de Platzi. 


[Repositorio del reto (este)](https://github.com/garedan/solidity-eth-challenge/tree/main/Reto-2)


Nota: faltaría testear el contrato Ownable, pero todavía no pude lograrlo. Sigo leyendo y probando. 