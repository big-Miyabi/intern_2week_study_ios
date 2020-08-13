import UIKit

final class Question2ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let areaTexts: [String] = ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"]
    private let urls: [String] = [
        "https://www.ibarakiguide.jp/wp-content/themes/FromMeToYou/images/ibaraki-activity-map.png",
        "https://s3-ap-northeast-1.amazonaws.com/tabi-channel/upload_by_admin/tochigi_travel_800.jpg",
        "https://cdn.mainichi.jp/vol1/2016/10/19/20161019dd0phj000046000p/9.jpg",
        "https://snaplace.jp/wp-content/uploads/2017/11/soukasenbeisaitama.jpg",
        "https://stickershop.line-scdn.net/stickershop/v1/product/1917/LINEStorePC/main.png",
        "https://www.enjoytokyo.jp/img/s_s/l/_26/l/lm_26IMG1.jpg",
        "https://img.travel.rakuten.co.jp/mytrip/content/ranking/spot-kanagawa/images/china_town.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(nibName: "Question2Cell", bundle: nil),
            forCellReuseIdentifier: "question2Cell"
        )
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellをカスタマイズ
        let cell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "question2Cell",
            for: indexPath
        )
        guard let customCell = cell as? Question2Cell,
            let url = URL(string: urls[indexPath.row]) else {
                return UITableViewCell()
        }
        
        customCell.displayCell(text: areaTexts[indexPath.row], url: url)
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // アクションを実装
        let alertController = UIAlertController(
            title: areaTexts[indexPath.row],
            message: "＼(^o^)／",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
