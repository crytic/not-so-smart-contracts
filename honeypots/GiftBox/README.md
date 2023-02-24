# GiftBox

## Trap

Relies on abusing etherscan transaction viewer that does not display 0 value
internal transactions that allows the owner to trap deposited ether in the
contract.

## Description

Etherscan typically shows two transactions for a `GiftBox`-style honeypot. The
first transaction is the contract creation, and the second is a call to a
function that appears to set a "secret" value. The secret can, of course,
be easily observed on the blockchain, so the victim is tricked into
submitting Ether with the correct value.

Unbeknownst to the victim, the contract owner has already changed the stored
hash of the secret, using an internal transaction with 0
value. Etherscan does not display these 0 value internal transactions.

## References

[ Beware Of Eth Gifting Contracts Etherscan ](https://www.blockchainsemantics.com/blog/beware-of-eth-gifting-contracts-etherscan/)
