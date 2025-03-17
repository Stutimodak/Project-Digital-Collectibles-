// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DigitalCollectibles {
    string public projectTitle = "Digital Collectibles";
    string public projectDescription = "Build a marketplace for digital trading cards or collectible items as NFTs.";
    
    struct Collectible {
        uint256 id;
        string name;
        string uri;
        address owner;
    }
    
    uint256 public collectibleCount;
    mapping(uint256 => Collectible) public collectibles;
    
    event CollectibleCreated(uint256 id, string name, string uri, address owner);

    // Function to create a new collectible
    function createCollectible(string memory _name, string memory _uri) public {
        collectibleCount++;
        collectibles[collectibleCount] = Collectible(collectibleCount, _name, _uri, msg.sender);
        emit CollectibleCreated(collectibleCount, _name, _uri, msg.sender);
    }
    
    // Function to fetch collectible details by id
    function getCollectible(uint256 _id) public view returns (uint256, string memory, string memory, address) {
        Collectible memory collectible = collectibles[_id];
        return (collectible.id, collectible.name, collectible.uri, collectible.owner);
    }
    
    // Function to fetch total number of collectibles
    function getTotalCollectibles() public view returns (uint256) {
        return collectibleCount;
    }
}
