# (Not So) Smart Contracts

This repository contains examples of common Ethereum smart contract vulnerabilities, including code from real smart contracts. Use Not So Smart Contracts to learn about EVM and Solidity vulnerabilities, as a reference when performing security reviews, and as a benchmark for security and analysis tools.

In addition, we have also included analysis of several honeypots.

## Features

Each _Not So Smart Contract_ includes a standard set of information:

* Description of the unique vulnerability type
* Attack scenarios to exploit the vulnerability
* Recommendations to eliminate or mitigate the vulnerability
* Real-world contracts that exhibit the flaw
* References to third-party resources with more information

## Vulnerabilities

| Not So Smart Contract | Description |
| --- | --- |
| [Bad randomness](bad_randomness) | Contract attempts to get on-chain randomness, which can be manipulated by users |
| [Denial of Service](denial_of_service) | Attacker stalls contract execution by failing in strategic way |
| [Forced Ether Reception](forced_ether_reception) | Contracts can be forced to receive Ether |
| [Incorrect Interface](incorrect_interface) | Implementation uses different function signatures than interface |
| [Integer Overflow](integer_overflow) | Arithmetic in Solidity (or EVM) is not safe by default |
| [Race Condition](race_condition) | Transactions can be frontrun on the blockchain |
| [Reentrancy](reentrancy) | Calling external contracts gives them control over execution |
| [Unchecked External Call](unchecked_external_call) | Some Solidity operations silently fail |
| [Unprotected Function](unprotected_function) | Failure to use function modifier allows attacker to manipulate contract |
| [Variable Shadowing](variable%20shadowing/) | Local variable name is identical to one in outer scope |
| [Wrong Constructor Name](wrong_constructor_name) | Anyone can become owner of contract due to missing constructor |

## Honeypots

The Ethereum community has discovered a variety of honeypot smart contracts operating on the mainnet blockchain - something that we have been investigating for quite some time. They’re designed to entice security researchers and developers to deposit Ethereum into the contract to obtain a chance to exploit ‘easy vulnerabilities’ in Solidity. However, once payment is deposited, the contracts will deploy subtle traps and quirks to lock out the user from successfully claiming the “prize.”

The traps vary in sophistication. Our blockchain security research has turned up six fundamental archetypes that construct most of these honeypots. Many seem to be moderately successful - trapping around 0.1 ether and containing approximately 5 transactions on average. Yet for every successful trap, a large minority of contracts had no interaction at all. These ‘failed honeypots’ most likely served the original developers as a testing environment. The existence of these contracts must be taken into account by academic researchers quantifying the effectiveness of tools and analysis methods for the Ethereum blockchain, given the potential to skew research results.

Versions of the most recent compilers will emit warnings of most of these traps during compilation. However, some of the contracts rely on logic gaps in the solc compiler and the Solidity language itself.

| Honeypot Archetype | Description|
| --- | --- |
| [GiftBox](honeypots/GiftBox) | Etherscan doesn't show you everything! |
| [King of the Hill](honeypots/KOTH) | Variable shadowing of the `owner` ensures it is never reassigned. |
| [Lottery](honeypots/Lottery) | Unitialized structs default to acting like storage pointers. |
| [Multiplicator](honeypots/Multiplicator) | Abuses global variable semantics of `this.balance`. |
| [PrivateBank](honeypots/PrivateBank) | External constructor of a `Log` contract does not mirror code included in the contract. |
| [VarLoop](honeypots/VarLoop) | Implicit conversion of `var` type variable into `uint8` causes payment loop to short-circuit. |

## Credits

These examples are developed and maintained by [Trail of Bits](https://www.trailofbits.com/). Contributions are encouraged and are covered under our [bounty program](https://github.com/trailofbits/not-so-smart-contracts/wiki#bounties).

If you have questions, problems, or just want to learn more, then join the #ethereum channel on the [Empire Hacking Slack](https://empireslacking.herokuapp.com/) or [contact us](https://www.trailofbits.com/contact/) directly.
