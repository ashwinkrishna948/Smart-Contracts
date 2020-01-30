pragma solidity 0.5.0

contract Ballot
{
	struct Candidates
	{
	   bytes32 name;
	   uint voteCount;
	   uint creationDate;
	   uint expirationDate;
	}

	Candidates[] public candidates;
	address public manager;
	bytes32 public votingDistrict;
	mapping(address=>bool)public voters;

	modifier restricted()
	{
	   require(msg.sender==manager);
	   _;
	}

	constructor (bytes32[] candidateNames, bytes32 district, address creator,uint amountOfHours) public
	{
	   manager=creator;
	   votingDistrict=district;
	   for(uint i=0;i<candidateNames.length;i++)
	   {
	      candidatesNames.push(Candidates({
	        name:candidatesNames[i],
	        voteCount:0,
	        creationDate:now,
	        expirationDate:now+amountOfHours,
	      }));
	   }
	}

    function vote(uint candidate) public
    {
       require(!voters[msg.sender]);
       if(now>candidates[candidate].expirationDate)
       {
          revert();
       }

       candidates[candidate].voteCount+=1;
       voter[msg.sender]=true;
    }

    function getCandidateName(uint index) public restricted view returns (bytes32)
    {
        require(now>candidates[candidate].expirationDate)

        return candidate[index].name;
    }

    function getVoteCount (uint index) public restricted view returns (uint)
    {
       require(now>candidates[candidate].expirationDate)

       return candidate[index].voteCount;
    }


}