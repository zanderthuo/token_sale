pragma solidity 0.4.24;

import "./UbnToken.sol";

contract UbnTokenSale {
	address admin;
	UbnToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokenSold;

	event Sell(address _buyer, uint256 _amount);
	
	

	 constructor (UbnToken  _tokenContract, uint256 _tokenPrice) public {
		//Assign an admin
		admin = msg.sender;
		tokenContract = _tokenContract;
		tokenPrice = _tokenPrice;
		//Token Contract
		//Token Price
		//tokenPrice = _tokenPrice;

		}

		//multiply 
		function multiply(uint x, uint y) internal pure returns(uint z) {

			require (y == 0 || (z = x * y)/ y == x);
			
		}

		// Buy Tokens
		function buyTokens(uint256 _numberOfTokens)public payable {
			//Require that value is equal to tokenSold

			require (msg.value == multiply(_numberOfTokens, tokenPrice ));
			//Require that the contract has enough token
			require(tokenContract.balanceOf(this) >= _numberOfTokens);
			//Require that a transfer is successful

			require (tokenContract.transfer(msg.sender, _numberOfTokens));
			
			//keep track of tokenSold
			tokenSold += _numberOfTokens;

			//Trigger Sell Event
			emit Sell(msg.sender, _numberOfTokens );
		}

		//Ending Token UbnTokenSale
		function endSale() public {
			//Require admin
			require (msg.sender == admin);
			//transfer remaining Ubn tokens to admin
			require (tokenContract.transfer(admin, tokenContract.balanceOf(this)));	
			//Destroy contract
			selfdestruct(admin);

		}
	}