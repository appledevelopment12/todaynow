//
//  firstVC.swift
//  todaynow
//
//  Created by Rajeev on 13/04/24.
//

import UIKit

class firstVC: UIViewController {
   
    @IBOutlet weak var txtfld:UITextField!
    @IBOutlet weak var img:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfld.borderStyle = .line
        animateBorder()
        
    }
   
    func animateBorder() {
            let animation = CABasicAnimation(keyPath: "borderColor")
            animation.fromValue = UIColor.red.cgColor
            animation.toValue = UIColor.blue.cgColor
            animation.duration = 2.0
            animation.autoreverses = true
            animation.repeatCount = .infinity
        txtfld.layer.borderWidth = 5.0
        txtfld.layer.borderColor = UIColor.blue.cgColor
        txtfld.layer.add(animation, forKey: "borderColor")
        }
    func animateImage() {
           UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
               self.img.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
           }, completion: nil)
       }

}
