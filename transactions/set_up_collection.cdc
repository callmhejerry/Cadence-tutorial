import ExampleNFT from "../contracts/ExampleNFT.cdc"

transaction(){
    prepare(signer:AuthAccount){
        signer.link<&ExampleNFT.Collection>(/public/ExampleNFTPublic, target: /storage/ExampleNFTCollection);
        let minter = signer.borrow<&ExampleNFT.Minter>(from: /storage/Minter)
                    ?? panic("You can't mint an NFT");
        let nft <- minter.createNft(name: "Dynamo", favoriteFood: "Rice", luckyNumber: 20);
        log(nft.id);
        log("jerry");
        let nftCollection = signer.borrow<&ExampleNFT.Collection>(from: /storage/ExampleNFTCollection) ??
            panic("You dont have an NFT collection , create one so you can mint an NFT");
        nftCollection.deposit(token: <-nft);
    }
}