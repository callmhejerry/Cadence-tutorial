
pub contract CryptoPoops {
    pub var totalSupply:UInt64

    pub resource NFT {
        pub let name: String;
        pub let favoriteFood:String;
        pub let luckyNumber: UInt64;
        pub let id: UInt64

        init(_name: String, _favoriteFood:String, _luckyNumber:UInt64){
            self.id = self.uuid;
            self.favoriteFood = _favoriteFood;
            self.name = _name;
            self.luckyNumber = _luckyNumber;
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

        pub fun viewNft(nftID: UInt64): &NFT{
            return (&self.ownedNFTs[nftID] as &NFT?)!
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


    pub resource Minter{
        pub fun createNft(name:String, favoriteFood:String, luckyNumber:UInt64): @NFT{
            return <- create NFT(
            _name:name,
            _favoriteFood:favoriteFood,
            _luckyNumber : luckyNumber,
            );
        }
    }
    


    pub fun createEmptyCollection():@Collection {
        return <- create Collection()
    }
    init() {
        self.totalSupply = 0
        self.account.save(<- create Minter(), to: /storage/Minter);
    }
}