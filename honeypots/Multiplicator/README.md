# Multiplicator

## Trap
Abuses global variable semantics of `this.balance` to ensure an impossible
conditional branch.

## Description
Here is another ponzi-esque contract that promises to multiply your ‘investment’ by returning to you your initial deposit in addition to the current total balance of ether in the contract. The only condition is that the amount you send into the `multiplicate()` function must be greater than the current balance.

The contract takes advantage of the fact that the global variable balance on the contract will always contain any ether sent to payable functions attached to `msg.value`. As a result, the condition `if(msg.value>=this.balance)` will always fail and the transfer will never occur. The `multiplicate()` function itself affirms the erroneous assumption by setting the transfer parameter as `this.balance+msg.value` (instead of only `this.balance`)
