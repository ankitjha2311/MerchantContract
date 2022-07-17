// SPDX-License-Identifier: MIT
/*Write sample contract with the following specs:
    1. State variables:
        1. Merchant
        2. Buyer
        3. Price
    2. Constructor:
        1. Can be initiated only by the merchant
    3. Pricing function:
        1. Create price of product -  ensure only merchant can set price of product.
    4. Pay:
        1. Calculate current gas fees on blockchain.
        2. Add current gas to price of product.
        3. Take payment from msg.
   5. Withdraw:
        1. Let ONLY merchant withdraw the proceeds of sales from the contract to his wallet.
*/

pragma solidity ^0.8.0;

contract SampleContract{
    // Task 1 State Variables
    address payable public merchant;
    address payable public Buyer;
    uint public Price;
   
// to store the state of contract at any given time


// Task 2: Constructor
    constructor() payable{
      merchant= payable(msg.sender);
  }


// Task 3: Pricing Function
   function Pricing(uint _price) public{
      require(msg.sender == merchant, "Only Merchant can add the product price");
       Price=_price;
    }



//Task 4: Pay Function
     function Pay() external payable {
     
     Buyer= payable(msg.sender);
      uint gasprice= tx.gasprice;
      uint totalPrice= Price+gasprice; 
      require( msg.value >=totalPrice, "Please send right amount");
      uint returnAmount= msg.value-totalPrice;
      Buyer.transfer(returnAmount);
      //return Buyer;
    }




//Task 5: Withdraw Function
     function Withdraw() public{
         require(msg.sender == merchant, "Only Merchant can Withrdraw");
     payable (merchant).transfer(address(this).balance);
    }
}