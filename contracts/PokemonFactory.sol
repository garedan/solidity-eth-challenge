// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

  struct Pokemon {
    uint id;
    string name;
  }

  struct Habilities {
    string name;
    string description;
  }

    event eventNewPokemon(address editor, string name);

    Pokemon[] private pokemons;

    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;
    mapping(uint => mapping(uint => Habilities)) public pokemonHabilities;

     function createPokemon (string memory _name, uint _id) public {
        require(_id>0, "La id debe ser mayor que 0");
        require(bytes(_name).length>0 && bytes(_name).length>2, "El nombre no puede estar vacio o debe tener al menos 2 caracteres");
        pokemons.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(msg.sender, _name);
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
      return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
   }

}


/**
Reto #1
Investigar que son los Events en Solidity. Luego, debes implementar un evento que se llame 
eventNewPokemon, el cual se disparará cada vez que un nuevo Pokemon es creado. Lo que emitirá 
el evento será el Pokemon que se creó.



Reto #2
Investigar sobre “”require” .
Entonces, antes de agregar un nuevo Pokemon, se debe validar que el id sea mayor a 0. 
De lo contrario, se debe desplegar un mensaje que corrija al usuario.
Entonces, antes de agregar un nuevo Pokemon, se debe validar que el name no sea vació y mayor 
a 2 caracteres. De lo contrario, se debe desplegar un mensaje que corrija al usuario.


Reto #3
Los Pokemons han evolucionado, ahora tienen una lista de habilidades (Habilities). Es decir, un Pokemon puede tener 1 ó muchas habilidades, cada habilidad tiene el siguiente formato: - Name - Description
 */