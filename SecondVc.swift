//
//  SecondVc.swift
//  todaynow
//
//  Created by Rajeev on 13/04/24.
//

import UIKit

class SecondVc: UIViewController {
    
    let doubleRangeSlider = DoubleRangeSlider(frame: CGRect(x: 20, y: 200, width: 300, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(doubleRangeSlider)
        doubleRangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged), for: .valueChanged)
    }
    
    @objc func rangeSliderValueChanged() {
        print("Lower value: \(doubleRangeSlider.lowerValue), Upper value: \(doubleRangeSlider.upperValue)")
    }
}
