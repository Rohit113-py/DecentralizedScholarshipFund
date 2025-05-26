# DecentralizedScholarshipFund
# DecentralizedScholarshipFund
# 🎓 Decentralized Scholarship Fund (Solidity Smart Contract)

This is a simple and secure Ethereum smart contract that allows donors to contribute funds to a scholarship pool. Approved students can claim a fixed amount of ETH as a scholarship, verified and approved by a fund manager.

---

## ✨ Features

- 📥 **Donations Accepted**: Anyone can donate ETH to support scholarships.
- ✅ **Student Approval**: Only the fund manager can approve students for receiving scholarships.
- 💸 **One-Time Claim**: Approved students can claim their scholarship only once.
- 📊 **Transparent Tracking**: Tracks the number of scholarships awarded and contract balance.

---

## 🔧 Smart Contract Details

- **Language**: Solidity ^0.8.0  
- **Contract Name**: `DecentralizedScholarshipFund`  
- **License**: MIT  
- **Deployed On**: Compatible with Ethereum and testnets (e.g., Sepolia, Goerli)

---

![05922446-7F03-407E-92DE-76C77DCE7940](https://github.com/user-attachments/assets/dd605f9f-476f-4769-812f-742cf6a10519)


## 📂 Functions

### 👨‍🏫 Constructor

```solidity
constructor(uint256 _scholarshipAmount)
Sets the fixed scholarship amount (in Wei).

Sets the deployer as the fundManager.

💰 Donations
receive() external payable
donate() external payable
Anyone can donate ETH directly or through the donate() function.

🎓 Student Approval
approveStudent(address _student) external onlyManager
Only the fund manager can approve students.

💵 Claiming Scholarship
claimScholarship() external
Approved students can claim a one-time scholarship.

Checks for sufficient balance and if the student hasn’t already claimed.

📊 Balance Check
getBalance() public view returns (uint256)
Returns the current ETH balance of the contract.
📜 Events
Donated(address donor, uint256 amount)

StudentApproved(address student)

ScholarshipClaimed(address student, uint256 amount)

🔐 Access Control
onlyManager modifier restricts some functions to the fund manager only.

🧪 Deployment (via Remix)
Open Remix IDE

Create a file DecentralizedScholarshipFund.sol and paste the code.

Compile using Solidity ^0.8.0.

Deploy with a value like 100000000000000000 (for 0.1 ETH).

Use functions to donate, approve students, and let them claim funds.

✅ Example Usage
js
Copy
Edit
// Deploy contract with 0.1 ETH per scholarship (in wei)
constructor(100000000000000000);

// Donate 1 ETH
donate({ value: web3.utils.toWei("1", "ether") });

// Approve student
approveStudent("0x123...");

// Student calls
claimScholarship();
⚠️ Security Notes
Use caution when deploying to mainnet.

You may add Oracle integration (e.g., Chainlink) to automate student verification.

Currently uses .transfer() to avoid reentrancy risks.

📃 License
This project is licensed under the MIT License.

yaml
Copy
Edit


Would you like a **frontend UI** or deployment script (like Hardhat or Foundry) added to this project?```

---
CONTRACT DETAILS: 0xf6bb0c9813eca798e8c2fb17638fb3b9122bc924





