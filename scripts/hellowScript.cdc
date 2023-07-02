import HelloWorld from 0x01cf0e2f2f715450
pub fun main(): Int?{
    let thing :{String : Int} = {"Hi" : 1, "Bonjour" : 2, "Hello" : 3}
    return thing["Bonjour"]
}

