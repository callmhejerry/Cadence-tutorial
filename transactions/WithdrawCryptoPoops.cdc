import CryptoPoops from 0x01cf0e2f2f715450

transaction(id: UInt64, recipient: Address){
    prepare(signer: AuthAccount) {
      let signersCollection: &CryptoPoops.Collection? = signer.borrow<&CryptoPoops.Collection>(from: /storage/MyCollection);
      

      let recipientCollection: &CryptoPoops.Collection{CryptoPoops.ICollection} = getAccount(recipient).capabilities.borrow<&CryptoPoops.Collection{CryptoPoops.ICollection}>(/public/MyCollection) 
      ?? panic("no capability found");
      var nft: @CryptoPoops.NFT <- signersCollection?.withdraw(withdrawID: id) ?? panic("No nft");
      recipientCollection.deposit(token: <- nft);
    }
}