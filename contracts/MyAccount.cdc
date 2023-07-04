pub contract MyAccount {
    pub resource interface IMyAccountResource {
        pub var myBalance: Int
    }

    pub resource MyAccountResource:IMyAccountResource {
        pub var myBalance: Int

        init () {
            self.myBalance = 0
        }

        pub fun updateMyBalance(amount:Int){
            self.myBalance = amount
        }
    }

    pub fun getAccountResource():@MyAccountResource{
        return <- create MyAccountResource()
    }
}