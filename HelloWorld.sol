pragma solidity ^0.4.21;

contract HelloWorld {

    string public helloWorld;
    address public sender;
    uint public amount;
    
    function HelloWorld() public {
        helloWorld = "Hello Solidity!";
    }
    
    function pay() payable public {
        sender = msg.sender;
        amount += msg.value;
    }
    
    function getAmountAsEther() public constant returns (uint) {
        return amount/1000000000000000000;
    }
    
    function getAmountAsSzabo() public constant returns (uint) {
        return amount/1000000000000;
    }
    
    function getAmountAsFinney() public constant returns (uint) {
        return amount/1000000000000000;
    }

}
