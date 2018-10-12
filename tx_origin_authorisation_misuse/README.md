# tx.origin misuse
Scenario:

Some incompetent developerr creates a service FreeSuperSecuredWalletsFactory (Let's call him Danny) 
which allows to create wallet just by sending ETH to factory, problem is this wallet uses tx.origin for authorisation

Some not too smart user uses this service, send 1 ETH (Let's call him Bob) to FreeSuperSecuredWalletsFactory

Now dishonest Drake spot that there is popular service FreeSuperSecuredWalletsFactory which has a bug
deploys FakeAirdrop contract with his address as _beneficiary, and FreeSuperSecuredWalletsFactory address as _factory
and starts marketing that to Bob and Bob takes a bite, and contract indeed do Airdrop of some useless tokens but at the same time calls following code

```javascript
if(listOfWalletsToSteelFrom._wallets(msg.sender)!=address(0)){
	listOfWalletsToSteelFrom._wallets(msg.sender).sendEth(dishonestGuy);
}
```

which drain FreeSuperSecuredWallet of a msg.sender if particular sender owned one


As You can see unsecured wallet can be drained when You interact with completly unrelated service