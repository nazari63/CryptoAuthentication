CryptoAuthentication

A smart contract for user authentication using signed messages. This contract allows users to authenticate themselves by signing a message, ensuring their identity on the blockchain.

Features

Sign Message: Users can sign a message using their private key to prove their identity.

Verify Signature: The contract verifies the signature to ensure the user is authentic.

Secure Authentication: Ensures that only the correct user (who has the private key) can authenticate successfully.


Getting Started

Follow the steps below to interact with the smart contract:

1. Deploy the contract to an Ethereum network.

Deploy the smart contract to an Ethereum network (like Rinkeby or Mainnet).

// Deployment example (for Truffle, Hardhat, etc.)
const contract = await CryptoAuthentication.new();

2. Sign a Message

You can use your Ethereum wallet (like MetaMask) to sign a message.

const message = "I am signing this message to authenticate myself.";
const signature = await web3.eth.personal.sign(message, userAddress);

3. Verify Signature in the Contract

Use the verifySignature function in the contract to check if the signature is valid.

function verifySignature(string memory message, bytes memory signature) public view returns (bool);

4. Call the Verification Function

Now, users can call the verifySignature function with the message and signature to authenticate.

const isAuthenticated = await contract.verifySignature(message, signature);
if (isAuthenticated) {
    console.log("Authentication successful");
} else {
    console.log("Authentication failed");
}

Example Usage

// Example of signing and verifying a message
const message = "This is my authentication message.";
const signature = await web3.eth.personal.sign(message, userAddress);

// Verify the signature in the contract
const isValid = await contract.verifySignature(message, signature);
console.log(isValid ? "Authentication successful" : "Authentication failed");

Dependencies

OpenZeppelin Contracts for standard ERC-20 token functionality.

Web3.js for interacting with the Ethereum blockchain.


License

This project is licensed under the MIT License - see the LICENSE file for details.
