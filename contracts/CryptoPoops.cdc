pub contract CryptoPoops {
    pub var totalSupply:UInt64

    pub resource NFT {
        pub let id: UInt64

        init(){
            self.id = self.uuid
        }
    }

    pub resource interface ICollection {
        pub fun getIDs():[UInt64]
        pub fun deposit(token:@NFT)
    }

    pub resource Collection:ICollection{
        pub var ownedNFTs: @{UInt64 : NFT}

        pub fun deposit(token:@NFT) {
            self.ownedNFTs[token.id] <-! token
        }

        pub fun withdraw(withdrawID: UInt64): @NFT {
            let nft: @CryptoPoops.NFT <- self.ownedNFTs.remove(key: withdrawID) ?? panic("This NFT does not exist in this Collection.")
            return <- nft
        }

        pub fun viewNft(nftID: UInt64): &NFT?{
            return &self.ownedNFTs[nftID] as &NFT?
        }

        pub fun getIDs():[UInt64] {
            return self.ownedNFTs.keys
        }

        init(){
            self.ownedNFTs <- {}
        }

        destroy (){
            destroy self.ownedNFTs
        }
    }

    

    pub fun createNFT():@NFT{
        return <- create NFT()
    }

    pub fun createEmptyCollection():@Collection {
        return <- create Collection()
    }
    init() {
        self.totalSupply = 0
    }
}