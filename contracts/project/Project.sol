// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ProjectCrowdfunding {
    uint256 private id; 
    string private name;
    address payable private owner;
    uint256 private requiredFunds;
    uint256 private totalFunded;
    string private description;
    bool private isOpen;

    constructor
        (string memory _name, 
            uint256 _requiredFunds,
            string memory _description,
            bool _isOpen
        ) {
        name = _name;
        requiredFunds = _requiredFunds;
        totalFunded = 0 wei;
        owner = payable(msg.sender);
        description = _description;
        isOpen = _isOpen;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You need to be the owner from this project to make this change");
        _;
    }

    function fundProjecy() public payable {
        require(isOpen, "Owner has decided to stop this fundraising for a while. Stay tuned");
        require(totalFunded <= requiredFunds, "Goal already achieved so you are not able to fund this anymore");
        require(msg.value != uint256(0), "Please add some funds to contribute this project");
        require(totalFunded + msg.value >= requiredFunds, "unable to add more funds, check amount remaining for our goal");
        
        owner.transfer(msg.value);
        totalFunded += msg.value / 1 ether;
    }

    function changeProjectState() public {
        isOpen = !isOpen;
    }

    function viewRemaining() public view returns(uint256){
        return requiredFunds - totalFunded;
    }

    function getIsOpen() public view returns(bool) {
        return isOpen;
    }

    function getName() public view returns(string memory) {
        return name;
    }

    function setName(string memory _name) public onlyOwner {
        name = _name;
    }

    function getRequiredFunds() public view returns(uint256) {
        return requiredFunds;
    }

    function setRequiredFunds(uint256 _requiredFunds) public onlyOwner {
        requiredFunds = _requiredFunds;
    }

    function getTotalFunded() public view returns(uint256) {
        return totalFunded;
    }

    function getDescription() public view returns(string memory) {
        return description;
    }

    function setDescription(string memory _description) public onlyOwner {
        description = _description;
    }

} 