import Nuke
import UIKit

class Question2Cell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var areaImageView: UIImageView!
    
    func applyCell(text: String, url: URL) {
        label.text = text
        Nuke.loadImage(with: url, into: areaImageView)
    }
}
