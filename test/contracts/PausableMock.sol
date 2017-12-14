pragma solidity ^0.4.18;


import '../../contracts/Pausable.sol';
import '../../contracts/OwnableImpl.sol';


contract PausableMock is Pausable, OwnableImpl {
    bool public drasticMeasureTaken;
    uint256 public count;

    function PausableMock() public {
        drasticMeasureTaken = false;
        count = 0;
    }

    function normalProcess() external whenNotPaused {
        count++;
    }

    function drasticMeasure() external whenPaused {
        drasticMeasureTaken = true;
    }
}