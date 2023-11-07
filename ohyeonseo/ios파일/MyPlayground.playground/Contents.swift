import UIKit

/* 1. 변수와 상수 선언 */
// 1.1 상수
let name: String = "Uno"
let swift = "Swift" //자동으로 String으로 추론한다.


// 1.2 변수
var year: Int = 2022
var y = 2022

year = 2023 //변수이기 때문에 변경 가능

print(year)

/* 2. 함수 만들기 */
func sum(a: Int, b: Int) -> Int { //최종적으로 리턴할 변수
        return a + b
}

//print(sum(a:1, b:2))

func multiply(a: Int, b: Int) -> Int{
    a * b //한줄이면 return 생략 가능
}

//print(multiply(a: 10, b: 10))

/* 이름 짓기 */
//3.1 Lower Camel Case - 인스턴스 / 메소드 / 함수
// - 시작은 소문자 나머지 단어의 시작은 대문자
let viewController = UIViewController() //인스턴스를 생성할 땐 소문자로 !!

// 3.2 Upper Camel Case - 보통 구조체 / 클래스 / 프로토콜 선언 시
// - 시작과 나머지 단어의 시작 모두 대문자

struct Person { //구조체 - 자동으로 초기화 함수 생성해줌
    let a: Int
    let b: Int
}

class Operator { //클래스 - 자동으로 초기화 함수 생성해줌
    let a: Int // 2. 내부에서 값을 저장
    let b: Int
    
    init(a: Int, b: Int){ // 1. 파라미터로 두개의값을 호출하고
        self.a = a
        self.b = b
    }
}

protocol Flyable {
    func fly()
}


