//SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract MyCrypto {
    string public NAME ="RAM03";
    string public SYMBOL = "RM";
    uint private __totalsupply= 1000;

    mapping(address => uint) balances;
    address deployer;
    mapping (address => mapping (address => uint)) allowances;

    constructor() {
        deployer= msg.sender;
        balances[deployer] = 1000;
    }

    function totalSupply()public view returns(uint _totalsupply){
        _totalsupply= __totalsupply;
    }

    function name() public view returns(string memory){
        return NAME;
    }

    function symbol() public view returns (string memory){
        return SYMBOL;
    }

    function decimal() public pure returns (uint){
        return 18;

    }

    function balancesof(address _owner)public view returns(uint) {
        return balances[_owner];
    }

    function transfer(address _to, uint _amount) public returns(bool success) {
       if (_amount<= balances[msg.sender]){
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
       }
    }

    function transferfrom (address _from, address _to, uint _amount) public returns (bool success){
        if(
        allowances[_from][msg.sender] >0 &&
        _amount >0 &&
        allowances[_from][msg.sender] >= _amount) {
            balances[_from] -= _amount;
            balances[_to] += _amount;
            return true;
        }

        return false;

    }

    function approval(address _spender, uint _amount)public returns(bool success) {
        allowances[msg.sender][_spender]= _amount;
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint remaining){
        
        return allowances[_owner][_spender];
    
    }

}
