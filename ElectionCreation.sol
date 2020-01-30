pragma solidity 0.5.0

contract ElectionCreation
{
	address[] public deployedBallots;
	
	constructor (bytes32[] candidates,bytes32[] district,uint hours) public
	{
	   for (uint i=0;i<district.length;i++)
	   {
          address newBallot=new Ballot(candidates,district[i],msg.sender,hours);
          deployBallots.push(newBallot);
	   }
	}

	function getDeployedBallots() public view returns (address[])
	{
	   return deployedBallots;
	}
}