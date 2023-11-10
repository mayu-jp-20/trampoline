import { HardhatRuntimeEnvironment } from 'hardhat/types';
import { DeployFunction } from 'hardhat-deploy/types';
import config from '../src/exconfig';
import fs from 'fs';

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const accounts = await hre.getUnnamedAccounts();
  console.log(accounts[0]);
  await hre.deployments.deploy('Greeter', {
    from: accounts[0],
    deterministicDeployment: true,
    args: ['test'],
    log: true,
  });
};
export default func;
