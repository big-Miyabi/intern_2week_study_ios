import SafariServices
import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article] = []

    static func makeInstance(_ articles: [Article]) -> ArticleListViewController {
        let articleListViewController = R.storyboard.articleList.instantiateInitialViewController()!
        articleListViewController.articles = articles
        return articleListViewController
    }

    override func viewDidLoad() {
        tableView.register(R.nib.articleListCell)
    }
}

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleListCell, for: indexPath),
            let article = articles[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.set(article)
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let urlString = articles[safe: indexPath.row]?.url,
            let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
