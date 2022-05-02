
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import ".deps/npm/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import ".deps/npm/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import ".deps/npm/@openzeppelin/contracts/security/Pausable.sol";
import ".deps/npm/@openzeppelin/contracts/access/Ownable.sol";
import ".deps/npm/@openzeppelin/contracts/utils/Counters.sol";

contract NFTIme is ERC721, ERC721URIStorage, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("souvenir", "PRZ") {}

    function _baseURI() internal pure override returns (string memory) {
        return "qmsdfghjkl;:";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
    modifier setprice(){ 
        require (msg.value == 0.01 ether);
        _;
        }

    function safeMint(address to) public payable  {
        
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, "https://sdfghjk");
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
