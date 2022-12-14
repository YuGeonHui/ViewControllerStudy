//: [Previous](@previous)

import Foundation

struct Person: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var address: String?
    
    // Key Mapping
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
        case address = "homeAddress"
    }
    //
}

let jsonStr = """
{
"firstName" : "John",
"age" : 30,
"lastName" : "Doe",
"homeAddress" : "Seoul",
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
    fatalError()
}

let decoder = JSONDecoder()

do {
    let p = try decoder.decode(Person.self, from: jsonData)
    dump(p)
} catch {
    print(error)
}



//: [Next](@next)
