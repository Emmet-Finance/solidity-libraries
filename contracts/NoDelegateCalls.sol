// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract NoDelegateCalls {
    address private immutable _this;
    error UnauthorizedDelegateCall(address caller);

    constructor() {
        _this = address(this);
    }

    function ensureNoDelegateCall() private view {
        if (address(this) == _this) {
            revert UnauthorizedDelegateCall(address(this));
        }
    }

    modifier noDelegateCall() {
        ensureNoDelegateCall();
        _;
    }
}
