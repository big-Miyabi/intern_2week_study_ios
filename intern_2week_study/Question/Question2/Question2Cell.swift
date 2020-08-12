import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    func cellDisplay(text: String) {
        self.label?.text = text
    }
}
