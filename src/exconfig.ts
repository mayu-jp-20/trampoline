import { EVMNetwork } from './pages/Background/types/network';

// eslint-disable-next-line import/no-anonymous-default-export
export default {
  enablePasswordEncryption: false,
  showTransactionConfirmationScreen: true,
  factory_address: '0x63B05f624Ce478D724aB4390D92d3cdF4e731f1a',//0x9406Cc6185a346906296840746125a0E44976454
  stateVersion: '0.1',
  network: {
    chainID: '11155111',
    family: 'EVM',
    name: 'Sepolia',
    provider: 'https://sepolia.infura.io/v3/3b139c6a8be042f5bd93ac8404153516',
    entryPointAddress: '0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789',
    bundler: 'https://sepolia.voltaire.candidewallet.com/rpc',
    baseAsset: {
      symbol: 'ETH',
      name: 'ETH',
      decimals: 18,
      image:
        'https://ethereum.org/static/6b935ac0e6194247347855dc3d328e83/6ed5f/eth-diamond-black.webp',
    },
  } satisfies EVMNetwork,
};
