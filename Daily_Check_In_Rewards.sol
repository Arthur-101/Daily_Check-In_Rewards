pragma solidity ^0.8.0;

contract DailyLoginRewards {
    mapping(address => uint256) public lastClaimed;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 1 ether; // Fixed reward per login

    function claimReward() public {
        require(block.timestamp >= lastClaimed[msg.sender] + 1 days, "Already claimed today");
        
        lastClaimed[msg.sender] = block.timestamp;
        rewards[msg.sender] += rewardAmount;
    }
}
