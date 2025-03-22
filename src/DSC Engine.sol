// SPDX-License-Identifier : MIT


/**
 * Dexa Stable Coin has the attributes below
 * Exogermous collateral
 * Dollar Pegged
 * Algoritmically stable
 */
contract DSCEngine{

    error AmountShouldExceedZero ();
    error PriceAndTokenAddressShouldBeEqual();

    mapping( address token => address priceFeed) private priceFeeds;

    modifier MoreThanZero( uint256 amount) {
        if (amount <= 0) {
            revert AmountShouldExceedZero();
        }
        _;
    }

    constructor (address[] memory tokenAddresses, address[] memory priceFeedAddresses, address DexaCoin) {
        if( tokenAddresses.length!= priceFeedAddresses.length) {
            revert PriceAndTokenAddressShouldBeEqual();
        }
        for ( uint256 i=0; i< tokenAddresses.length; i++) {
            priceFeeds[tokenAddresses[i]] = priceFeedAddresses[i];
        }

    }

}