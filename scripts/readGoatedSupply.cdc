import GoatedGoats from 0x2068315349bdfce5

pub fun main():[UInt64]{
    let totalSupply = GoatedGoats.totalSupply;
    let cap = getAccount(0x2068315349bdfce5).getCapability(GoatedGoats.CollectionPublicPath);
    let collection = cap.borrow<&GoatedGoats.Collection>() ?? panic("no collections found");

    return collection.getIDs()

}