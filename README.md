# Merchat contract with the following specs:

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
        1. Only merchant can withdraw the proceeds of sales from the contract to his wallet.
