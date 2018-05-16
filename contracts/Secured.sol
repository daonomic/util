pragma solidity ^0.4.21;

import "./Ownable.sol";

/**
 * @title Secured
 * @dev Adds only(role) modifier. Subcontracts should implement checkRole to check if caller is allowed to do action.
 */
contract Secured is Ownable {
    modifier only(string role) {
        require(msg.sender == getRole(role));
        _;
    }

    modifier ownerOr(string role) {
        bool roleMatches = msg.sender == getRole(role);
        if (!roleMatches) {
            checkOwner(msg.sender);
        }
        _;
    }

    modifier any(string role1, string role2) {
        require(msg.sender == getRole(role1) || msg.sender == getRole(role2));
        _;
    }

    function getRole(string role) constant public returns (address);
}
