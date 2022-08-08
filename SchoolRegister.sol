//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract SchoolRegister{
    

    struct StudentDetails{
        string name;
        string department;
        uint8 level;
        bool isGraduated;
    }

    mapping(address => mapping(uint=>StudentDetails)) public Student;

    function addStudent(uint _index, string memory _name, string memory _department, uint8 _level, bool _isGraduated) public {
        Student[msg.sender][_index] = StudentDetails(_name,_department,_level,_isGraduated);
    }



}