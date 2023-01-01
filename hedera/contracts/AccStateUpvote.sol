// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract LookupContract {
    mapping(string => uint256) public myRootApp;

    constructor(string memory _name, uint256 _AccIDVotes) public {
        myRootApp[_name] = _AccIDVotes;
    }

    function setAccIDVotes(string memory _name, uint256 _AccIDVotes)
        public
    {
        myRootApp[_name] = _AccIDVotes;
    }

    function getAccIDVotes(string memory _name)
        public
        view
        returns (uint256)
    {
        return myRootApp[_name];
    }
}
