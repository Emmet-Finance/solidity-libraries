// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {
    error MathError(string reason);

    /**
     * @dev Multiplies two numbers, reverts on overflow.
     */
    function mul(uint256 multiplier, uint256 multiplicand)
        internal
        pure
        returns (uint256)
    {
        if (multiplier == 0) {
            return 0;
        }

        uint256 product = multiplier * multiplicand;

        if (!(product / multiplier == multiplicand)) {
            revert MathError({reason: "Multiplication overflow"});
        }

        return product;
    }

    /**
     * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 dividend, uint256 divisor)
        internal
        pure
        returns (uint256)
    {
        if (divisor == 0) {
            revert MathError({reason: "Division by zero"});
        }

        uint256 ratio = dividend / divisor;

        return ratio;
    }

    /**
     * @dev Subtracts two numbers, reverts on underflow.
     */
    function sub(uint256 minuend, uint256 subtrahend)
        internal
        pure
        returns (uint256)
    {
        if (subtrahend > minuend) {
            revert MathError({reason: "Subtraction underflow"});
        }

        uint256 difference = minuend - subtrahend;

        return difference;
    }

    /**
     * @dev Adds two numbers, reverts on overflow.
     */
    function add(uint256 augend, uint256 addend)
        internal
        pure
        returns (uint256)
    {
        uint256 sum = augend + addend;

        if (sum < augend) {
            revert MathError({reason: "Addition overflow"});
        }

        return sum;
    }

    /**
     * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 numerator, uint256 denominator)
        internal
        pure
        returns (uint256)
    {
        if (denominator == 0) {
            revert MathError({reason: "Division by zero"});
        }
        return numerator % denominator;
    }
}
