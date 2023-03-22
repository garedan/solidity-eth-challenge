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

}