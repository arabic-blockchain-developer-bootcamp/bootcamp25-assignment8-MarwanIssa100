// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";    
import "@openzeppelin/contracts/access/Ownable.sol";

// make this contract inherits from: ERC721URIStorage contract
contract Assignment8 is ERC721URIStorage, Ownable {
    // declare a private uint called _tokenIdCounter
    uint private _tokenIdCounter;    

    // pass name and symbol of the nft token collection
    constructor(string memory _name , string memory _symbol) ERC721( _name , _symbol) Ownable(msg.sender){
    }

    // make this function visibility: external
    // pass string json uri parameter
    // restrict this function to be called only by the owner
        // Hint: You can use OpenZeppelin Ownable contract imported above
    
    function mintNFT(string memory jsonURI) external onlyOwner{
        // call _mint to mint a new nft to the function caller
        uint256 _tokenId = _tokenIdCounter;
        _mint(msg.sender,_tokenId);

        // set token uri to the token id using _setTokenURI
        _setTokenURI(_tokenId,jsonURI);

        // increment token id counter
        _tokenIdCounter++;

    }

}
