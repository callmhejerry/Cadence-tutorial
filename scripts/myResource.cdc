import MyResource from 0x01cf0e2f2f715450

pub fun main() : String{
    MyResource.addNftToDict(owner: 0x01)
    let nftRef: &MyResource.NFT = MyResource.getDictRef(key: 0x01)
    log(nftRef.symbol)
    log(nftRef)
    return nftRef.symbol
}