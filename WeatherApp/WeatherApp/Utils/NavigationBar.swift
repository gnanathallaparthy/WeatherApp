

import UIKit

extension UINavigationBar {
      public func navigationBarCustomStyle(){
        self.titleTextAttributes = [NSAttributedString.Key.font: UIFont.init(name: "Helvetica-Bold", size: 20)! as Any, NSAttributedString.Key.foregroundColor: UIColor.white ]
            self.tintColor = UIColor.white
        self.backgroundColor = UIColor.blue
            self.layoutIfNeeded()
        
        }
       
}

extension UITextField {
   
    func setBottomBorder() {
        
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.init(named: "9A1400")?.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
    
}


