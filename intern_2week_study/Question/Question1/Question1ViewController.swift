import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.addTarget(self, action: #selector(addText(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet weak var clearButton: UIButton! {
        didSet {
            addButton.addTarget(self, action: #selector(addText(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFuncToButton(addButton, #selector(addText(_:)))
        addFuncToButton(clearButton, #selector(clearText(_:)))
        warningLabel.isHidden = true
    }
    
    func addFuncToButton(_ button: UIButton!, _ selector: Selector) {
        button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
    }
    
    @objc func addText(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        textView.text += "\n" + text
    }
    
    @objc func clearText(_ sender: UIButton) {
        textView.text = ""
    }
}
