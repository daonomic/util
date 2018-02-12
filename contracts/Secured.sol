pragma solidity ^0.4.18;

/**
 * @title Secured
 * @dev Adds only(role) modifier. Subcontracts should implement checkRole to check if caller is allowed to do action.
 */
contract Secured {
    modifier only(string role) {
        require(msg.sender == getRole(role));
        _;
    }

    function getRole(string role) constant public returns (address);
}
