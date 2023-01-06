//
//  FinalViewController.swift
//  DrawingApp
//
//  Created by 張品謙 on 2020/12/29.
//  Copyright © 2020 Ranosys. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    let emitterLayer = CAEmitterLayer()
    
    var finalFace = ""
    var finalName = ""
    var finalZodiac = ""
    var finalAge = ""
    
    
    @IBOutlet weak var final_age: UILabel!
    @IBOutlet weak var final_name: UILabel!
    @IBOutlet weak var final_zodiac: UILabel!
    @IBOutlet weak var final_face: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupBaseLayer()
//        launchFireworks()
        
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        
        //設定back按鈕
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        guard  let showImageData_1 = Data(base64Encoded: finalFace, options: .ignoreUnknownCharacters) else{return}
        final_face?.image = UIImage(data: showImageData_1)
        final_name.text = finalName
        final_zodiac.text = finalZodiac
        final_age.text = finalAge
        
//        self.navigationItem.setHidesBackButton(true, animated: true)
//
//        let image = UIImage(named: "restart")
//        let smallImage = self.resizeButton(image: image!, width: 100)
//        let rightBarButton = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.addrestart))
//        self.navigationItem.rightBarButtonItem = rightBarButton
//
//        let image_2 = UIImage(named: "revise")
//        let smallImage_2 = self.resizeButton(image: image_2!, width: 100)
//        let leftBarButton = UIBarButtonItem(image: smallImage_2.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.addrevise))
//        self.navigationItem.leftBarButtonItem = leftBarButton


    }
    
    @IBAction func modify(_ sender: Any) {
        if let preController = self.navigationController?.viewControllers[4] {
            self.navigationController?.popToViewController(preController, animated: true)
        }
    }
    @IBAction func playAgain(_ sender: Any) {
        //指定跳到哪一介面,0-6
        if let preController = self.navigationController?.viewControllers[1] {
            self.navigationController?.popToViewController(preController, animated: true)
        }
    }
    //    func resizeButton(image: UIImage, width: CGFloat) -> UIImage {
//          let size = CGSize(width: width, height:
//                      image.size.height * width / image.size.width)
//          let renderer = UIGraphicsImageRenderer(size: size)
//          let newImage = renderer.image { (context) in
//                      image.draw(in: renderer.format.bounds)
//                  }
//          return newImage
//    }
//
//    @objc func addrevise(){
//        //指定跳到哪一介面,0-6
//        if let preController = self.navigationController?.viewControllers[4] {
//            self.navigationController?.popToViewController(preController, animated: true)
//        }
//    }
//
//    @objc func addrestart(){
//        //指定跳到哪一介面,0-6
//        if let preController = self.navigationController?.viewControllers[1] {
//            self.navigationController?.popToViewController(preController, animated: true)
//        }
//    }
    
//    func setupBaseLayer()
//    {
//        // Add a layer that emits, animates, and renders a particle system.
//        let size = view.bounds.size
//        print(size)
//        print(size.width)
//        print(size.height)
//        emitterLayer.emitterPosition = CGPoint(x: size.width / 2, y: size.height - 100)
//        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive
//        view.layer.addSublayer(emitterLayer)
//    }
//
//    func launchFireworks()
//        {
//            // Get particle image
//            let particleImage = UIImage(named: "particle")?.cgImage
//
//            // The definition of a particle (launch point of the firework)
//            let baseCell = CAEmitterCell()
//            baseCell.color = UIColor.white.withAlphaComponent(0.8).cgColor
//            baseCell.emissionLongitude = -CGFloat.pi / 2
//            baseCell.emissionRange = CGFloat.pi / 5
//            baseCell.emissionLatitude = 0
//            baseCell.lifetime = 2.0
//            baseCell.birthRate = 1
//            baseCell.velocity = 400
//            baseCell.velocityRange = 50
//            baseCell.yAcceleration = 300
//            baseCell.redRange   = 0.5
//            baseCell.greenRange = 0.5
//            baseCell.blueRange  = 0.5
//            baseCell.alphaRange = 0.5
//
//            // The definition of a particle (rising animation)
//            let risingCell = CAEmitterCell()
//            risingCell.contents = particleImage
//            risingCell.emissionLongitude = (4 * CGFloat.pi) / 2
//            risingCell.emissionRange = CGFloat.pi / 7
//            risingCell.scale = 0.4
//            risingCell.velocity = 100
//            risingCell.birthRate = 50
//            risingCell.lifetime = 1.5
//            risingCell.yAcceleration = 350
//            risingCell.alphaSpeed = -0.7
//            risingCell.scaleSpeed = -0.1
//            risingCell.scaleRange = 0.1
//            risingCell.beginTime = 0.01
//            risingCell.duration = 0.7
//
//            // The definition of a particle (spark animation)
//            let sparkCell = CAEmitterCell()
//            sparkCell.contents = particleImage
//            sparkCell.emissionRange = 2 * CGFloat.pi
//            sparkCell.birthRate = 3000
//            sparkCell.scale = 0.5
//            sparkCell.velocity = 130
//            sparkCell.lifetime = 3.0
//            sparkCell.yAcceleration = 80
//            sparkCell.beginTime = 1.5
//            sparkCell.duration = 0.1
//            sparkCell.alphaSpeed = -0.1
//            sparkCell.scaleSpeed = -0.1
//
//            // baseCell contains rising and spark particle
//            baseCell.emitterCells = [risingCell, sparkCell]
//
//            // Add baseCell to the emitter layer
//            emitterLayer.emitterCells = [baseCell]
//        }

}
