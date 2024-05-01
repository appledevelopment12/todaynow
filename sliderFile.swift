import UIKit

class DoubleRangeSlider: UIControl {
    
    private let lowerThumbView2 = UIButton()
    private let upperThumbView2 = UIButton()
    private let selectedRangeView2 = UIView()
    
    var minimumValue: Float = 0.0
    var maximumValue: Float = 1.0
    var lowerValue: Float = 0.4 {
        didSet {
            updateThumbPositions()
        }
    }
    var upperValue: Float = 0.6 {
        didSet {
            updateThumbPositions()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        lowerThumbView2.backgroundColor = .green
        addSubview(lowerThumbView2)
        
        upperThumbView2.backgroundColor = .green
        addSubview(upperThumbView2)
        
        selectedRangeView2.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        addSubview(selectedRangeView2)
    }
    
    private func updateThumbPositions() {
        let trackWidth = bounds.width - thumbWidth
        let lowerX = CGFloat(lowerValue) * trackWidth
        let upperX = CGFloat(upperValue) * trackWidth
        
        lowerThumbView2.frame = CGRect(x: lowerX, y: bounds.height / 2 - thumbWidth / 2, width: thumbWidth, height: thumbWidth)
        upperThumbView2.frame = CGRect(x: upperX, y: bounds.height / 2 - thumbWidth / 2, width: thumbWidth, height: thumbWidth)
        selectedRangeView2.frame = CGRect(x: lowerThumbView2.frame.maxX, y: bounds.height / 2 - trackHeight / 2, width: upperThumbView2.frame.minX - lowerThumbView2.frame.maxX, height: trackHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateThumbPositions()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchLocation = touch.location(in: self)
        return lowerThumbView2.frame.contains(touchLocation) || upperThumbView2.frame.contains(touchLocation)
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchLocation = touch.location(in: self)
        let trackWidth = bounds.width - thumbWidth
        let value = boundValue(Float(touchLocation.x / trackWidth))
        if lowerThumbView2.frame.contains(touchLocation) {
            lowerValue = value
        } else if upperThumbView2.frame.contains(touchLocation) {
            upperValue = value
        }
        sendActions(for: .valueChanged)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        // No need to do anything here
    }
    
    private func boundValue(_ value: Float) -> Float {
        return min(max(value, minimumValue), maximumValue)
    }
    
    private let thumbWidth: CGFloat = 20.0
    private let trackHeight: CGFloat = 5.0
}
//
//class SecondVc: UIViewController {
//    
//    let doubleRangeSlider = DoubleRangeSlider(frame: CGRect(x: 20, y: 200, width: 300, height: 50))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(doubleRangeSlider)
//        doubleRangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged), for: .valueChanged)
//    }
//    
//    @objc func rangeSliderValueChanged() {
//        print("Lower value: \(doubleRangeSlider.lowerValue), Upper value: \(doubleRangeSlider.upperValue)")
//    }
//}
