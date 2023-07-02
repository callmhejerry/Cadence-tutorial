pub contract Account {
    pub resource Test {
        pub var name :String 
        init(){
            self.name = "Jerry"
        }
    }

    pub fun createTest():@Test{
        return <- create Test()
    }
}