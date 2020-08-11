import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    func addFuncToButton(_ button: UIButton!, _ selector: Selector) {
        button.addTarget(self, action: selector, for: UIControl.Event.touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFuncToButton(addTextButton, #selector(addText(_:)))
        addFuncToButton(clearTextButton, #selector(clearText(_:)))
        textView.text = ""
        warningLabel.isHidden = true
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
