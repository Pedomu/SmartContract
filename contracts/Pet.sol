pragma solidity ^0.4.20;

import "./Petowner.sol";

contract Pet is Petowner {

    event PetInformation(string petNameInfo, uint petAgeInfo, address petAndOwnerAddress, string petOwnerNameInfo, string petOwnerPhoneInfo);
    event PetDelete(string deletePetName, address deletePetAddress);

    string public petName;
    address public petAddress;
    uint public petAges;

    function Pet() public {
        petAges = 0;
    }

    function registerPet(string _petName, uint _petAges) public onlyPetOwner {
        petName = _petName;
        petAddress = msg.sender;
        petAges = _petAges;

        emit PetInformation(petName, petAges, petAddress, petOwnerName, petOwnerPhone);
    }

    function deletePet() public onlyPetOwner {
        require(msg.sender == petAddress);

        emit PetDelete(petName, petAddress);

        delete petName;
        petAddress = 0x0;
        petAges = 0;
    }
}
