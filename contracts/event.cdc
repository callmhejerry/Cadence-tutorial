pub contract EventTest {
    pub event incremented(oldValue:Int, newValue: Int);

    pub var value:Int;

    pub fun IncrementValue(by:Int) {
        pre {
            self.value < 100: "Reached the limit already"
        }

        post {
            before(self.value) == self.value - by : "It was not incremented";
        }
        self.value = self.value + by;
        emit incremented(oldValue: self.value - by, newValue: self.value);
    }

    init (){
        self.value = 0;
    }
}