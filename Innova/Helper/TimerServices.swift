//
//  TimerServices.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit

protocol UpdateTimerServicesDelegate
{
    func GetTimeInterval(timeInterval: TimeInterval)
}
class TimerServices: NSObject
{
    var timer: Timer?
    var delegate : UpdateTimerServicesDelegate?
    
    override init()
    {
        super.init()
    }
    static let shared: TimerServices = {
        let instance = TimerServices()
        return instance
    }()
    
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(appConfig.refereshIntervalTime) , target: self, selector: #selector(updateTime), userInfo: nil, repeats: false)
    }
    @objc func updateTime()
    {
        let elapsedTime : TimeInterval = NSDate().timeIntervalSince1970
        delegate?.GetTimeInterval(timeInterval: elapsedTime)
    }
    func stopTimer()
    {
        timer?.invalidate()
        timer = nil
    }
}
