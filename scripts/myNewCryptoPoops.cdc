import CryptoPoops from 0xf8d6e0586b0a20c7
pub fun main(){
    let account:Address = 0xf8d6e0586b0a20c7

   let capability =  getAccount(account).getCapability<&CryptoPoops.Collection>(/public/NftCollection)

   let collection: &CryptoPoops.Collection? = capability.borrow()
   let nft = collection?.borrowAuthNFT(id: 11096869481840902144)
   log(nft?.name)
   log(nft?.owner)
   log(nft?.favoriteFood)
   log(nft?.luckyNumber)
}