pub struct Profile {
    pub let firstName :String
    pub let lastName: String
    pub let birthday : String
    pub let account  : Address

    init(_firstName:String , _lastName:String, _birthday:String, _account:Address){
        self.account = _account
        self.birthday = _birthday
        self.firstName = _firstName
        self.lastName = _lastName
    }
}