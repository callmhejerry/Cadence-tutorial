import Reference from 0x01cf0e2f2f715450

pub fun main(): String {
    let ref: &Reference.Greeting = Reference.getReference(key: "chinedu")
    log(ref)
    return ref.message
}