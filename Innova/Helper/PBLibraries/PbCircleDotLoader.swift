//
//  PbCircleDotLoader.swift
//  Innova
//
//  Created by Azhar - M1 on 24/01/24.
//

import UIKit
import CoreGraphics
import QuartzCore

class PbCircleDotLoader: UIView
{
    //MARK:- NOT ACCESSABLE OUT SIDE
 
    fileprivate var percentComplete : CGFloat! = 0.0
    fileprivate var duration : CFTimeInterval! = 1
    fileprivate var isAnimating :Bool = false
    fileprivate let kMMRingStrokeAnimationKey = "rajspinner.stroke"
    fileprivate let kMMRingRotationAnimationKey = "rajspinner.rotation"
    fileprivate var repeatCounter: Int = 5000
    fileprivate var timer:Timer!
    fileprivate var backgroundView : UIView!
    
    //MARK:- ACCESS INSTANCE ONLY AND CHANGE ACCORDING TO YOUR NEEDS   *******
    let colors : [UIColor] = [appConfig.appColors.themeColor] //[.red,  .blue,  .orange, .purple]
    var defaultColor : UIColor = UIColor.red
    var isUsrInteractionEnable : Bool = false
    var defaultbgColor: UIColor = UIColor.white
    var loaderSize : CGFloat = 80.0
    /// **************** ******************  ////////// **************
    
    //MARK:- MAKE SHARED INSTANCE
    private static var Instance : PbCircleDotLoader!
    static let sharedInstance : PbCircleDotLoader = {
        
        if Instance == nil
        {
            Instance = PbCircleDotLoader()
        }
        // code is here
        
        return Instance
    }()
    
    //MARK:- DESTROY TO SHARED INSTANCE
   @objc fileprivate func destroyShardInstance()
    {
        PbCircleDotLoader.Instance = nil
    }
    
    //MARK:- SET YOUR LOADER INITIALIZER FRAME ELSE DEFAULT IS CENTER
    func startAnimation()
    {
        let win = UIApplication.shared.keyWindow
        
        backgroundView = UIView()
        backgroundView.frame = (UIApplication.shared.keyWindow?.frame) ?? CGRect(x: 0, y: 0, width: 375, height: 667)
        backgroundView.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        win?.addSubview(backgroundView)
        
         self.frame = CGRect.init(x: ((UIScreen.main.bounds.width) - loaderSize)/2, y: ((UIScreen.main.bounds.height) - loaderSize)/2, width: loaderSize, height: loaderSize)
        
        //self.addCenterImage()
        self.isHidden = false
        
     //   DispatchQueue.main.async {
            self.backgroundView.addSubview(self)
     //   }
        
        
        
        self.layer.cornerRadius = loaderSize/2
        self.layer.masksToBounds = true
        backgroundView.accessibilityIdentifier = "PbCircleDotLoader"
        
     
        // Resume loader if came from background
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PbCircleDotLoader.ResumeLoader), name: UIApplication.didBecomeActiveNotification, object: nil)
       
      
        
        self.layoutSubviews()
    }
    
    //MARK:- AVOID STUCKING LOADER WHEN CAME BACK FROM BACKGROUND
   @objc fileprivate func ResumeLoader()
    {
        if isAnimating
        {
            self.stopAnimation()
            self.AnimationStart()
        }
    }
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.backgroundColor = defaultbgColor
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = isUsrInteractionEnable
         self.AnimationStart()
    }
    
   @objc fileprivate func addCenterImage()
    {
        /// add image in center
        let centerImage = UIImage(named: "app_logo")
        let imageSize = loaderSize/2.5
        
        let centerImgView = UIImageView(image: centerImage)
        centerImgView.frame = CGRect(
            x: (self.bounds.width - imageSize) / 2 ,
            y: (self.bounds.height - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )
        
//        centerImgView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
//        centerImgView.contentMode = .scaleAspectFill
//        centerImgView.clipsToBounds = true
//        centerImgView.accessibilityIdentifier = "CenterImage"
        centerImgView.layer.cornerRadius = imageSize/2
        centerImgView.clipsToBounds = true
        self.addSubview(centerImgView)
        
        

    }
    
    
    //MARK:- CALL IT TO START THE LOADER , AFTER INITIALIZE THE LOADER
   @objc fileprivate func AnimationStart()
    {
        if isAnimating
        {
            return
        }
        
        let size = CGSize.init(width: loaderSize , height: loaderSize)
       
        
        let dotNum: CGFloat = 10
        let diameter: CGFloat = size.width / 5.5   //10
        
        let dot = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2 + diameter * 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter/1.3,
            height: diameter/1.3
        )
        
        dot.backgroundColor = colors[0].cgColor
        dot.cornerRadius = frame.width / 2
        dot.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = 0.1
        
        let angle = (2.0 * .pi) / Double(replicatorLayer.instanceCount)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(dot)
        
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.4
        scaleAnimation.duration = 0.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        dot.add(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * .pi
        rotationAnimation.duration = 6.0
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        replicatorLayer.add(rotationAnimation, forKey: "rotationAnimation")
        
        if colors.count > 1 {
            
            var cgColors : [CGColor] = []
            for color in colors {
                cgColors.append(color.cgColor)
            }
            
            let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
            colorAnimation.values = cgColors
            colorAnimation.duration = 2
            colorAnimation.repeatCount = .infinity
            colorAnimation.autoreverses = true
            dot.add(colorAnimation, forKey: "colorAnimation")
            
        }
        
        self.isAnimating = true
        self.isHidden = false
        
    }
    
    
    //MARK:- CALL IT TO STOP THE LOADER
    func stopAnimation()
    {
        if !isAnimating
        {
            return
        }
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
        }
        let winSubviews = UIApplication.shared.keyWindow?.subviews
        if (winSubviews?.count)! > 0
        {
            for viw in winSubviews!
            {
                if viw.accessibilityIdentifier == "PbCircleDotLoader"
                {
                    viw.removeFromSuperview()
                  //  break
                }
            }
        }
        
        layer.sublayers = nil
        
        
        isAnimating = false
        self.isHidden = true
        
//        if self.subviews.count>0
//        {
//            for sub in self.subviews
//            {
//                if sub.accessibilityIdentifier == "CenterImage"
//                {
//                    sub.removeFromSuperview()
//                }
//            }
//        }
        
        self.destroyShardInstance()
    }
    
    //MARK:- GETTING RANDOM COLOR , AND MANAGE YOUR OWN COLORS
   @objc fileprivate func randomColor()->UIColor
    {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    override func draw(_ rect: CGRect)
    {
        
    }
    
}

