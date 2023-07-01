// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library ERC20TransferHelper {
    error ERC20TransferError(string reason);
    // bytes4(keccak256(bytes('approve(address,uint256)')));
    bytes4 private constant approveSelector = 0x095ea7b3;
    // bytes4(keccak256(bytes('transfer(address,uint256)')));
    bytes4 private constant transferSelector = 0xa9059cbb;
    // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
    bytes4 private constant transferFromSelector = 0x23b872dd;

    function safeApprove(
        address token,
        address to,
        uint256 value
    ) internal {
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(approveSelector, to, value)
        );
        _verifyOrThrow(success, data, "APPROVE_FAILED");
    }

    function safeTransfer(
        address token,
        address to,
        uint256 value
    ) internal {
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(transferSelector, to, value)
        );
        _verifyOrThrow(success, data, "TRANSFER_FAILED");
    }

    function safeTransferFrom(
        address token,
        address from,
        address to,
        uint256 value
    ) internal {
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(transferFromSelector, from, to, value)
        );
        _verifyOrThrow(success, data, "TRANSFER_FROM_FAILED");
    }

    function safeCoinTransfer(address to, uint256 value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        if (!success) {
            revert ERC20TransferError({reason: "COIN_TRANSFER_FAILED"});
        }
    }

    function _verifyOrThrow(
        bool success,
        bytes memory data,
        string memory error
    ) internal pure {
        if (!success || !(data.length == 0 || abi.decode(data, (bool)))) {
            revert ERC20TransferError({reason: error});
        }
    }
}
