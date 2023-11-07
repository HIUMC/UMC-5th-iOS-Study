# iOS & Swift - The Complete iOS App
# 섹션 2

## 1. LaunchScreen과 Main Storyboard의 차이

- LaunchScreen : 앱이 런칭되는 첫 순간에 뭐가 나올지 결정할 수 있다.
    
    ex) 로고, 로딩화면
    
- Main Storyboard: UI를 디자인한다.

## 2. Asssets에서 아이콘의 1x, 2x, 3x란?

- 하나의 밑변에 들어갈 수 있는 색의 수
숫자가 클 수록 확대했을 때 **해상도**가 덜 깨진다.
- ex) 2x는 하나의 픽셀에 2x2 = 4, 4개의 서로 다른 색이 들어갈 수 있다

## 3. Asset의 AppIcon이란?

- 설치된 애플리케이션의 App아이콘(로고)를 관리해준다.
- 홈 화면의 아이콘 이외에도 notification에서 사용되는 아이콘, 세팅에 사용되는 아이콘 등을
각각 관리할 수 있으며 1x, 2x와 같이 크기별로 추가할 수도 있다.
- Assets.xcassets 의 `Contents.json`을 통해 AppIcon의 위치를 지정해줄 수 있다.

