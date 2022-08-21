import UIKit

struct Person: Codable {
   var firstName: String
   var lastName: String
   var birthDate: Date
   var address: String?
}

let p = Person(firstName: "John", lastName: "Doe", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")

// instance To Json

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
    
    let jsonData = try encoder.encode(p)
    
    // 결과를 보기 위한 로직
    if let jsonStr = String(data: jsonData, encoding: .utf8) {
        print(jsonStr)
    }
    
} catch {
    
    print(error)
}




//



//: [Next](@next)
