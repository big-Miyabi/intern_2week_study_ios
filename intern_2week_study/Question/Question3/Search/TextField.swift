import UIKit

final class TextField: UITextField, UITextFieldDelegate {
    
    private struct Const {
        static let albescentOrange = "#FFDED5"
        static let lightOrange = "#FFA98D"
    }
    
    override func awakeFromNib() {
        // 初期スタイル
        self.delegate = self
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.hex(string: Const.albescentOrange, alpha: 1).cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.hex(string: Const.lightOrange, alpha: 1).cgColor
    }
    
    /// リターンキー入力時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        self.layer.borderColor = UIColor.hex(string: Const.albescentOrange, alpha: 1).cgColor
        return true
    }

    /// フォーカスが外れた後
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.layer.borderColor = UIColor.hex(string: Const.albescentOrange, alpha: 1).cgColor
    }
}
