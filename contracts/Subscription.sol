//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.4;

contract Subscription{

    uint32 payment;
    address public owner;
    struct Suber{
        string name;
        string surname;
        string email;
        uint32 age;
        uint32 amount;
        address wallet;
        bool isActivated;
        
    }
    Suber[] public subers;
    constructor(){
        owner=msg.sender;
        payment=0;
    }
    
    modifier OwnerOnly{
        require(msg.sender==owner);
        _;
    }
    
    function addSub(string memory _name, string memory _surname, string memory _email, uint32 _age)public{
        subers.push(Suber(_name, _surname, _email,  _age, 0, msg.sender, false));
    }
    
    function depositOnBalance(uint32 _amount)public{
        for(uint i=0; i<subers.length; i++){
            if(subers[i].wallet==msg.sender){
                subers[i].amount+=_amount;
            }
        }
    }
    
     function setPayment(uint32 _payment) public OwnerOnly{
        payment=_payment;
    }
    
    function getPayment() public OwnerOnly{
        for(uint i=0; i<subers.length; i++){
            if(subers[i].amount<payment){
                subers[i].isActivated=false;
            }else{
                subers[i].amount-=payment;
                subers[i].isActivated=true;
            }
        }
    }
    function showInfo() public view
     returns(string memory, string memory, string memory, uint32, uint32,bool){
        for(uint i=0; i<subers.length; i++){
            if(subers[i].wallet==msg.sender){
                return(
                    subers[i].name,
                    subers[i].surname,
                    subers[i].email,
                    subers[i].age,
                    subers[i].amount,
                    subers[i].isActivated);
            }
        }
     }
}