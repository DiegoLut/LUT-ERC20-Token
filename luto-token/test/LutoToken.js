const { expect } = require('chai')
const { ethers } = require('hardhat')
const hre = require('hardhat')

describe('LutoToken contract', function () {
	let Token
	let lutoToken
	let owner
	let addr1
	let addr2
	let tokenCap = 100000000
	let tokenBlockReward = 50

	this.beforeEach(async function () {
		Token = await ethers.getContractFactory('LutoToken')
		;[owner, addr1, addr2] = await hre.ethers.getSigners()

		lutoToken = await Token.deploy(tokenCap, tokenBlockReward)
	})
	describe('Deployment', function () {
		it('Should set the right owner', async function () {
			expect(await lutoToken.owner()).to.equal(owner.address)
		})

		it('Should assign total supply of tokens to owner', async function () {
			const ownerBalance = await lutoToken.balanceOf(owner.address)
			expect(await lutoToken.totalSupply()).to.equal(ownerBalance)
		})

		it('Should set the max capped supply to the argument provided during deployment', async function () {
			const cap = await lutoToken.cap()
			expect(Number(hre.ethers.utils.formatEther(cap)).to.equals(tokenCap))
		})
	})
})
