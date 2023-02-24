# VarLoop

## Trap
Implicit conversion of `var` type variable into `uint8` causes payment loop to
short-circuit.

## Description
The contract appears vulnerable to a constructor mismatch, allowing anyone to call the public method `Test1()` and double any ether they send to the function. The calculation involves a while loop which is strange, but the bounds conditions seem correct enough.

One of the features of Solidity is that it seeks to mimic JavaScript in its language syntax and style. This is ostensibly to ease onboarding of developers with something familiar. In this case, the contract takes advantage of different semantics between Solidity and JavaScript to create type confusion. The var keyword allows the compiler to infer the type of the assignment when declaring a variable. In this instance, `i1` and `i2` are resolved to fact be `uint8`. As such, their maximum value will be 255 before overflow -- causing the loop condition `if(i1<i2)` to fail, sending at most 255 wei to the caller before terminating.

Fortunately the var keyword has been deprecated by the Solidity authors.

This is also a type of runtime bug that our symbolic execution tool, [Manticore](https://github.com/trailofbits/manticore), would have able to spot by being unable to find a valid transaction path that would ever return more than 255 wei.
