import UIKit

let name:String = "Uno"
let swift = "Swift"

var year: Int = 2023
var y = 2023

func sum(a: Int, b:Int) -> Int{
    return a+b
}
func multiply(a: Int, b: Int ) -> Int{
    a*b
}
print(multiply(a: 10, b: 10))

let viewController = UIViewController()

struct Person{ // 구조체
    let a: Int
    let b: Int
}
class Operator{ // 클래스
    let a: Int
    let b: Int
    
    init(a: Int, b: Int){ // 생성자
        self.a = a
        self.b = b
    }
}
protocol Flyable{
    func fly()
}
