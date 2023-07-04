import MyAccount from 0x01cf0e2f2f715450

pub fun main(){
    let acc :Address = 0xf8d6e0586b0a20c7
    let cap: Capability<&MyAccount.MyAccountResource{MyAccount.IMyAccountResource}> = getAccount(acc).getCapability<&MyAccount.MyAccountResource{MyAccount.IMyAccountResource}>(/public/res)

    let myAccountResource: &MyAccount.MyAccountResource{MyAccount.IMyAccountResource}? = cap.borrow() ?? panic("could not find the resource in the public slot")

    log(myAccountResource!.myBalance)
    // myAccountResource!.updateMyBalance(amount: 20)
    // log(myAccountResource!.myBalance)
}