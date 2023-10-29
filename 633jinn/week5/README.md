# Udemy ”누구나 따라할 수 있는 iOS 클론코딩”
# 섹션 6 - 홈 화면 구성

# TableView 실습

스토리 화면은 Collection Veiw로, 아래 게시물 화면은 Table View로 하려고 했으나, 이렇게 만들 경우 게시물을 상하로 스크롤 시 스토리가 사라지지 않게 된다.

→ 전체적으로 Table View 화면으로 만들고, 스토리 부분은 `Cell`을 이용해 Collection View로 만들어준다.

## 1)Table View 추가 - Delegate, Datasource 연결, cell 설정

```swift
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        **tableView.delegate = self
        tableView.dataSource = self**
    }

}
extension HomeViewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 
                // 한 섹션에 몇 개의 cell을 넣을 것인가.
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
                // 어떤 cell을 보여줄 것인가.
        **let cell = UITableViewCell()**
        cell.backgroundColor = .blue
        return cell
    }
}
```

## 2) 개발하고자 하는 화면의 이전 단계를 건너뛰고 싶다면?

viewController의 inspector 창에 보면 view controller칸에 `Is Initial View Controller` 칸이 있다. 

이것을 체크해주면 왼쪽에 화살표가 뜨는 동시에, 시뮬레이터 시작시 화살표가 있는 화면부터 진행된다.

# 홈화면 - 피드 레이아웃 구성

## 1) Cell을 만들기 위한 swift 추가할 때, “Also create XIB file” 체크하기

Table Cell이나 Collection View Cell을 만들기 위해서는 “Also create XIB file”를 꼭 체크해줘야 한다.

생성을 하면 swift  파일 외에 cell 전용 storyboard가 추가된다. 
(이 스토리보드 안에서 cell을 디자인해서 viewController에 연결해준다,)

## 2) Stage Config - Selected

인스타 피드의 하트를 누를 경우, 빈 하트가 빨간 색으로 채워지는 것을 구현하자.

Attribute의 State Config에서 Default에서 **Selected**를 누르면 초기값으로 변하는 것을 볼 수 있다.

여기서 image 변경과 같이 원하는 속성을 변하게 해주면, 스토리보드상에는 나타나지 않지만, 클릭했을 때 설정한 값으로 변하는 것을 볼 수 있을 것이다.

⇒ Controller에서 하트를 Outlet으로 추가하기

```swift
@IBAction func actionIsHeart(_ sender: UIButton) {
    if buttonIsHeart.isSelected{ 
                //하트를 눌렀을 때, 이미 하트가 색칠된 상태라면 빈 하트로 변경
        buttonIsHeart.isSelected = false
    } else {
                //빈 하트를 눌렀다면, 꽉찬 하트로 변경
        buttonIsHeart.isSelected = true
    }
}
```

## 3) Identifier를 통해 HomeViewController에게 Cell 인식시키기

Controller에게 Cell을 인식시켜주기 위해서는 Cell의 Attribute Inspector에 있는 **Identifier를 설정**해주어야 한다. 

이때 Identifier 이름의 경우 헷갈리지 않기 위해 Identity Inspector에 쓰여져 있는 Class명과 동일하게 해주는 것이 좋다.

## 4) HomeViewController에 Cell 연결

이제 내가 만든, 사용하려는 Cell을 넣어주어야 한다. 기존 Cell을 대충 만들어 추가했던 부분에, 

```swift
before)
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떤 cell을 보여줄 것인가.
    let cell = UITableViewCell() //단순 cell을 만듦
    cell.backgroundColor = .blue
    return cell
}

after)
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self

        **// UINib을 통해 실제로 Cell을 등록해줘야 비로소 인식한다!**
    let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
    tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떤 cell을 보여줄 것인가.
    /**
      **identifier이름이 "FeedTableCell"인 Cell을 사용한다. 그리고  FeedTableViewCell.Swift를 따른다**
     */
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableCell", for: indexPath) as? FeedTableViewCell else{
        //오류가 발생할 경우 기본 TableViewCell을 내보낸다.
        return UITableViewCell()
    }
    return cell
}
```

# 홈 화면 - 스토리 레이아웃 구성

## 1) <인스타 피드, 스토리 Cell 나누는 방법 요약>

1. 전체 테이블 뷰를 만든다 → 스토리와, 피드를 보기 위한, 상하 스크롤 되는 전체 UIView라고 생각하면 된다.
2. 피드를 넣기 위한 TableViewCell을 만든다. 
3. 만든 FeedTableVeiwCell은 전체 Controller인 HomeViewController에 추가한다.(tableView.register(nib)을 통해 등록)
이때 FeedCell의 위치는 전체 TableView의 Cell 중 첫번째 Cell을 제외하며, 크기를 지정해줄 수 있다.
    - Cell 갯수 설정
        
        ```swift
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 한 섹션에 몇 개의 cell을 넣을 것인가.
            return 10
        }
        ```
        
    - Cell 크기 설정
        
        ```swift
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 0 {
                return 80
            } else{
                return 600
            }
        }
        ```
        
4. 첫 번째 Cell에 넣을 스토리용 Cell을 만들어야 한다. 이때 첫 번째 Cell은 CollectionViewCell들이 여러 개가 있는 TableViewCell 형태이기 때문에 TableViewCell을 먼저 만들어 줘야 한다.
5. TableViewCell을 만든 후 storyCollectionViewCell를 만들고 원하는 이미지에 맞게 storyboard에 만들어준다.
6.  마지막으로 storyTableViewCell에 등록하고 크기와 개수를 설정한다.
    - collectionViewcell 등록
        
        ```swift
        func setCollectionViewDataSourceDelegate(dataSourceDelgate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int){
              collectionView.delegate = dataSourceDelgate
              collectionView.dataSource = dataSourceDelgate
              collectionView.tag = row
              
              let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
              collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
              
              let flowLayout = UICollectionViewFlowLayout()
              //스크롤 방향 상하->좌우로 변경
              flowLayout.scrollDirection = .horizontal
              //cell의 모서리로부터 얼마나 떨어져있는지 설정
              flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
              //cell 사이의 최소 간격 설정
              flowLayout.minimumLineSpacing = 12
              
              collectionView.collectionViewLayout = flowLayout
              
              collectionView.reloadData()//cell이 등록되었을 때 재실행
          }
        ```
        

## 2) TableView, CollectionView의 스크롤 없애기

TableViewattribute inspector의 “show horizontal/vertical indicator”를 체크 해제

## 3) 오류 해결 - “**nib must contain exactly one top level object which must be a UITableViewCell instance”**

위의 오류가 발생했을 때는 view, button 등이 바깥에 있는지, 또는 최상단에 위치한 object가 두개 이상인지를 확인해야한다. 

아래와 같이 최 상단의 object가 하나가 아닐 때, 하나를 삭제해 해결할 수 있다
<img width="216" alt="1" src="https://github.com/HIUMC/UMC-5th-iOS-Study/assets/113979494/17a960d3-893d-4eec-b8dd-b9d6c26cf786">
---
# Udemy iOS & Swift - The Complete iOS App
# 섹션 8

# 화면의 크기가 작아지더라도, text의 내용을 모두 보이게 하려면?

1. label attribute의 lines를 0으로 설정한다
    
    → 가로 면적이 줄더라도 폰트의 사이즈는 변하지 않으며, 글의 줄이 늘어난다
    
    - 예시
        
        before)
        
        ![스크린샷 2023-10-27 오후 1.34.04.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/572b19a2-37d1-4eef-a4b9-6981545e0aa3/bcb59843-07b7-454b-9732-dcfbe8771381/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-10-27_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_1.34.04.png)
        
        after)
        
        ![스크린샷 2023-10-27 오후 1.33.22.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/572b19a2-37d1-4eef-a4b9-6981545e0aa3/279c5e16-2bce-4817-b74b-c9aa5cf8cfd8/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2023-10-27_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_1.33.22.png)
        
2. minimum font size를 설정한다. 
`Autoshrink`의 minimum font size를 선택, 원하는 값으로 설정하면, 화면의 크기가 줄더라도 최소 길이의 font까지 작아지며, 모든 글의 내용이 보이게 된다.

# Optional이란? - ?와 !의 차이

## ?의 사용법

변수 A에 값이 들어있지 않거나(=Nil, 다른 말로 Null), 변경되어 오류를 일으킬 수 있다는 가능성이 있을 때 ?를 사용한다.

```swift
var hardness : String**?**
```

위 문장과 같이 데이터 타입 뒤에 `?`를 줌으로써  `Optional` 데이터 타입으로 변경해 값이 없더라도 오류를 일으키지 않고, 사용할 수 있다.

> 기본적으로 `var hardness: String = nil`을 준다면, nil은 데이터타입이 String이 아니기 때문에 오류를 일으킨다.
> 

## !의 사용법

?를 통해 Optional 타입으로 바꿔준 변수는, 출력할 때 Optional이라는 함수 안에 싸여서 출력한다.

변수명 뒤에 !를 추가해 Optional이라는 패키징을 풀어줌으로써 본래 변수 값이 출력되게 된다.

```swift
var player1: String? = nil
player1 = "jack"

/* 출력 결과 */
print(player1) 
// 출력 : Optional("jack")
print(player1**!**)
// 출력 : jack
```
