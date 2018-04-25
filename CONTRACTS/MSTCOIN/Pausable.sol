pragma solidity ^0.4.17;

import "../SHARED_CONTRACTS/Ownable.sol";

contract Pausable is Ownable {
   
    event Pause();
    event Unpause();
    event Freeze ();
    event LogFreeze();

    address public constant IcoAddress = 0x0;  //To be replaced with the address of the ICO contract

    bool public paused = true;
    
    /**
    * @dev modifier to allow actions only when the contract IS paused or if the 
    * owner or ICO contract is invoking the action
    */
    modifier whenNotPaused() {
        require(!paused || msg.sender == IcoAddress || msg.sender == owner);
        _;
    }

    /**
    * @dev modifier to allow actions only when the contract IS NOT paused
    */
    modifier whenPaused() {
        require(paused);
        _;
    }

    /**
    * @dev called by the owner to pause, triggers stopped state
    */
    function pause() public onlyOwner {
        paused = true;
        Pause();
    }
    

    /**
    * @dev called by the owner to unpause, returns to normal state
    */
    function unpause() public onlyOwner {
        paused = false;
        Unpause();
    }
    
}
