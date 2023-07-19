pub contract  Test{

    pub event NFTMinted(id:UInt64);

    pub fun logName(name:String) {
        pre {
            name.length < 5: "This name is too short";
        }
        log(name);
    }

    pub fun makePositiveResult(x: Int, y: Int):Int {
        post {
            result > 0 : "The result is not positive";
        }
        return x + y;
    }

    pub resource TestResource {
        pub var number: Int;
        pub let id:UInt64;
        pub fun updateNumber(){
            post {
                before(self.number) == self.number - 1;
            }
            self.number = self.number + 1;
        }
        init(){
            self.id = self.uuid;
            self.number = 0;
            emit NFTMinted(id: self.id);
        }
    }
    
}