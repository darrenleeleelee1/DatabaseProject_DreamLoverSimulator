//
//  CustomLoader.swift
//  DrawingApp
//
//  Created by 張品謙 on 2020/12/29.
//  Copyright © 2020 Ranosys. All rights reserved.
//


import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    var viewColor: UIColor = .white
    var setAlpha: CGFloat = 1.0
    var gifName: String = ""
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        transparentView.isUserInteractionEnabled = false
        return transparentView
    }()
    
    lazy var gifImage: UIImageView = {
        var gifImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
        gifImage.contentMode = .scaleAspectFit
        gifImage.center = CGPoint(
            x: 417,
            y: 500)
        
        gifImage.isUserInteractionEnabled = false
        gifImage.loadGif(name: "banana")
        return gifImage
    }()
    
    lazy var loadImage: UIImageView = {
        var loadImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        loadImage.contentMode = .scaleAspectFit
        loadImage.center = CGPoint(
            x: 417,
            y: 730)
        
        loadImage.isUserInteractionEnabled = false
        loadImage.loadGif(name: "tenor")
        return loadImage
    }()
    
    func showLoaderView() {
        self.addSubview(self.transparentView)
        self.transparentView.addSubview(self.gifImage)
        self.transparentView.addSubview(self.loadImage)
        self.transparentView.bringSubviewToFront(self.gifImage)
        self.transparentView.bringSubviewToFront(self.loadImage)
        UIApplication.shared.keyWindow?.addSubview(transparentView)
        
    }
    
    func hideLoaderView() {
        self.transparentView.removeFromSuperview()
    }
    
}

