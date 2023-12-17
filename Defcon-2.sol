// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract DefconDelhi is ERC20{

    address owner;
    uint private totalsupply;

    constructor(string memory _name, string memory _symbol, uint _total) ERC20(_name, _symbol){
        totalsupply = _total;
        owner = msg.sender;
        _mint(owner, _total);
    }

    modifier onlyAdmin(){
        require(msg.sender == owner, "Only Admin can Access"    );
        _;
    }

    function mint(address _address, uint _value)external onlyAdmin{
        _mint(_address, _value);
        totalsupply+= _value;
    }

    function burn(address _address, uint _value)external{
        _burn(_address, _value);
    }

}
