import CryptoPoops from 0x01cf0e2f2f715450

pub fun main(address: Address): UInt64{
    let nft: &CryptoPoops.NFT = getAccount(address).getCapability(/public/MyNFT).borrow<&CryptoPoops.NFT>() ?? panic("No Crypto found")
    return nft.id
}