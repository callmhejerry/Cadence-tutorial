import CryptoPoops from 0x01cf0e2f2f715450

transaction(recipient: Address){
    prepare(otherAccount: AuthAccount) {
        let cap: Capability<&CryptoPoops.Collection{CryptoPoops.ICollection}>? = getAccount(recipient).capabilities.get<&CryptoPoops.Collection{CryptoPoops.ICollection}>(/public/MyCollection)
                                        ?? panic("No Collection found")
        let collection: &CryptoPoops.Collection{CryptoPoops.ICollection}? = cap!.borrow()
        collection!.deposit(token: <- CryptoPoops.createNFT())
    }
}