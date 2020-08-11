import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var buttonToAddText: UIButton!
    @IBOutlet weak var buttonToClearText: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFuncToButton(buttonToAddText, #selector(addText(_:)))
        addFuncToButton(buttonToClearText, #selector(clearText(_:)))
        textView.text = ""
        warningLabel.isHidden = true
    }
    
    func addFuncToButton(_ button: UIButton!, _ selector: Selector) {
        button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
    }
    
    @objc func addText(_ sender: UIButton) {
        if textField.text! == "" {
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        textView.text += "\n" + textField.text!
    }
    
    @objc func clearText(_ sender: UIButton) {
        textView.text = ""
    }
}
