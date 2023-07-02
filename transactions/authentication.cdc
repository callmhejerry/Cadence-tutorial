import Authentication from 0x01cf0e2f2f715450

transaction(){
    prepare(signer: AuthAccount){}

    execute {
        Authentication.addProfile(firstName: "Jeremiah", lastName: "Chinedu", birthday: "june 24", account: 0x01)
        log("we are done")
    }
}