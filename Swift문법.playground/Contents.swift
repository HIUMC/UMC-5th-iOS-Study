import UIKit

/* 1. 변수와 상수 선언 */
// 1.1 상수
let name: String = "Uno"
let swift = "Swift"


// 1.2 변수
var year: Int = 2022
var y = 2022

year = 2023 //값 변경

//print(year)

/* 2. 함수 만들기 */
func sum(a: Int, b: Int) -> Int {
    return a + b
}

//print(sum(a:1, b:2))

func multiply(a: Int, b: Int) -> Int {
    a * b  //한 줄은 return 생략 가능
}

//print(multiply(a: 10, b: 10))

/* 3. 이름 짓기 */
// 3.1 Lower Camel Case - 인스턴스 / 메소드 / 함수
// - 시작은 소문자 나머지 단어의 시작은 대문자.
let viewController = UIViewController()

// 3.2 Upper Camel Case - 구조체 / 클래스 / 프로토콜
// - 시작과 나머지 단어 모두 대문자

struct Person {
    let a: Int
    let b: Int
}

class Operator {  //초기화 함수 생성 안해줌
    let a: Int
    let b: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()
}
