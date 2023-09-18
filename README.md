## 📝 깃 가이드 


### 📤 프로젝트 열기
* 프로젝트를 하나 생성하고 로컬과 원격 저장소를 연결해줍니다
* ```git init``` // 저장소 생성
* ```git remote -v https://github.com/HIUMC/UMC-5th-iOS-Study.git```  //저장소 내 컴퓨터 <-> 원격 연결
* ```git pull origin main```
* terminal에서 자신의 branch로 checkout을 해주세요
    * ```git checkout origin [본인 github 아이디]```  //브랜치 개념 모른다면 구글링. 자신만의 공간을 만든다고 생각하시면 됩니다.
* 작업은 해당 **본인 branch에서만** 진행해주세요 **(~~❌main branch❌~~)**
    * ```git branch``` : 현재 branch 확인

위의 방식이 어렵다면 깃 Clone 하는 방법을 검색해보기 (로컬과 원격 저장소를 연결할 수 있는 방법, 처음이라면 이 방법을 추천드립니다!)

### 🏡 작업공간 생성
* UMC-5th-iOS-Study (프로젝트 루트 디렉토리)
    * 본인 github 아이디명의 디렉토리 (본인 github 아이디로 설정해주세요!)
        * 해당 주차 혹은 워크북명 (ex. week1, platform)


| 본인 github 아이디명의 디렉토리부터 만들고 시작하시면 됩니다! 😊
```
│
├─ UMC-5th-iOS-Study
│     │
│     ├─ 0-lingual (dir)
│     │     │ 
|     |     ├─ Udemy - iOS & Swift - The Complete iOS App Development Bootcamp
|     |     |    └─ README.md
|     |     |
│     │     ├─  워크북 미션
│     │     │    ├─ README.md // 해당 강의 정리한 내용이 담긴 파일
│     │     │    ├─ week1
│     │     │    ├─ week2
│     │     │    ├─ week3
│     │     │    ├─ week4
│     │     │    ├─ week5
│     │     │    ├─ week6
│     │     │    └─ week7
│     │     │


### 💾 중간 중간 commit 하기
* 파트 별로 작업을 끝냈거나 더 작은 단위로 작업을 끝낼 때 마다 commit을 해 주는 게 좋아요
* ❗commit convention ❗️
    * **Feat**: 새로운 기능 추가
    * **Fix**: 버그 수정
    * **Docs**: 문서 수정
    * **Style**: 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
    * **Refactor**: 코드 리펙토링
    * **Test**: 테스트 코드, 리펙토링 테스트 코드 추가
    * **Chore**: 빌드 업무 수정, 패키지 매니저 수정

* 예시: ```git commit -m "[Feat(본인 이름(닉네임)): OO 기능 추가]"```


### ✍🏻 README.md 파일 작성하기


* 해당 주차 책을 공부하면서 알게 된 부분, 중요하다고 생각한 부분이 있다면 정리해 주세요!
    * 개념 정립도, 요약도 모두 좋습니다! 😊
* 해당 주차 강의를 들으면서 새롭게 알게 된 사실이나 추가적으로 더 공부한 부분이 있다면 정리해 주세요!
  * 요약도, 복습도 모두 좋습니다! 😊😊


* .md 파일은 mark down 언어로 작성된 파일을 뜻해요
    * [참고] https://gist.github.com/ihoneymon/652be052a0727ad59601#24-코드


### 🙌🏻 Github 레포지토리에 push하기

* 해당 주차의 강의를 듣거나 작업을 모두 끝냈다면, 프로젝트 변경 사항을 remote repository(github repository)에 push 합니다
    * ```git push origin [본인 github 아이디 브랜치 명]``` : git에 등록되어 있는 origin(github repository)에 있는 자신의 branch로 프로젝트의 변경 사항을 반영합니다
* push를 완료했다면 스터디 repository에서 pull request를 진행합니다
    * 링크: https://github.com/HIUMC/UMC-5th-iOS-Study/pulls
* PR(Pull Request)시 메세지 제목은 다음과 같이 ```[이름/닉네임] 1주차 정리내용 제출.``` 라고 적은 후 ```create pull request``` 버튼을 눌러주세요
* PR : ```base: [master]``` <- ```compare: [본인 github 아이디]```


### ⏰ 과제 제출 마감 기한 (기재 예정)
