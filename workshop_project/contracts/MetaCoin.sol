pragma solidity >=0.4.21 <0.6.0;

// This is a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
    string public constant name = "FoxyFoxyFoxy";
    string public constant symbol = "FFF";

    mapping (address => uint) balances;
    address public instructor;
    uint public transactionCharge = 1;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() public {
        balances[msg.sender] = 10000;
        instructor = msg.sender;
    }

    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount + transactionCharge) return false;
        balances[msg.sender] -= amount + transactionCharge;
        balances[receiver] += amount;
        balances[instructor] += transactionCharge;
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }
}
