import ExampleNFT from "../contracts/ExampleNFT.cdc"
// import ExampleNFT from 0xb8cd3153e48ea418

pub fun main (signer:Address) : UInt64{
     let totalSupply : UInt64 = ExampleNFT.totalSupply;
     log(totalSupply)
     let cap = getAccount(signer).getCapability(/public/ExampleNFTPublic);
     let collection = cap.borrow<&ExampleNFT.Collection>() ?? panic("No collection found");
    
    let ids = collection.getIDs();
     let nft  = collection.borrowAuthNFT(id: ids[0])
     log(nft.favoriteFood)
     log(nft.name)
     log(nft.id)
     return nft.id
}