pragma solidity >=0.4.22 <0.6.0;

contract registerMeter {
    mapping (address => bool) registeredMeter;
    address[] public registeredMeters;

    constructor() public payable  {
    }

    function register() public payable{
        require(msg.value > .01 ether);
        registeredMeter[msg.sender] = true;
        registeredMeters.push(msg.sender);
    }

    //modifier to ensure that only registered meters can create orders
    modifier onlyRegisteredMeters {
        require (registeredMeter[msg.sender] == true);
        _;
    }
}
