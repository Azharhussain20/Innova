//
//  GlobalClasses.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit
import Foundation

class BackgroundImage: UIImageView {
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
        //self.image = UIImage(named: "ic_MainBgImg")
    }
}
@IBDesignable
class GradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    @IBInspectable var startColor: UIColor = .white {
        didSet {
            updateGradientColors()
        }
    }

    @IBInspectable var endColor: UIColor = .black {
        didSet {
            updateGradientColors()
        }
    }

    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0) {
        didSet {
            updateGradientPoints()
        }
    }

    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet {
            updateGradientPoints()
        }
    }

    @IBInspectable var startLocation: Double = 0.0 {
        didSet {
            updateGradientLocations()
        }
    }

    @IBInspectable var endLocation: Double = 1.0 {
        didSet {
            updateGradientLocations()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientColors()
        updateGradientPoints()
        updateGradientLocations()
    }

    private func updateGradientColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }

    private func updateGradientPoints() {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

    private func updateGradientLocations() {
        gradientLayer.locations = [NSNumber(value: startLocation), NSNumber(value: endLocation)]
    }
}
class ThemeButton : UIButton {
    
    override func awakeFromNib() {
        self.applyStyle(buttonFont: UIFont.applyHelveticaNeueRegular(fontSize: 14),
                        textColor: UIColor.black,
                        cornerRadius: 0.0,
                        backgroundColor: UIColor.green,
                        borderColor: nil,
                        borderWidth: nil,
                        state: .normal)
    }
}

class Time: Comparable, Equatable {
    init(_ date: Date) {
        //get the current calender
        let calendar = Calendar.current
        
        //get just the minute and the hour of the day passed to it
        let dateComponents = calendar.dateComponents([.hour, .minute],
                                                     
                                                     from: date)
        
        //calculate the seconds since the beggining of the day for comparisions
        let dateSeconds = dateComponents.hour! * 3600 + dateComponents.minute! * 60
        
        //set the varibles
        secondsSinceBeginningOfDay = dateSeconds
        hour = dateComponents.hour!
        minute = dateComponents.minute!
    }
    
    init(_ hour: Int, _ minute: Int) {
        //calculate the seconds since the beggining of the day for comparisions
        let dateSeconds = hour * 3600 + minute * 60
        
        //set the varibles
        secondsSinceBeginningOfDay = dateSeconds
        self.hour = hour
        self.minute = minute
    }
    
    var hour : Int
    var minute: Int
    
    var date: Date {
        //get the current calender
        let calendar = Calendar.current
        
        //create a new date components.
        var dateComponents = DateComponents()
        
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        return calendar.date(byAdding: dateComponents, to: Date())!
    }
    
    /// the number or seconds since the beggining of the day, this is used for comparisions
    private let secondsSinceBeginningOfDay: Int
    
    //comparisions so you can compare times
    static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.secondsSinceBeginningOfDay == rhs.secondsSinceBeginningOfDay
    }
    
    static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.secondsSinceBeginningOfDay < rhs.secondsSinceBeginningOfDay
    }
    
    static func <= (lhs: Time, rhs: Time) -> Bool {
        return lhs.secondsSinceBeginningOfDay <= rhs.secondsSinceBeginningOfDay
    }
    
    
    static func >= (lhs: Time, rhs: Time) -> Bool {
        return lhs.secondsSinceBeginningOfDay >= rhs.secondsSinceBeginningOfDay
    }
    
    
    static func > (lhs: Time, rhs: Time) -> Bool {
        return lhs.secondsSinceBeginningOfDay > rhs.secondsSinceBeginningOfDay
    }
}
