
import Foundation
import UIKit
class CustomButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setRadiusAndShadow()
    }
    func setRadiusAndShadow(){
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.masksToBounds = false
        
    }
}

