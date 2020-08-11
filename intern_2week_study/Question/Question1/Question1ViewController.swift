import UIKit

final class Question1ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addTextButton: UIButton!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextButton.addTarget(self, action: #selector(addText(_:)), for: UIControl.Event.touchUpInside)
        clearTextButton.addTarget(self, action: #selector(clearText(_:)), for: UIControl.Event.touchUpInside)
        textView.text = ""
    }
    
    @objc func addText(_ sender: UIButton) {
        textView.text += "\n" + textField.text!
    }
    
    @objc func clearText(_ sender: UIButton) {
        textView.text = ""
    }
}
