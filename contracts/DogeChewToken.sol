// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DogeChewToken is ERC20Burnable, Ownable {
    using SafeMath for uint256;
    using Strings for string;
    TokenTimelock public teamTimelock1;
    TokenTimelock public teamTimelock2;
    TokenTimelock public teamTimelock3;
    TokenTimelock public teamTimelock4;
    TokenTimelock public teamTimelock5;

    uint256 constant _totalSupply = 3 * 10**10;

    uint256 constant _tokenToOffer = 1.5 * 10**10;

    uint256 constant _tokenTeamReserve1 = 1.2 * 10**9;
    uint256 constant _tokenTeamReserve2 = 1.2 * 10**9;
    uint256 constant _tokenTeamReserve3 = 1.2 * 10**9;
    uint256 constant _tokenTeamReserve4 = 1.2 * 10**9;
    uint256 constant _tokenTeamReserve5 = 1.2 * 10**9;

    uint256 constant _tokenLoyalty = 3 * 10**9;
    uint256 constant _tokenMarketing = 3 * 10**9;
    uint256 constant _tokenCooperation = 3 * 10**9;

    string constant _tokenName = "DOGECHEW";
    string constant _tokenSymbol = "DC";

    address constant _tokenToOfferAddress =
        0x75a0Cc530AF5fF6D3d4611CaF6422Ebe25CedBf7;

    address constant _tokenTeamReserveAddress1 =
        0xD6bE95f9898Cfe0e942F43e7417a76EBba08F1BA;
    address constant _tokenTeamReserveAddress2 =
        0xAD5043D495dF6f7103c04911d0aE1d028F721367;
    address constant _tokenTeamReserveAddress3 =
        0x1bBDAf6Bf3b33AAf1181F520c403D98c0deB994E;
    address constant _tokenTeamReserveAddress4 =
        0x38e1a68C547171F323AAc8e7A44F2de4dD531dD5;
    address constant _tokenTeamReserveAddress5 =
        0x166d5057FbD4881872DD14dB5a662F7dC52c9661;

    address constant _tokenLoyaltyAddress =
        0x7FC663904baB33E9bA5c8306ffb211b91c131040;

    address constant _tokenMarketingAddress =
        0xb065f040858c051e0999855a9542ce93A4c1b725;

    address constant _tokenCooperationAddress =
        0x1ae24Fc66211c9A8bbFa618839B9F9800BCB1eD5;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // ICO
        _mint(_tokenToOfferAddress, _tokenToOffer * 10**18);

        // Team reserve
        teamTimelock1 = new TokenTimelock(
            this,
            _tokenTeamReserveAddress1,
            block.timestamp + (60 * 60 * 24 * 56)
        );
        teamTimelock2 = new TokenTimelock(
            this,
            _tokenTeamReserveAddress2,
            block.timestamp + (60 * 60 * 24 * 365 * 1) + (60 * 60 * 24 * 56)
        );
        teamTimelock3 = new TokenTimelock(
            this,
            _tokenTeamReserveAddress3,
            block.timestamp + (60 * 60 * 24 * 365 * 2) + (60 * 60 * 24 * 56)
        );
        teamTimelock4 = new TokenTimelock(
            this,
            _tokenTeamReserveAddress4,
            block.timestamp + (60 * 60 * 24 * 365 * 3) + (60 * 60 * 24 * 56)
        );
        teamTimelock5 = new TokenTimelock(
            this,
            _tokenTeamReserveAddress5,
            block.timestamp + (60 * 60 * 24 * 365 * 4) + (60 * 60 * 24 * 56)
        );
        _mint(address(teamTimelock1), _tokenTeamReserve1 * 10**18);
        _mint(address(teamTimelock2), _tokenTeamReserve2 * 10**18);
        _mint(address(teamTimelock3), _tokenTeamReserve3 * 10**18);
        _mint(address(teamTimelock4), _tokenTeamReserve4 * 10**18);
        _mint(address(teamTimelock5), _tokenTeamReserve5 * 10**18);

        // Loyalty
        _mint(_tokenLoyaltyAddress, _tokenLoyalty * 10**18);

        // Marketing
        _mint(_tokenMarketingAddress, _tokenMarketing * 10**18);

        // Co-operation
        _mint(_tokenCooperationAddress, _tokenCooperation * 10**18);
    }

    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }
}
