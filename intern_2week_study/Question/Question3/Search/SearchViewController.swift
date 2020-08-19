import UIKit

final class SearchViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.addTarget(self, action: #selector(darken(_:)), for: .touchDown)
            searchButton.addTarget(self, action: #selector(lightenAndSearch(_:)), for: .touchUpInside)
            searchButton.addTarget(self, action: #selector(lightenAndSearch(_:)), for: .touchUpOutside)
        }
    }
    
    @objc func darken(_ sender: UIButton) {
        searchButton.backgroundColor = UIColor.hex(string: "#009500", alpha: 1)
    }
    
    @objc func lightenAndSearch(_ sender: UIButton) {
        searchButton.backgroundColor = UIColor.hex(string: "#00C700", alpha: 1)
        textField.layer.borderColor = UIColor.hex(string: "#FFDED5", alpha: 1).cgColor
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func searchArticles() {
        // 多重タップ防止
        searchButton.isEnabled = false
        guard let text = textField.text, !text.isEmpty else { return }
        
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            // URLSessionはbackground threadで行われる為UIの更新を明示的にMain Theadで行う
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.showArticleListScreen(articles)
                    
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert, animated: true)
                }
                self?.searchButton.isEnabled = true
            }
        }
    }
    
    private func showArticleListScreen(_ articles: [Article]) {
        let articleListViewController = ArticleListViewController.makeViewController(articles)
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}
