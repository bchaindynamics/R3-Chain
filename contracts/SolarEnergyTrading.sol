pragma solidity ^0.4.17;

contract SolarEnergyEnergyTrade {
struct Offer { 
    uint32 ID;
    address seller;
    address buyer;
    string P2L_HASH;
    string L2P_HASH;
    uint32 energy;
    uint32 price;
    uint timeOffered;
    uint timePaidP2L;
    bool P2L_Paid;
    bool L2P_Paid;
    bool deliverd;
    }

    mapping(uint32 =>Offer) public offers;
    uint32 public offerId;


    function addOffer(uint32 energy, uint32 price) public {
        Offer storage newOffer = offers[offerId];
        newOffer.ID = offerId;
        newOffer.seller = msg.sender;
        newOffer.energy = energy;
        newOffer.price = price;
        newOffer.timeOffered = now;
        newOffer.picked = false;
        newOffer.P2L_Paid = false;
        newOffer.L2P_Paid = false;
        newOffer.deliverd = false;
        offerId += 1;
    }

    function pickOffer(uint32 id) public{
        offers[id].picked = true;        
    }

    function confirmP2L_Tx(uint32 id,string P2L_Hash) public{
        offers[id].P2L_Paid = true;
        offers[id].P2L_Hash = P2L_HASH;
        offers[id].buyer = msg.sender;
        offers[id].timePaidP2L = now;
    }

    function PoD(uint32 id) public{
        offers[id].deliverd = true;
    }

    function confirmL2P_Tx(uint32 id,string L2P_Hash) public{
        offers[id].L2P_Paid = true;
        offers[id].L2P_Hash = L2P_HASH;        
    }
}
