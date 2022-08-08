//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract PropertyInheritance{

    address owner;
    bool deceased;
    uint money;

    constructor()  payable {
        owner = msg.sender;
        money = msg.value;
        deceased = false;
    }

    modifier checkOwner {
        require (msg.sender == owner);
        _;
    }

    modifier isDeceased {
        require (deceased == true);
        _;
    }

    address[] wallets;

    mapping(address => uint) propertyInheritance;

    function setup(address _wallet, uint _propertyInheritance) public checkOwner {
        wallets.push(_wallet);
        propertyInheritance[_wallet] = _propertyInheritance;
    }

    function moneyPaid() private isDeceased{
        for(uint i=0; i<wallets.length; i++) {
            payable(wallets[i]).transfer(propertyInheritance[wallets[i]]);
        }
    }

    function died() public checkOwner {
        deceased = true;
        moneyPaid();
    }

}