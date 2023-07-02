pub contract Staff {
    pub resource interface ITest {
        pub var name:String
        pub var number: Int
        pub fun updateNumber(number: Int): Int
        
    }

    pub resource Test:ITest {
        init(){
            self.name = "Jerry"
            self.number = 1
        }
    
        pub var name: String
        pub var number: Int

        pub fun updateNumber(number: Int): Int{
            self.number = number
            return self.number
        }
    }

    pub fun noInterface(){
        let test: @Test <- create Test()
        test.updateNumber(number: 5)
        log(test.number)
        destroy test
    }

    pub fun yesInterface() {
        let test: @Test{ITest} <- create Test()
        let newNumber: Int = test.updateNumber(number: 5)
        log(test.number)
        destroy  test
    }
}