// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Field {
    uint256 immutable MOD;

    constructor(uint256 _MOD) {
        MOD = _MOD;
    }
    
    uint256 immutable ZERO = 0;
    uint256 immutable ONE = 1;

    function add(uint256 a, uint256 b) public view returns (uint256) {
        return addmod(a, b, MOD);
    }

    function mul(uint256 a, uint256 b) public view returns (uint256) {
        return mulmod(a, b, MOD);
    }

    /// @dev Compute f^-1 for f \in Fr scalar field
    /// @notice credit: Aztec, Spilsbury Holdings Ltd
    function invert(uint256 fr, uint256 modulus) public view returns (uint256 output) {
        bool success;
        assembly {
            let mPtr := mload(0x40)
            mstore(mPtr, 0x20)
            mstore(add(mPtr, 0x20), 0x20)
            mstore(add(mPtr, 0x40), 0x20)
            mstore(add(mPtr, 0x60), fr)
            mstore(add(mPtr, 0x80), sub(modulus, 2))
            mstore(add(mPtr, 0xa0), modulus)
            success := staticcall(gas(), 0x05, mPtr, 0xc0, 0x00, 0x20)
            output := mload(0x00)
        }
        require(success, "Pallas: pow precompile failed!");
    }

    function fieldpow(uint256 _base, uint256 _exp) public returns (uint256 result) {
        uint256 _mod = MOD;
        assembly {
            // Free memory pointer
            let pointer := mload(0x40)
            // Define length of base, exponent and modulus. 0x20 == 32 bytes
            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)
            // Define variables base, exponent and modulus
            mstore(add(pointer, 0x60), _base)
            mstore(add(pointer, 0x80), _exp)
            mstore(add(pointer, 0xa0), _mod)
            // Store the result
            let value := mload(0xc0)
            // Call the precompiled contract 0x05 = bigModExp
            if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
                revert(0, 0)
            }
            result := mload(value)
        }
    }

    function sqrt(uint256 _x) public view returns (uint256) {
        uint256 _mod = MOD;

        assembly {
            function pow_mod(base, exponent, modulus) -> answer 
            {
                let pointer := mload(0x40)
                mstore(pointer, 0x20)
                mstore(add(pointer, 0x20), 0x20)
                mstore(add(pointer, 0x40), 0x20)
                mstore(add(pointer, 0x60), base)
                mstore(add(pointer, 0x80), exponent)
                mstore(add(pointer, 0xa0), modulus)

                let result_ptr := mload(0x40)
                if iszero(staticcall(not(0), 0x05, pointer, 0xc0, result_ptr, 0x20)) {
                    revert(0, 0)
                }
                answer := mload(result_ptr)
            }

            function is_square(base, modulus) -> isSquare
            {
                let exponent := div(sub(modulus, 1),2)
                let exp_result := pow_mod(base, exponent, modulus)
                isSquare := iszero(sub(exp_result, 1))
            }

            function require(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            require(is_square(_x, _mod))

            if iszero(sub(mod(_mod, 4),3)) {
                let exponent := div(add(_mod, 1), 4)
                let answer_ptr := mload(0x40)
                mstore(answer_ptr, pow_mod(_x, exponent,_mod))
                return(answer_ptr, 0x20)
            }

            let s := sub(_mod, 1)
            let e := 0
            for { } iszero(mod(s, 2)) { } {
                s := div(s, 2)
                e := add(e, 1)
            }

            let n := 2
            for { } is_square(n, _mod) {} {
                n := add(n, 1)
            }

            let x := pow_mod(_x, div(add(s, 1), 2), _mod)
            let b := pow_mod(_x, s, _mod)
            let g := pow_mod(n, s, _mod)
            let r := e

            for { } 1 { } {
                let t := b
                let m := 0
                for { let mm := 0 } lt(mm, r) { mm := add(mm, 1) } {
                    if eq(t, 1) {
                        break
                    }
                    t := mulmod(t, t, _mod)
                }

                if iszero(m) {
                    let return_ptr := mload(0x40)
                    mstore(return_ptr, x)
                    return(return_ptr, 0x20)
                }

                let gs := pow_mod(g, 1, _mod) // <- Fix this
                g := mulmod(gs, gs, _mod)
                x := mulmod(x, gs, _mod)
                b := mulmod(b, g, _mod)
                r := m
            }
        }
        revert();
    }
}