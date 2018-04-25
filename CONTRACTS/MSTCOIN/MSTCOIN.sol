pragma solidity ^0.4.17;

import "./PausableToken.sol";

contract MSTCOIN is PausableToken {
    
    function MSTCOIN() public {
        name = "MSTCOIN";
        symbol = "MSTCOIN";
        decimals = 6;
        totalSupply = 500000000e6;
        balances[owner] = totalSupply;
        Transfer(address(this), owner, totalSupply);
    }
    
    event Burn(address indexed burner, uint256 value);
    
    /**
    * Allows the owner to burn his own tokens.
    * 
    * @param _value The amount of token to be burned
    */
    function burn(uint256 _value) public onlyOwner {
        _burn(msg.sender, _value);
    }
    
    /**
    * Function is internally called by the burn function. 
    *
    * @param _who Will always be the owners address
    * @param _value The amount of tokens to be burned
    **/
    function _burn(address _who, uint256 _value) internal {
        require(_value <= balances[_who]);
        balances[_who] = balances[_who].sub(_value);
        totalSupply = totalSupply.sub(_value);
        Burn(_who, _value);
        Transfer(_who, address(0), _value);
    }
}


