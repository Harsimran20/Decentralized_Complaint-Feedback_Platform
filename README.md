# 📢 Decentralized Complaint & Feedback Platform

A smart contract-based system where users can submit complaints or feedback, which are recorded immutably on the blockchain. Moderators can update the status of complaints to ensure transparency and accountability.

---

## 🚀 Features

- ✅ Submit complaints anonymously or with your address.
- 🔍 Retrieve individual or all complaints.
- 🛠️ Moderators can update the status (Pending, InReview, Resolved).
- 📜 Fully on-chain storage of complaint history.
- 🔐 Role-based access control using built-in role management.

---

## 🛠️ Technologies Used

- **Solidity** (Smart Contract Language)
- **Remix IDE** (For development and deployment)
- **OpenZeppelin** (AccessControl roles – optional but recommended)
- **EVM-compatible blockchain** (Remix VM, Sepolia, or Polygon)

---

## 🧱 Smart Contract Structure

### Enum
```solidity
enum Status { Pending, InReview, Resolved }
```

### Struct
```solidity
struct Complaint {
    uint id;
    address submittedBy;
    string description;
    Status status;
    uint timestamp;
}
```

### Key Functions
- `submitComplaint(string memory _description)`
- `getComplaint(uint _id)`
- `getAllComplaints()`
- `updateStatus(uint _id, Status _newStatus)` — only accessible by moderators

### Events
- `ComplaintSubmitted(uint indexed id, address indexed submittedBy)`
- `StatusUpdated(uint indexed id, Status newStatus)`

---

## 🧪 How to Test It (Using Remix)

1. **Open Remix IDE** at https://remix.ethereum.org  
2. Paste the contract code into a new file (e.g., `Complaints.sol`)
3. Compile the contract using Solidity 0.8.x
4. Deploy it using:
   - `Remix VM` for local testing
   - Or `Injected Provider` for using MetaMask with Sepolia
5. Interact with the functions in the "Deployed Contracts" section:
   - Submit complaints
   - View complaints
   - Update status (if you are a moderator)

---

## ✅ Sample Usage

```solidity
submitComplaint("Water leakage in block A.");
getComplaint(0);
updateStatus(0, Status.Resolved); // Only by moderators
```

---

## 🔐 Roles & Permissions

- **DEFAULT_ADMIN_ROLE**: Full access to role management.
- **MODERATOR_ROLE**: Can change complaint statuses.
- Roles are assigned using OpenZeppelin’s `AccessControl`.

---
