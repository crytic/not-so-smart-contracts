# King Of The Hill

## Trap
Variable shadowing of the `owner` ensures it is never reassigned.

## Description

At first glance this contract appears to be your average King of the Hill ponzi scheme. Participants contribute ether to the contract via the `Stake()` function that keeps track of the latest `owner` and ether deposit that allowed them to become to the current owner. The `withdraw()` function employs an `onlyOwner` modifier, seemingly allowing only the last person recently throned the ability to transfer all funds out of the contract. Stumbling upon this contract on etherscan and seeing an existing balance, one might think that there is a chance to gain some easy ether by taking advantage of a quick `Stake()` claim and subsequent `withdraw()`.

The heart of the honeypot lies in the fact that the owner variable qualifying the `onlyOwner` modifier is not the one being reassigned in the `Stake()` function. This is a particularly nasty bug that is made even more insidious by the fact that the solc compiler will throw no error or warning indicating that the owner address is in fact being [shadowed](../../variable%20shadowing) by the inheriting `CEOThrone` contract. By re-declaring the variable in the child’s scope, the contract ensures that owner in `Ownable` is actually never reassigned at all and allows the original creator to dump all funds at their leisure.
