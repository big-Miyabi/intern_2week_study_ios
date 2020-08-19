import UIKit

class SearchButton: UIButton {
    
    private func setupButtonStyle() {
        self.layer.cornerRadius = 15.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowColor = UIColor.hex(string: "#3B4738", alpha: 1).cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2
    }
    
    override func awakeFromNib() {
        setupButtonStyle()
    }
}
