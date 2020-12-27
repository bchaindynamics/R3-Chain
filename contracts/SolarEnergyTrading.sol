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
}
