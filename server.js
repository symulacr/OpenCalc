// server.js - Backend Server using Node.js with Express

const express = require('express');
const Web3 = require('web3');
const app = express();

// Initialize Web3 with an Ethereum node endpoint
const web3 = new Web3('http://localhost:8545'); // Replace with your Ethereum node address

// Contract ABI - Replace with your contract's ABI
const contractABI = [
  // Insert your contract's ABI here
  'function add(uint256 a, uint256 b) public pure returns (uint256)',
  'function subtract(uint256 a, uint256 b) public pure returns (uint256)'
  // Add other function definitions as needed
];

// Placeholder for Contract address
let contractAddress = '0x0123456789ABCDEF0123456789ABCDEF0123456'; // Replace with your deployed contract address

// Create a contract instance
const contract = new web3.eth.Contract(contractABI, contractAddress);

// Example template ads
const ads = {
    headerAd: 'Your header advertisement here',
    sidebarAd: 'Your sidebar advertisement here',
    footerAd: 'Your footer advertisement here',
};

// Endpoint to get template ads
app.get('/ads', (req, res) => {
    res.json(ads);
});

// Endpoint to perform addition operation
app.get('/calculate/add', async (req, res) => {
    const { a, b } = req.query;

    try {
        // Call the smart contract's add function
        const result = await contract.methods.add(a, b).call();
        res.json({ result });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Endpoint to perform subtraction operation
app.get('/calculate/subtract', async (req, res) => {
    const { a, b } = req.query;

    try {
        // Call the smart contract's subtract function
        const result = await contract.methods.subtract(a, b).call();
        res.json({ result });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Add endpoints for other mathematical operations (multiply, divide, etc.) similarly

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});