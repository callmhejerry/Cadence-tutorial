pub contract interface IHelloWorld {
    pub var greeting:String;
    pub fun changeGreeting(newGreeting: String){
        post {
            self.greeting == newGreeting: "we did not update the greeting";
        }
    };

    pub resource interface IGreeting{
        pub var favoriteFood:String;
    }

    pub resource Greeting{
        pub var favoriteFood:String;
    }
}


