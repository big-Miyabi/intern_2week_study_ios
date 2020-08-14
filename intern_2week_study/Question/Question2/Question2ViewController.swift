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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Question2Cell", bundle: nil),
                           forCellReuseIdentifier: "question2Cell")
    }
}

extension UIAlertController {
    class func singleBtnAlertWithTitle(title: String, message: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_ action: UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
    
    class func doubleBtnAlertWithTitle(title: String, message: String, otherBtnTitle: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .default, handler: { (_ action: UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return areaTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellをカスタマイズ
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "question2Cell", for: indexPath) as? Question2Cell, let url = URL(string: urls[indexPath.row]) else { return UITableViewCell() }
        
        cell.applyCell(text: areaTexts[indexPath.row], url: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // アクションを実装
        let alert = UIAlertController.singleBtnAlertWithTitle(title: areaTexts[indexPath.row], message: "＼(^o^)／", completion: nil)
        self.present(alert, animated: true, completion: nil)
    }
}
