import CryptoPoops from "../contracts/CryptoPoops.cdc"

transaction(){
    prepare(signer:AuthAccount) {
        signer.save(<- CryptoPoops.createEmptyCollection(), to:/storage/MyCollection)
        signer.link<&CryptoPoops.Collection{CryptoPoops.ICollection}>(/public/MyCollection, target: /storage/MyCollection)
    }
}