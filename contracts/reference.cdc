pub contract Reference {
    pub var dictOfGreeting : @{String: Greeting}

    pub resource Greeting {
        pub let message: String

        init(_message: String){
            self.message = _message
        }
    }

    init(){
        self.dictOfGreeting <- {
            "chinedu" : <- create Greeting(_message: "Hi Chinedu!"),
            "jerry" : <- create Greeting(_message: "Hi Jerry!")
        }
    }

    pub fun getReference(key: String): &Greeting {
        return (&self.dictOfGreeting[key] as &Greeting?)!
    }
}