// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoAuthentication {

    // Store the nonce for each address to prevent replay attacks
    mapping(address => uint256) public nonces;

    // Event to log the successful authentication
    event Authenticated(address indexed user, uint256 nonce);

    // Function to authenticate a user based on a signed message
    function authenticate(bytes32 message, uint8 v, bytes32 r, bytes32 s) public {
        address signer = recoverSigner(message, v, r, s);
        require(signer == msg.sender, "Authentication failed: Invalid signature");

        // Verify that the nonce matches
        uint256 currentNonce = nonces[msg.sender];
        require(currentNonce == uint256(message), "Authentication failed: Nonce mismatch");

        // Increment the nonce to prevent replay attacks
        nonces[msg.sender]++;

        // Emit the authentication event
        emit Authenticated(msg.sender, currentNonce);
    }

    // Helper function to recover the signer from the signature
    function recoverSigner(bytes32 message, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        bytes32 ethSignedMessageHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", message));
        return ecrecover(ethSignedMessageHash, v, r, s);
    }

}