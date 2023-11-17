// Calculator.sol
pragma solidity ^0.8.0;

contract Calculator {
    // Arithmetic Operations
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Division by zero");
        return a / b;
    }

    // Algebraic Operations
    function square(uint256 a) public pure returns (uint256) {
        return a * a;
    }

    function cube(uint256 a) public pure returns (uint256) {
        return a * a * a;
    }

    function power(uint256 a, uint256 exponent) public pure returns (uint256) {
        return a ** exponent;
    }

    function factorial(uint256 a) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 2; i <= a; i++) {
            result *= i;
        }
        return result;
    }
}