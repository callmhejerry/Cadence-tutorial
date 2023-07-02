import Account from 0x01cf0e2f2f715450

transaction(){
    prepare(signer: AuthAccount){

        signer.link<&Account.Test>(/public/MyResource, target: /storage/MyResource)
        // signer.save(<- Account.createTest(), to: /storage/MyResource)
        // let testResource: &Account.Test? = signer.borrow<&Account.Test>(from: /storage/MyResource)
        //                                     ?? panic("No resource found")
        // signer.save(<-testResource, to: /storage/MyTestResource)
        // log(testResource?.name)
        // destroy  testResource
    }
}