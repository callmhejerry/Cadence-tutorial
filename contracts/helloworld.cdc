pub contract HelloWorld {
    pub var greeting: String
    pub var myNumber: Int

    init () {
        self.greeting = "Hello World!!"
        self.myNumber = 0
    }

    pub fun changeGreeting(newGreeting:String) {
        self.greeting = newGreeting
    }

    pub fun myNewNumber(newNumber: Int){
        self.myNumber = newNumber
    }
}