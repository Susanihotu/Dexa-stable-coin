// SPDX License-Identifier: MIT
pragma solidity ^0.8.20;
import  {ERC20Burnable, ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import { ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
contract DexaCoin is ERC20Burnable, ownable { 
    
    error MustBeMoreThanZero();
    error BurnAmountExceedsZero();
    error NotZeroAddress();

    constructor() ERC20 ("DexaStableCoin", " DSC") {}

    function burn (uint256 _amount) external override onlyOwner{
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert MustBeMoreThanZero();
        }
        if( balance < _amount ) {
            revert BurnAmountExceedsZero();
        }
        super.burn(_amount);
    }
    function mint (  address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert NotZeroAddress();
        }
        if ( _amount <= 0) {
            revert MustBeMoreThanZero();
        }
        _mint(_to,_amount );
        return true;
    }



}