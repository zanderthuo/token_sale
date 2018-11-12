pragma  solidity ^0.4.23;

contract UbnToken {
	  //Constractor
	  //Set the number of tokens
	  //Read the total number of tokens 
	  uint256 public totalSupply;

	  function UbnToken() public {
	  	totalSupply = 1000000;
	  }
}
