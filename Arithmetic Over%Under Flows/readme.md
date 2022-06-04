# Arithmetic Over/Under Flows

The Ethereum Virtual Machine (EVM) specifies fixed-size data types for integers. This means that an integer variable, only has a certain range of numbers it can represent. A uint8 for example, can only store numbers in the range [0,255]. Trying to store 256 into a uint8 will result in 0. If care is not taken, variables in Solidity can be exploited if user input is unchecked and calculations are performed which result in numbers that lie outside the range of the data type that stores them.


## Attack scenarios 

A contract is designed to act like a time vault, where users can deposit ether into the contract and it will be locked there for at least a week. The user may extend the time longer than 1 week if they choose, but once deposited, the user can be sure their ether is locked in safely for at least a week. Or can they?…

In the event a user is forced to hand over their private key (think hostage situation) a contract such as this may be handy to ensure ether is unobtainable in short periods of time. If a user had locked in 100 ether in this contract and handed their keys over to an attacker, an attacker could use an overflow to receive the ether, regardless of the lockTime.

The attacker could determine the current lockTime for the address they now hold the key for (its a public variable). Let's call this userLockTime. They could then call the increaseLockTime function and pass as an argument the number 2^256 - userLockTime. This number would be added to the current userLockTime and cause an overflow, resetting lockTime[msg.sender] to 0. The attacker could then simply call the withdraw function to obtain their reward.

## Mitigations 

The (currently) conventional technique to guard against under/overflow vulnerabilities is to use or build mathematical libraries which replace the standard math operators; addition, subtraction and multiplication (division is excluded as it doesn’t cause over/under flows and the EVM throws on division by 0).

OppenZepplin have done a great job in building and auditing secure libraries which can be leveraged by the Ethereum community. In particular, their Safe Math Library is a reference or library to use to avoid under/over flow vulnerabilities.

## Example 

A 4chan group decided it was a great idea to build a ponzi scheme on Ethereum, written in Solidity. They called it the Proof of Weak Hands Coin (PoWHC). Unfortunately it seems that the author(s) of the contract hadn’t seen over/under flows before and consequently, 866 ether was liberated from its contract. A good overview of how the underflow occurs (which is not too dissimilar to the Ethernaut challenge above) is given in Eric Banisadar’s post.

## Sources

[Solidity-vulnerabilities](https://medium.com/hackernoon/hackpedia-16-solidity-hacks-vulnerabilities-their-fixes-and-real-world-examples-f3210eba5148)