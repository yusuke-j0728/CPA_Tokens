pragma solidity ^0.5.1;

contract DappToken {
    string public name = "CPA Token";
    string public symbol = "CPA";
    string public standard = "CPA Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // Constructor
    // Set the total number of tokens
    // Read the total number of tokens

    // constructor() public {
    //     totalSupply = 1000000;
    // }
    constructor(uint256 _initialSupply) public {
        totalSupply = _initialSupply;
        // allocate the initial supply
        balanceOf[msg.sender] = _initialSupply;
    }

    // transfer
    function transfer(address _to, uint256 _value) public returns(bool success) {
        // exception if account doesn't have enough
        require(balanceOf[msg.sender] >= _value);
        // transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // transfer event
        emit Transfer(msg.sender, _to, _value);
        // return a boolean
        return true;
    }

    // approve
    function approve(address _spender, uint256 _value) public returns(bool success) {
        // allowance
        allowance[msg.sender][_spender] = _value;
        // approve event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // delegated transfer
    // transferfrom
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
        // require _from has enough tokens
        require(_value <= balanceOf[_from]);
        // require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        // change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        // update the allowance
        allowance[_from][msg.sender] -= _value;
        // transfer event
        emit Transfer(_from, _to, _value);
        // return a boolean
        return true;
    }
    
}