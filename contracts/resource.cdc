pub contract Test {
    init(){
        self.arrayOfGreetings <- []
        self.dictionaryOfGreeting <- {}
    }

    pub var arrayOfGreetings : @[Greeting]
    pub var dictionaryOfGreeting: @{String : Greeting}

    pub resource Greeting {
        pub let message:String

        init() {
            self.message = "Hello Earth"
        }
    }

    pub fun makeAndDestroyGreeting() {
        let myGreeting: @Test.Greeting <- create Greeting()
        destroy  myGreeting
        // return <- myGreeting
    }

    pub fun addGreeting(newGreeting:@Greeting) {
        self.arrayOfGreetings.append(<-newGreeting)
    }

    pub fun removeFromGreeting(index: Int) :@Greeting{
        return <- self.arrayOfGreetings.remove(at: index)
    }

    pub fun addDictGreeting(newGreeting: @Greeting) {
        let key: String = newGreeting.message
        self.dictionaryOfGreeting[key] <-! newGreeting
    }

    pub fun removeDictGreeting(key:String): @Greeting {
        let greeting <- self.dictionaryOfGreeting.remove(key: key) ?? panic("Could not find the greting")
        return <- greeting
    }
}