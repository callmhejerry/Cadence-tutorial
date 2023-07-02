pub fun main() {
    var people : [String] = ["chinedu", "jerry"]
    var addresses : [Address] = [0x1, 0x2, 0x3]

    people.append("chizzy")

    var names : {String: String} = {"chinedu" : "Jeremiah", "obi" : "Marvelous"}

    log(names["chinedu"])

    var name :String? = nil
    // var name2 : String = name!

    ///QUEST

    var myArray : [String] = ["chi", "kelechi", "chizzy"]
    log (myArray)
    let socials : {String : UInt16} = {"facebook" : 0, "Instagram" : 15, "Whatsapp" : 16, "Twitter" : 14}
}