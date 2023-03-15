const { expect } = require("chai");

describe("Pokemon contract", function () {
    it("Pokemon Factory shouldn't pokemons", async function () {

        //const [owner] = await ethers.getSigners(); // Esto lo ocuparán para crear un pokemon

        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");

        const hardhatPokemon = await PokemonFactory.deploy();

        const pokemons = await hardhatPokemon.getAllPokemons();

        expect(pokemons.length).to.equal(0);

    });

    it("Pokemon Factory must have 2 pokemons", async function () {
        const [owner] = await ethers.getSigners(); 
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");

        const hardhatPokemon = await PokemonFactory.deploy();

        
        await hardhatPokemon.createPokemon("dany", 1);
        await hardhatPokemon.createPokemon("test", 2);
        
        const pokemons = await hardhatPokemon.getAllPokemons();

        expect(pokemons.length).to.equal(2);
    });
});