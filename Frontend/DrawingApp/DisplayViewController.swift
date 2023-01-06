//
//  DisplayViewController.swift
//  DrawingApp
//
//  Created by 張品謙 on 2020/11/28.
//  Copyright © 2020 Ranosys. All rights reserved.
//

import UIKit
var catchPost = ""
class DisplayViewController: UIViewController {
    var imageBase64String = ""
    var dv_face_1 = ""
    var dv_face_2 = ""
    var dv_face_3 = ""
    var dv_face_4 = ""

    var dv_name_1 = ""
    var dv_name_2 = ""
    var dv_name_3 = ""
    var dv_name_4 = ""
    
    var dv_zodiac_1 = ""
    var dv_zodiac_2 = ""
    var dv_zodiac_3 = ""
    var dv_zodiac_4 = ""

    var dv_age_1 = ""
    var dv_age_2 = ""
    var dv_age_3 = ""
    var dv_age_4 = ""

    var imgArr = [] as [UIImage]
    
    @IBOutlet weak var chooseBtn: UIButton!
    @IBOutlet weak var iCarouselView: iCarousel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backViewBtnFnc))
        //loading
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        
        //設定back按鈕
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backimage = UIImage(named: "back")
        let smallImage = self.resizeButton(image: backimage!, width: 100)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backViewBtnFnc))
    }
    
    @objc func backViewBtnFnc(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func resizeButton(image: UIImage, width: CGFloat) -> UIImage {
          let size = CGSize(width: width, height:
                      image.size.height * width / image.size.width)
          let renderer = UIGraphicsImageRenderer(size: size)
          let newImage = renderer.image { (context) in
                      image.draw(in: renderer.format.bounds)
                  }
          return newImage
    }
    
    @IBAction func chooseFavorite(_ sender: Any) {
        print(iCarouselView.currentItemIndex)
        performSegue(withIdentifier: "sendPost", sender: vc_face_1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) //prepare固定宣告方式，寫在第一個頁面的swift中
    {
        if segue.identifier == "sendPost"//連結兩個頁面segue的identifier名稱
        {
            let controller = segue.destination as! FinalViewController
            if iCarouselView.currentItemIndex == 0 {
                controller.finalFace = dv_face_1
                controller.finalName = dv_name_1
                controller.finalZodiac = dv_zodiac_1
                controller.finalAge = dv_age_1
            }
            else if iCarouselView.currentItemIndex == 1 {
                controller.finalFace = dv_face_2
                controller.finalName = dv_name_2
                controller.finalZodiac = dv_zodiac_2
                controller.finalAge = dv_age_2
            }
            else if iCarouselView.currentItemIndex == 2 {
                controller.finalFace = dv_face_3
                controller.finalName = dv_name_3
                controller.finalZodiac = dv_zodiac_3
                controller.finalAge = dv_age_3
            }
            else if iCarouselView.currentItemIndex == 3 {
                controller.finalFace = dv_face_4
                controller.finalName = dv_name_4
                controller.finalZodiac = dv_zodiac_4
                controller.finalAge = dv_age_4
            }
        }
    }
    
    func setupView() {
        // init EmitterCell with image
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "snow.png")?.cgImage
        
        emitterCell.birthRate = 180
        
        emitterCell.lifetime = 5.5
        emitterCell.lifetimeRange = 1.0
        
        emitterCell.yAcceleration = 30.0
        emitterCell.xAcceleration = 10.0
        
        emitterCell.velocity = 30.0
        emitterCell.velocityRange = 200.0
        
        emitterCell.emissionLongitude = .pi * -0.5
        emitterCell.emissionRange = .pi * 0.5
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.15

        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
        
        // init emitter
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 40.0)
        let emitter = CAEmitterLayer()
        emitter.emitterCells = [emitterCell]
        emitter.frame = rect
        
        // appear way
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height/2)
        emitter.emitterSize = rect.size
        view.layer.addSublayer(emitter)
        
    }
}
    
extension DisplayViewController: iCarouselDelegate, iCarouselDataSource {
        
    func numberOfItems(in carousel: iCarousel) -> Int {
        guard  let showImageData_1 = Data(base64Encoded: dv_face_1, options: .ignoreUnknownCharacters) else{return 1}
        guard  let showImageData_2 = Data(base64Encoded: dv_face_2, options: .ignoreUnknownCharacters) else {return 2}
        guard  let showImageData_3 = Data(base64Encoded: dv_face_3, options: .ignoreUnknownCharacters) else {return 3}
        guard  let showImageData_4 = Data(base64Encoded: dv_face_4, options: .ignoreUnknownCharacters) else {return 4}
//        guard  let showImageData_5 = Data(base64Encoded: dv_face_5, options: .ignoreUnknownCharacters) else {return 5}
//        guard  let showImageData_6 = Data(base64Encoded: dv_face_6, options: .ignoreUnknownCharacters) else {return 6}
        imgArr.append(UIImage(data: showImageData_1)!)
        imgArr.append(UIImage(data: showImageData_2)!)
        imgArr.append(UIImage(data: showImageData_3)!)
        imgArr.append(UIImage(data: showImageData_4)!)
//        imgArr.append(UIImage(data: showImageData_5)!)
//        imgArr.append(UIImage(data: showImageData_6)!)
        return 4
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        print("second")
        if view == nil {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-40, height: 400))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        imageView.image = imgArr[index]
        return imageView
    }
        
}
