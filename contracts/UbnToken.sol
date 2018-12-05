pragma  solidity 0.4.24;


contract UbnToken {
	  //Name
	  string public name = "UbnToken";
	  string public symbol = "UBN";
	  string public standard = "UBn Token v1.0";
	  uint256 public totalSupply;

	  event Transfer(
	  		address indexed _from,
	  		address indexed _to,
	  		uint256 _value
	  	);

	  //approve
	  event Approval(
	  	  address indexed _owner,
	  	  address indexed _spender,
	  	  uint256 _value
	  	);

	  mapping (address => uint256) public balanceOf;
	  mapping (address => mapping(address => uint256)) public allowance;
	  
	  //allowance

	  
	  constructor(uint256 _initialSupply) public {
	  	balanceOf[msg.sender] = _initialSupply;
	  	totalSupply = _initialSupply;
	  
	  }

	  function transfer (address _to, uint256 _value) public returns(bool success) {
	  
	  	require(balanceOf[msg.sender] >= _value);
	  	 
	  	 balanceOf[msg.sender] -= _value;
	  	 balanceOf[_to] += _value;
	     //Return a boolean

	     emit Transfer(msg.sender, _to, _value);
	    

	    return true;
	  }

	  //Delegated Transfer 

	  //approve
	  function approve(address _spender, uint256 _value) public returns(bool success) {
         //allowance
         allowance[msg.sender][_spender] = _value;

	  	//Approval event
	  emit Approval(msg.sender, _spender, _value);

	  	return true;
	  }
	  //transferFrom
	  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
	  		require(_value <= balanceOf[_from]);
	  		require(_value <= allowance[_from][msg.sender]);
	  	//Require _from has enough tokens
	  	//Require allowance is big enough
	  	//Change the balance
	  	balanceOf[_from] -= _value;
	  	balanceOf[_to] += _value;
	  	
	  	//Update the allowance
	  	allowance[_from][msg.sender] -= _value;

	  	//Transfer event
	  	emit Transfer(_from, _to, _value);
	  	//return a boolean

	  	return true;

	  }
}
