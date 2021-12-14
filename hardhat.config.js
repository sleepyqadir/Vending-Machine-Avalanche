require('@nomiclabs/hardhat-waffle');
require('hardhat-abi-exporter');

// Replace this private key with your Fuji wallet private key
const FUJI_PRIVATE_KEY = '';

// Replace this with your Datahub api key
const DATAHUB_API_KEY = '8a5b1c4d45e9090910c299e8993ae7cc';

module.exports = {
  solidity: '0.7.3',
  abiExporter: {
    path: './abi/',
    clear: true,
  },
  networks: {
    fuji: {
      url: `https://avalanche--fuji--rpc.datahub.figment.io/apikey/${DATAHUB_API_KEY}/ext/bc/C/rpc`,
      accounts: [`0x${FUJI_PRIVATE_KEY}`],
    },
  },
};