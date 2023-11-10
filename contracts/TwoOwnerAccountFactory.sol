// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import '@openzeppelin/contracts/utils/Create2.sol';
import '@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol';

import './TwoOwnerAccount.sol';

contract TwoOwnerAccountFactory {
    TwoOwnerAccount public immutable accountImplementation;

    constructor(IEntryPoint _entryPoint) {
        accountImplementation = new TwoOwnerAccount(_entryPoint);
    }

    function createAccount(
        address _ownerOne,
        address _ownerTwo,
        uint256 salt
    ) public returns (TwoOwnerAccount ret) {
        address addr = getAddress(_ownerOne, _ownerTwo, salt);
        uint256 codeSize = addr.code.length;
        if (codeSize > 0) {
            return TwoOwnerAccount(payable(addr));
        }
        ret = TwoOwnerAccount(
            payable(
                new ERC1967Proxy{salt: bytes32(salt)}(
                    address(accountImplementation),
                    abi.encodeCall(
                        TwoOwnerAccount.initialize,
                        (_ownerOne, _ownerTwo)
                    )
                )
            )
        );
    }

    function getAddress(
        address _ownerOne,
        address _ownerTwo,
        uint256 salt
    ) public view returns (address) {
        return
            Create2.computeAddress(
                bytes32(salt),
                keccak256(
                    abi.encodePacked(
                        type(ERC1967Proxy).creationCode,
                        abi.encode(
                            address(accountImplementation),
                            abi.encodeCall(
                                TwoOwnerAccount.initialize,
                                (_ownerOne, _ownerTwo)
                            )
                        )
                    )
                )
            );
    }
}
