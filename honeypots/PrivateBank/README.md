# Private Bank

## Trap
External constructor of a `Log` contract does not mirror code included in the
contract and does not succeed if caller is not the owner.

## Description
Someone familiar with smart contract security and some of the more technical vulnerabilities might recognize that this contract is susceptible to a [classic reentrancy attack](../../reentrancy). It takes advantage of the low-level call in the function `CashOut()` by `msg.sender.call.value(_am)())`. Since the user balance is only decremented afterwards, the caller’s callback function can call back into the method, allowing an attacker to continuously call `CashOut()` beyond what their initial balance should allow for. The only main difference is the addition of a `Log` class that seems to keep track of transitions.

This honeypot takes advantage of the caller’s assumptions, diverting attention away from the trap by seemingly including a reentrancy vulnerability. However, if you attempt to do so, you will find that your call to `CashOut` will fail every time. There doesn’t seem to be anything in the code that would indicate a gas usage timeout. The only thing extraneous is the logging call at `TransferLog.AddMessage(msg.sender,msg.value,"Deposit")`. The source of the `Log` contract appears benign.

A closer inspection of the constructor will show that `TransferLog` is initialized from a user-supplied address. As long as the contract code at that location contains similar function signatures, the content of `AddMessage` can be completely different. In fact we can find the code of the external Log contract here. Having only bytecode available, we can assume that it will trap execution in a computationally expensive loop for everyone else but the owner, causing the contract function to hit the gas limit.
