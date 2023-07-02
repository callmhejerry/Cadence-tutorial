
pub contract MyResource {
    pub resource NFT {
        pub var symbol :String

        init(){
            self.symbol = "JER"
        }
    }

    pub var nfts : @[NFT]
    pub var myNfts : @{Address: NFT}

    init () {
        self.nfts <- []
        self.myNfts <- {}
    }

    pub fun addNftToArry(nft: @NFT) {
        self.nfts.append(<-nft)
    }

    pub fun addNftToDict(owner: Address) {
        let nft : @NFT <- create NFT()
        self.myNfts[owner] <-! nft
    }

    pub fun removeNftFromArray(index:Int):@NFT {
        return <- self.nfts.remove(at: index)
    }

    pub fun removeNftFromDict(owner:Address):@NFT{
        return <- self.myNfts.remove(key: owner)!
    }

    pub fun getDictRef(key: Address): &NFT {
        let nft: &MyResource.NFT = (&self.myNfts[key] as &NFT?)!
        return nft
    }
}