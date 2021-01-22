var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "";
module.exports = {
  networks: {
      development: {
        host: "127.0.0.1",     
        port: 8545,          
        network_id: "*", 
      },
      ropsten: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/your-api-key");
        },
        network_id: 3,
        gasPrice: 20000000000,
        gas: 3716887
      },
      rinkeby: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/your-api-key");
        },
        network_id: 4,
        gasPrice: 20000000000,
        gas: 3716887
      },
      kovan: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://mainnet.infura.io/v3/d8c89c68aedb483481ac78f89ce698e7");
        },
        network_id: 42,
        gasPrice: 20000000000,
        gas: 3716887
      },
      main: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://mainnet.infura.io/your-api-key");
        },
        network_id: 1,
        gasPrice: 20000000000, 
        gas: 3716887    
      }
  },

  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "0.7.4",    
      // docker: true,     
      // settings: {  
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  }
};
