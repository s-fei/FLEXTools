//
//  FLEXTools.swift
//  MogoRenter
//
//  Created by song on 16/8/29.
//  Copyright © 2016年 MogoRoom. All rights reserved.
//

//////////////////// 新建window 这个有可能会影响主工程的的keywindow ////////////////////

import UIKit

public class FLEXTools: NSObject {
    
    public static let instance = FLEXTools()
    
    
    var isHiddenWindow = true{
        didSet{
            if window == nil {
                addWindow()
            }
            window.isHidden = isHiddenWindow
        }
    }
    
    var window:UIWindow!
    var btn:UIButton!

    override init() {
        super.init()
    }
    
    func addWindow(){
        window = UIWindow(frame:CGRect(x: UIScreen.main.bounds.width - 55, y: UIScreen.main.bounds.height - 100, width: 55, height: 55))
        window.windowLevel = UIWindow.Level(rawValue: 3000)
        window.backgroundColor = UIColor.clear
        window.isUserInteractionEnabled = true
        
        btn = FLEXButton(frame: window.bounds)
        btn.layer.cornerRadius =  btn.frame.width/2
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.backgroundColor = UIColor(red: 246.0 / 255.0, green: 80.0 / 255.0, blue: 0 / 255.0, alpha: 1)
        btn.alpha = 0.8
        btn.setTitleColor(UIColor.white, for: UIControl.State())

        btn.setTitle("FLEX", for: .normal)
        window.addSubview(btn)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        window.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ panGesture:UIPanGestureRecognizer){
        if panGesture.state ==  .began {
        }
        else if panGesture.state == .changed{
            window.center = panGesture.location(in: UIApplication.shared.keyWindow)
        }
        else if panGesture.state == .ended{
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            let x = window.center.x < screenWidth/2 ? 30: screenWidth - 30
            var y = window.center.y < 30 ? 30: window.center.y
            y = y > screenHeight - 30 ? screenHeight - 30:y
            UIView.animate(withDuration: 0.3, animations: {
                self.window.center = CGPoint(x: x, y: y )
            })
        }
    }
}

public extension FLEXTools {

    /*! 展示FLEXButton */
    public func show() {
        isHiddenWindow = false
    }
    /*! 隐藏FLEXButton */
    public func hidden() {
        isHiddenWindow = true
    }
}

