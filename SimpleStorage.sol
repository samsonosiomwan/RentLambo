//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract SimpleStorage {

    struct People{
        string name;
        uint number;
    }

    People[] public PeopleArray;

    mapping(string=>uint) public nameToNumber;


    function addPerson(string memory _name, uint _number) public {
        PeopleArray.push(People(_name, _number));
        nameToNumber[_name] = _number;
    }
}