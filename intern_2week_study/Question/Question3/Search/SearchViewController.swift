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
        searchButton.backgroundColor = UIColor(red: 63 / 255, green: 149 / 255, blue: 0.0, alpha: 1.0)
    }
    
    @objc func lightenAndSearch(_ sender: UIButton) {
        searchButton.backgroundColor = UIColor(red: 0, green: 201 / 255, blue: 0, alpha: 1.0)
        searchArticles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 15.0
        searchButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        searchButton.layer.shadowColor = UIColor(red: 65 / 255, green: 73 / 255, blue: 59 / 255, alpha: 1).cgColor
        searchButton.layer.shadowOpacity = 0.7
        searchButton.layer.shadowRadius = 2
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
        let articleListViewController = ArticleListViewController.makeInstance(articles)
        navigationController?.pushViewController(articleListViewController, animated: true)
    }
}
