import UIKit

class SearchButton: UIButton {
    
    private func setupButtonStyle() {
        self.layer.cornerRadius = 15.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowColor = UIColor(hex: "#3B4738").cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2
    }
    
    private func setupButtonAction() {
        self.addTarget(self, action: #selector(darken(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(lightenAndSearch(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(lightenAndSearch(_:)), for: .touchUpOutside)
    }
    
    @objc func darken(_ sender: UIButton) {
        self.backgroundColor = UIColor(hex: "#009500")
    }
    
    @objc func lightenAndSearch(_ sender: UIButton) {
        self.backgroundColor = UIColor(hex: "#00C700")
        // この中でSearchViewController内のsearchArgiclesメソッドと
        // SearchTextField内のlightenメソッドを呼び出したい
    }
    
    override func awakeFromNib() {
        setupButtonStyle()
        setupButtonAction()
    }
}
