pragma solidity >=0.7.0 <0.9.0;

contract VendingMachine {
    address public owner;

    mapping(address => uint) public cupcakeBalances;

    event Refill(address owner , uint amount ,uint remaining , uint timestamp, uint blockNumber);
    event Purchase(address buyer , uint amount ,uint remaining , uint timestamp, uint blockNumber);

    constructor(){
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }

    function refill(uint amount) public onlyOwner {
        cupcakeBalances[address(this)] = amount;
        emit Refill(msg.sender,amount,cupcakeBalances[address(this)],block.timestamp,block.number);
    }

    function purchase(uint amount) payable public {
        require(amount >= amount * 0.1 ether, "You must pay at least 0.1 eth per cupcake");
        require(cupcakeBalances[address(this)] >= amount, "Not enough cupcakes in stock");
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
        emit Purchase(msg.sender,amount,cupcakeBalances[address(this)],block.timestamp,block.number);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner callable");
        _;
    }
}