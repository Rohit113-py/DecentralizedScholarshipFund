// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedScholarshipFund {
    address public fundManager;
    uint256 public scholarshipAmount;
    uint256 public totalScholarshipsAwarded;

    mapping(address => bool) public approvedStudents;
    mapping(address => bool) public hasClaimed;

    event Donated(address indexed donor, uint256 amount);
    event StudentApproved(address indexed student);
    event ScholarshipClaimed(address indexed student, uint256 amount);

    modifier onlyManager() {
        require(msg.sender == fundManager, "Only fund manager allowed");
        _;
    }

    constructor(uint256 _scholarshipAmount) {
        fundManager = msg.sender;
        scholarshipAmount = _scholarshipAmount;
    }

    // Allow anyone to donate to the scholarship fund
    receive() external payable {
        emit Donated(msg.sender, msg.value);
    }

    function donate() external payable {
        emit Donated(msg.sender, msg.value);
    }

    // Fund manager approves students
    function approveStudent(address _student) external onlyManager {
        approvedStudents[_student] = true;
        emit StudentApproved(_student);
    }

    // Approved students claim their scholarship
    function claimScholarship() external {
        require(approvedStudents[msg.sender], "Not approved for scholarship");
        require(!hasClaimed[msg.sender], "Scholarship already claimed");
        require(address(this).balance >= scholarshipAmount, "Insufficient funds");

        hasClaimed[msg.sender] = true;
        totalScholarshipsAwarded++;
        payable(msg.sender).transfer(scholarshipAmount);
        emit ScholarshipClaimed(msg.sender, scholarshipAmount);
    }

    // View contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
