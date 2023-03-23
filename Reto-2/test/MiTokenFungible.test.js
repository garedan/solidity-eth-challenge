const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MiTokenFungible tests", function() {
  before(async function() {
    const availableSigners = await ethers.getSigners();
    this.deployer = availableSigners[0];
    otherAccount = availableSigners.slice(1);

    const PlatziToken = await ethers.getContractFactory("MiTokenFungible");
    this.platziToken = await PlatziToken.deploy();
    await this.platziToken.deployed();
  });

  it('Should be named Mi Token Fungible', async function() {
    const fetchedTokenName = await this.platziToken.name();
    expect(fetchedTokenName).to.be.equal("Mi Token Fungible");
  });

  it('Should have symbol "MTF"', async function() {
    const fetchedTokenSymbol = await this.platziToken.symbol();
    expect(fetchedTokenSymbol).to.be.equal("MTF");
  });


});