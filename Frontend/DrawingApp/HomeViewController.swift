//
//  HomeViewController.swift
//  DrawingApp
//
//  Created by 張品謙 on 2020/11/26.
//  Copyright © 2020 Ranosys. All rights reserved.
//

import AVKit
import AVFoundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        
        
        //設定標題
        myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        myLabel.numberOfLines = 0
        myLabel.text = "Which gender do you want for your dream lover?"
        //設定back按鈕
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backimage = UIImage(named: "back")
        let smallImage = self.resizeButton(image: backimage!, width: 100)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backViewBtnFnc))
        //title = "Home"
        //下雪
//        setupView()
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
    
    @IBAction func sendMale(_ sender: Any) {
        let json: [String: Any] = ["gender": "male"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        let url = URL(string: "http://140.136.151.131:8000/chose_gender")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // insert json data to the request
        request.httpBody = jsonData
        //設定回傳時間
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0 //無限.infinity
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        //[self] data, response 拿掉
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: String] { //Any
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    @IBAction func sendFemale(_ sender: Any) {
        let json: [String: Any] = ["gender": "female"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        let url = URL(string: "http://140.136.151.131:8000/chose_gender")!
        //設定回傳限制時間
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = .infinity //無限.infinity
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // insert json data to the request
        request.httpBody = jsonData

        //[self] data, response 拿掉
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: String] { //Any
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    @IBAction func sendRandom(_ sender: Any) {
        let json: [String: Any] = ["gender": "mix"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        let url = URL(string: "http://140.136.151.131:8000/chose_gender")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // insert json data to the request
        request.httpBody = jsonData

        //[self] data, response 拿掉
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: String] { //Any
                print(responseJSON)
            }
        }
        task.resume()
    }
 
    
//    func setupView() {
//        // init EmitterCell with image
//        let emitterCell = CAEmitterCell()
//        emitterCell.contents = UIImage(named: "snow")?.cgImage
//        //粒子的創建速率
//        emitterCell.birthRate = 15
//
//        emitterCell.lifetime = 13.0
//        emitterCell.lifetimeRange = 2.0
//
//        emitterCell.yAcceleration = 30.0
//        emitterCell.xAcceleration = 10.0
//
//        emitterCell.velocity = 60.0
//        emitterCell.velocityRange = 100.0
//
//        emitterCell.emissionLongitude = .pi * -0.5
//        emitterCell.emissionRange = .pi * 0.5
//
//        emitterCell.scale = 0.6
//        emitterCell.scaleRange = 0.0
//        emitterCell.scaleSpeed = -0.05
//
//        emitterCell.alphaRange = 0.75
//        emitterCell.alphaSpeed = -0.15
//
//        // init emitter
//        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: -250.0)
//        let emitter = CAEmitterLayer()
//        emitter.emitterCells = [emitterCell]
//        emitter.frame = rect
//
//        // appear way
//        emitter.emitterShape = CAEmitterLayerEmitterShape.line
//        emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height/2)
//        emitter.emitterSize = rect.size
//        view.layer.addSublayer(emitter)
//
//    }
}
