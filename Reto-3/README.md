# EVM puzzles

Una colección de puzzles de EVM. Cada puzzle consiste en enviar una transacción exitosa a un contrato. Se proporciona el bytecode del contrato, y hay que rellenar los datos de la transacción que no revertirán la ejecución.

## How to play

Clone this repository and install its dependencies (`npm install` or `yarn`). Then run:

```
npx hardhat play
```

And the game will start.

In some puzzles you only need to provide the value that will be sent to the contract, in others the calldata, and in others both values.

You can use [`evm.codes`](https://www.evm.codes/)'s reference and playground to work through this.
