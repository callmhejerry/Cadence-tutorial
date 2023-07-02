import HelloWorld from 0x01cf0e2f2f715450
transaction (){
    prepare(signer: AuthAccount){}

    execute{
        HelloWorld.changeGreeting(newGreeting: "Hi")
        HelloWorld.myNewNumber(newNumber: 21)
    }
}
