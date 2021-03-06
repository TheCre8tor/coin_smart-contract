// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

async function main() {
  const [owner] = await ethers.getSigners();
  const contractFactory = await ethers.getContractFactory("MemeCoin");
  const contract = await contractFactory.deploy();

  console.log("MemeCoin Contract deployed to: ", contract.address);
  console.log("MemeCoin Contract owner address: ", owner.address);

  // MemeCoin Contract deployed to:  0x90dA7248c254DeCA331727254B1e6838E8AD599d
  // MemeCoin Contract owner address:  0xfF284E990aDcB4355e0950842BE65ca7348a7B19
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
