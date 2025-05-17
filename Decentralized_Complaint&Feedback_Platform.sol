// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Complaints {
    enum Status { Pending, InReview, Resolved }

    struct Complaint {
        uint id;
        address submittedBy;
        string description;
        Status status;
        uint timestamp;
    }

    address public admin;
    mapping(address => bool) public moderators;

    Complaint[] public complaints;

    event ComplaintSubmitted(uint indexed id, address indexed submittedBy);
    event StatusUpdated(uint indexed id, Status newStatus);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    modifier onlyModerator() {
        require(moderators[msg.sender], "Only moderator");
        _;
    }

    constructor() {
        admin = msg.sender;
        moderators[msg.sender] = true; // Make deployer a moderator too
    }

    function addModerator(address _mod) public onlyAdmin {
        moderators[_mod] = true;
    }

    function removeModerator(address _mod) public onlyAdmin {
        moderators[_mod] = false;
    }

    function submitComplaint(string memory _description) public {
        uint id = complaints.length;
        complaints.push(
            Complaint({
                id: id,
                submittedBy: msg.sender,
                description: _description,
                status: Status.Pending,
                timestamp: block.timestamp
            })
        );

        emit ComplaintSubmitted(id, msg.sender);
    }

    function getComplaint(uint _id) public view returns (Complaint memory) {
        require(_id < complaints.length, "Invalid ID");
        return complaints[_id];
    }

    function updateStatus(uint _id, Status _newStatus) public onlyModerator {
        require(_id < complaints.length, "Invalid ID");
        complaints[_id].status = _newStatus;
        emit StatusUpdated(_id, _newStatus);
    }

    function getAllComplaints() public view returns (Complaint[] memory) {
        return complaints;
    }
}


