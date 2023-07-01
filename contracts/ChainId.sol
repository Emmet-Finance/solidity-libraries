// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ChainId { // Deployment: library 109,415 gas; contract 106,388

    function getChainId() external view returns (uint256 chainId) {
        assembly {
            chainId := chainid()
        }
    }
}
