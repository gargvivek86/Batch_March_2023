// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.0;

contract Learning {
    address public owner;
    constructor() public {
        owner= msg.sender;
    }
    modifier onlyOwner {
        require (owner == msg.sender);
        _;
    }
    fallback() external payable{}
    modifier only {
        require (owner == msg.sender);
        _;
    }
    struct Participant {
        string name;
        uint8 age;
        string pAddress;
        uint phoneNo;
    }
    mapping (uint => Participant) Participants;
    function AddParticipant(uint _key, string memory _name, uint8 _age, string memory _address, uint _phoneno) public onlyOwner {
        require (_age > 18, "input age should be more than 18");
        Participants[_key]=Participant(_name,_age,_address,_phoneno);
    }
    function ReadParticipant(uint _key) public view returns (Participant memory) {
        return Participants[_key];
    }
}