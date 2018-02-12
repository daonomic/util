pragma solidity ^0.4.18;

import "./Secured.sol";
import "./Ownable.sol";

contract SecuredImpl is Secured, Ownable {
	mapping(string => address) users;
	event RoleTransferred(address indexed previousUser, address indexed newUser, string role);

	function getRole(string role) constant public returns (address) {
		return users[role];
	}

	function transferRole(string role, address to) onlyOwner public {
		require(to != address(0));
		RoleTransferred(users[role], to, role);
		users[role] = to;
	}
}
