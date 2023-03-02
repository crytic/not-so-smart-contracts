
No-so-smart-contracts is now in [building-secure-contracts](https://github.com/crytic/building-secure-contracts) (see [https://secure-contracts.com/](https://secure-contracts.com/))

# (Not So) Smart Contracts

This repository contains examples of common Ethereum smart contract vulnerabilities, including code from real smart contracts. Use Not So Smart Contracts to learn about EVM and Solidity vulnerabilities, as a reference when performing security reviews, and as a benchmark for security and analysis tools.

## Features

Each _Not So Smart Contract_ includes a standard set of information:

* Description of the unique vulnerability type
* Attack scenarios to exploit the vulnerability
* Recommendations to eliminate or mitigate the vulnerability
* Real-world contracts that exhibit the flaw
* References to third-party resources with more information

Bonus! We have also included a repository and analysis of several [honeypots](honeypots).

## Vulnerabilities

| Not So Smart Contract | Description |
| --- | --- |
| [Bad randomness](bad_randomness) | Contract attempts to get on-chain randomness, which can be manipulated by users |
| [Dangerous Strict Equalities](dangerous_strict_equalities) | Use of strict equalities that can be easily manipulated by an attacker. |
| [Denial of Service](denial_of_service) | Attacker stalls contract execution by failing in strategic way |
| [Forced Ether Reception](forced_ether_reception) | Contracts can be forced to receive Ether |
| [Incorrect ERC20 Interface](incorrect_erc20_interface) | Token not implementing the ERC20 interface correctly. |
| [Incorrect ERC721 Interface](incorrect_erc721_interface) | Token not implementing the ERC721 interface correctly. |
| [Incorrect Interface](incorrect_interface) | Implementation uses different function signatures than interface |
| [Integer Overflow](integer_overflow) | Arithmetic in Solidity (or EVM) is not safe by default |
| [Race Condition](race_condition) | Transactions can be frontrun on the blockchain |
| [Reentrancy](reentrancy) | Calling external contracts gives them control over execution |
| [rtlo](rtlo) | Usage of malicious unicode character. |
| [Suicidal](suicidal) | Contract that can be destructed by anyone. |
| [Tautology](tautology) | Usage of always boolean expressions that are always true. |
| [Unchecked External Call](unchecked_external_call) | Some Solidity operations silently fail |
| [Uninitialized State Variables](uninitialized-state-variables) | State variables that are used before being initialized. |
| [Uninitialized Storage Variables](uninitialized-storage-variables) | Storage variables that are used before being initialized. |
| [Unprotected Function](unprotected_function) | Failure to use function modifier allows attacker to manipulate contract |
| [Unused Return Value ](unused-return) | Return values from calls that is not used. |
| [Variable Shadowing](variable%20shadowing/) | Local variable name is identical to one in outer scope |
| [Wrong Constructor Name](wrong_constructor_name) | Anyone can become owner of contract due to missing constructor |


## Credits

These examples are developed and maintained by [Trail of Bits](https://www.trailofbits.com/). Contributions are encouraged and are covered under our [bounty program](https://github.com/trailofbits/not-so-smart-contracts/wiki#bounties).

If you have questions, problems, or just want to learn more, then join the #ethereum channel on the [Empire Hacking Slack](https://empireslacking.herokuapp.com/) or [contact us](https://www.trailofbits.com/contact/) directly.
