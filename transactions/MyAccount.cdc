import MyAccount from 0x01cf0e2f2f715450

transaction(){
    prepare(signer:AuthAccount) {
        // let myAccountResources: @MyAccount.MyAccountResource <- MyAccount.getAccountResource()
        // signer.save(<-myAccountResources, to: /storage/MyAccountResource)
        signer.link<&MyAccount.MyAccountResource{MyAccount.IMyAccountResource}>(/public/res, target: /storage/MyAccountResource)

        // let resourceLink: &MyAccount.MyAccountResource? = signer.borrow<&MyAccount.MyAccountResource>(from: /storage/MyAccountResource)
        // log(resourceLink!.myBalance)
    }

    execute {
    }
}