import NonFungibleToken from 0xf8d6e0586b0a20c7
pub contract CryptoPoops : NonFungibleToken{

    // EVENTS
    pub event ContractInitialized()
    pub event Withdraw(id: UInt64, from: Address?)
    pub event Deposit(id: UInt64, to: Address?)

    // STATE VARIABLES
    pub var totalSupply:UInt64

    pub resource NFT : NonFungibleToken.INFT{
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

    // pub resource interface ICollection {
    //     pub fun getIDs():[UInt64]
    //     pub fun deposit(token:@NFT)
    // }

    pub resource Collection:NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {

        pub var ownedNFTs: @{UInt64 : NonFungibleToken.NFT}

        pub fun deposit(token: @NonFungibleToken.NFT) {
            let nft: @CryptoPoops.NFT <- token as! @NFT;
            emit Deposit(id: nft.id, to: self.owner?.address);
            self.ownedNFTs[nft.id] <-! nft
        }

        pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT{
            let nft: @NonFungibleToken.NFT <- self.ownedNFTs.remove(key: withdrawID) ?? panic("This NFT does not exist in this Collection.")
            emit Withdraw(id: withdrawID, from :self.owner?.address);
            return <- nft
        }


        pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT{
            return (&self.ownedNFTs[id] as &NonFungibleToken.NFT?)!
        }

        pub fun borrowAuthNFT(id: UInt64): &NFT {
            let ref = (&self.ownedNFTs[id] as auth &NonFungibleToken.NFT?)!
            return ref as! &NFT
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
    


    pub fun createEmptyCollection():@NonFungibleToken.Collection {
        return <- create Collection()
    }
    init() {
        self.totalSupply = 0
        self.account.save(<- create Minter(), to: /storage/Minter);
        emit ContractInitialized();
    }
}