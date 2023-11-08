# iOS & Swift - The Complete iOS App
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
