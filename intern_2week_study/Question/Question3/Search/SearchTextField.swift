import UIKit

class SearchTextField: UITextField {
    override func awakeFromNib() {
        self.delegate = self
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(hex: "#FFDED5").cgColor
    }
}

extension SearchTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor(hex: "#FFA98D").cgColor
    }
    
    /// リターンキー入力時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        self.layer.borderColor = UIColor(hex: "#FFDED5").cgColor
        return true
    }

    /// フォーカスが外れた後
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor(hex: "#FFDED5").cgColor
    }
}
