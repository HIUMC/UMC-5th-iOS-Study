# Swift문법

# 생성규칙

## 1. 상수

let 변수 이름: 변수 타입 = “Uno”

```swift
let name:String = "Uno"
let swift = "Swift" //타입추정
```

## 2. 변수

```swift
var year: Int = 2023
var y = 2023
```

## 3. 함수

func 함수명(파라미터: 파라미터 타입) → 반환 타입{}

```swift
func sum(a: Int, b:Int) -> Int{
    return a+b
}
func multiply(a: Int, b: Int ) -> Int{
    a*b //반환 값만 존재할 경우 return 생략 가능
}
print(multiply(a: 10, b: 10)) //전달할 인자 값 넣기
```

# 이름 짓는 규칙

## 1. lower Camel Case  - 인스턴스 / 메소드 / 함수

시작은 소문자, 나머지 단어의 시작은 대문자

```swift
let viewController = UIViewController()
```

## 2. Upper Camel Case - 구조체 / 클래스 / 프로토콜

<aside>
💡 구조체는 초기화 함수를 자동으로 만들어주지만, 
클래스는 초기화 함수를 자동으로 만들어주지 않는다.
프로토콜은 어떤 메세징을 보낼지 선언, 구체적인 메세지는 해당 객체 내에서 구현.

</aside>
```swift
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
protocol Flyable{ // 프로토콜
    func fly()
}

```
