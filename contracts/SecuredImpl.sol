pragma solidity ^0.4.21;

import "./Secured.sol";
import "./Ownable.sol";

contract SecuredImpl is Ownable, Secured {
	mapping(string => address) users;
	event RoleTransferred(address indexed previousUser, address indexed newUser, string role);

	function getRole(string role) constant public returns (address) {
		return users[role];
	}

	function transferRole(string role, address to) onlyOwner public {
		require(to != address(0));
		emit RoleTransferred(users[role], to, role);
		users[role] = to;
	}
}
