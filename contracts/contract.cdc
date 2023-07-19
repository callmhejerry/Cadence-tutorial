import IHelloWorld from "contractInterface.cdc";

pub contract HelloWorld: IHelloWorld{
    

    pub var greeting: String

    pub fun changeGreeting(newGreeting: String) {
        self.greeting = newGreeting;
    }

    pub resource Greeting:IHelloWorld.IGreeting{
        pub var favoriteFood: String
        init (){
            self.favoriteFood = "Rice and Beans";
        }
    }
    init(){
        self.greeting = "Hi Jerry";
    }
}