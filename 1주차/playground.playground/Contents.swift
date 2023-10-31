import UIKit

/* 변수와 상수 선언 */
// 상수
let name: String = "potato"
let swift = "Swift"
// 변수
var year: Int = 2022
var y = 2022
year = 2023
print(year) //2023 출력

/* 함수 */
func sum(a: Int, b: Int) -> Int {// 파라미터 타입 지정, 함수의 리턴값 타입
    return a + b // a+b만 써도 정상적으로 출력됨(return 없어도)
}
print(sum(a: 1, b: 2)) // 3

/* 이름 찾기 */
// Lower Camel Case - 인스턴스, 메소드, 함수
// 시작은 소문자, 나머지 단어의 시작은 대문자
let viewController = UIViewController()
// Upper Camel Case - 구조체, 클래스, 프로토콜
// 시작과 나머지 모두 대문자
struct Person {
    let a: Int
    let b: Int
}
class Operator {
    let a: Int
    let b: Int
    
    init(a: Int, b: Int) { // 초기화 함수 작성해야 오류 안 남
        self.a = a
        self.b = b
    }
}
protocol Flyable {
    func fly()
}

