import CryptoPoops from 0x179b6b1cb6755e31

transaction(){
    prepare(signer:AuthAccount) {
        signer.save(<- CryptoPoops.createEmptyCollection(), to:/storage/MyCollection)
        signer.link<&CryptoPoops.Collection{CryptoPoops.ICollection}>(/public/MyCollection, target: /storage/MyCollection)
    }
}