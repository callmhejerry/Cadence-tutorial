import CryptoPoops from 0xf8d6e0586b0a20c7

transaction(){
    prepare(signer:AuthAccount){

        // signer.save(<-CryptoPoops.createEmptyCollection(), to: /storage/NftCollection);
        signer.link<&CryptoPoops.Collection>(/public/NftCollection, target: /storage/NftCollection);
        
        // let capability: Capability? = signer.capabilities.get<&Capability>(/public/NftCollection)
        // ?? panic("No capailty found");
        // signer.capabilities.publish(capability!, at: /public/NftCollection);

        let collection: &CryptoPoops.Collection? = signer.borrow<&CryptoPoops.Collection>(from: /storage/NftCollection)
        ?? panic("no collection found");
        let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter) ?? panic("you cant mint an nft for your self");
        let nft <- minter.createNft(name: "Crypto Jerry", favoriteFood: "Rice and Beans", luckyNumber: 24);
        log(nft.id);
        collection!.deposit(token: <-nft)
     
    }
}