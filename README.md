# Carrot v1 contracts

This repo contains a drippable ERC20 token implementation plus a deployment
script to easily get test ERC20 tokens in any EVM compatible chain.

The drip function automatically performs any decimal scaling needed so it's very
simple and easy to drip tokens without having to do manual conversions
beforehand.

## Existing deployments

| Symbol | Decimals | [Sepolia](https://sepolia.dev/)                                                                                               | [Scroll alpha testnet](https://guide.scroll.io/)                                                                              | [Scroll Sepolia testnet](https://docs.scroll.io/en/developers/developer-quickstart/)                                                  |
| :----- | -------: | :---------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| AAA    |       18 | [0x279E7154B3ce368045929Dd8e51c15c7f74351bf](https://sepolia.etherscan.io/address/0x279E7154B3ce368045929Dd8e51c15c7f74351bf) | [0x7405769BEfAc397563D976470bdb1B790d26a025](https://blockscout.scroll.io/address/0x7405769BEfAc397563D976470bdb1B790d26a025) | [0x8Ed4b3029f591362411318aEB86EF3EC1fbfe0e5](https://sepolia-blockscout.scroll.io/address/0x8Ed4b3029f591362411318aEB86EF3EC1fbfe0e5) |
| BBB    |        6 | [0x31F6967490204bbAE0763eE26709686b4477477f](https://sepolia.etherscan.io/address/0x31F6967490204bbAE0763eE26709686b4477477f) | [0xcA9b84f307c7E7825C6e9B1da732f0a7e953889D](https://blockscout.scroll.io/address/0xcA9b84f307c7E7825C6e9B1da732f0a7e953889D) | [0x1776bE1f971CB0F758680aCFD2cc5121B474249E](https://sepolia-blockscout.scroll.io/address/0x1776bE1f971CB0F758680aCFD2cc5121B474249E) |
| CCC    |        0 | [0x6fFEbe71762EA02eA490491fa6cab90b2f744787](https://sepolia.etherscan.io/address/0x6fFEbe71762EA02eA490491fa6cab90b2f744787) | [0xb4F8FB8cC48A9Eb8d8E0A530C9775eD06728BaDd](https://blockscout.scroll.io/address/0xb4F8FB8cC48A9Eb8d8E0A530C9775eD06728BaDd) | [0xc325890958D399ee26c26D21bBeFbDA17B03a611](https://sepolia-blockscout.scroll.io/address/0xc325890958D399ee26c26D21bBeFbDA17B03a611) |

Don't see a deployment you need? Deploying the tokens on any given network is
dead simple: just follow the instructions below and open a PR to add your
deployment(s) to the table above.

## DIY deployment

The project is developed with Foundry, so the first step is to have that
installed on your system.

A couple things (such as formatting/commit hooks) are also managed using JS
packages, so you'll need to install the project's dependencies using `npm`.

In order to deploy the test tokens to a target network you can then go ahead and
create a `.env` file exporting the following env variables:

```
export PRIVATE_KEY=""
export ETHERSCAN_API_KEY="" # optional
export BLOCKSCOUT_INSTANCE_URL="" # optional
export RPC_ENDPOINT=""
```

Here's what each env does:

- `PRIVATE_KEY` is private key of the account that will perform the deployment
- `ETHERSCAN_API_KEY` will optionally be used to verify the source code on
  Etherscan
- `BLOCKSCOUT_INSTANCE_URL` will optionally be used to verify the source code on
  Blockscount. This should point to the Blockscount instance you want to verify
  the contracts on.
- `RPC_ENDPOINT` is the RPC endpoint that will be used to broadcast transactions
  (it will also determine the network where the deployment will happen, so pay
  attention).

Once you have the `.env` file ready you can finally execute the following
command to initiate the deployment of the 3 default test tokens (AAA, BBB, CCC):

```
// to verify on etherscan
forge script --rpc-url $RPC_ENDPOINT --broadcast --verify Deploy

// if you instead want to verify on blockscout
forge script --rpc-url $RPC_ENDPOINT --broadcast --verify --verifier blockscout --verifier-url $BLOCKSCOUT_INSTANCE_URL/api? Deploy
```

If you instead want to deploy standalone test tokens with custom name, symbol or
decimals, simply execute the following command:

```
forge script --rpc-url $RPC_ENDPOINT --broadcast --verify --sig 'run(string,string,uint8)' DeployStandalone <TOKEN_NAME> <TOKEN_SYMBOL> <TOKEN_DECIMALS>
```

replacing `<TOKEN_NAME>`, `<TOKEN_SYMBOL>` and `<TOKEN_DECIMALS>` with the
values you want.
