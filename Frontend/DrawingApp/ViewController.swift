//
//  ViewController.swift
//  DrawingApp
//
//  Created by Ranosys on 19/09/19.
//  Copyright © 2019 Ranosys. All rights reserved.
//

import UIKit

//存畫好的base64
var base64ToDisplay = ""
var vc_face_1 = ""
var vc_face_2 = ""
var vc_face_3 = ""
var vc_face_4 = ""

var vc_name_1 = ""
var vc_name_2 = ""
var vc_name_3 = ""
var vc_name_4 = ""

var vc_zodiac_1 = ""
var vc_zodiac_2 = ""
var vc_zodiac_3 = ""
var vc_zodiac_4 = ""

var vc_age_1 = ""
var vc_age_2 = ""
var vc_age_3 = ""
var vc_age_4 = ""

class ViewController: UIViewController {

    @IBOutlet weak var mark: UIImageView!
    @IBOutlet weak var eraser: UIButton!
    @IBOutlet weak var pencil: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet var featuresView: UIView!
    @IBOutlet weak var widthSlider: UISlider!
    
    var faceNumber:Int = 0 //接收face的號碼
    var blurView = UIVisualEffectView()
    var kHeight: CGFloat = 130 // Total height of feature view
    var animationTime = 0.35
    var colorsArray: [UIColor] = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3823936913, green: 0.8900789089, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.4528176247, blue: 0.4432695911, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        
        // UISlider 的最小值
        widthSlider.minimumValue = 8
        // UISlider 的最大值
        widthSlider.maximumValue = 40
        // UISlider 預設值
        widthSlider.value = 15
        
        //設定back按鈕
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backimage = UIImage(named: "back")
        let smallImage = self.resizeButton(image: backimage!, width: 100)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backViewBtnFnc))
        
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        print(faceNumber)
        if faceNumber == 1 {
            let startPoint = CGPoint(x: 420, y: 100)
            let endPoint = CGPoint(x: 420, y: 950)
            let controlPoint1 = CGPoint(x: 120, y: 95)
            let controlPoint2 = CGPoint(x: 720, y: 95)
            
            let controlPoint3 = CGPoint(x: 160, y: 880)
            let controlPoint4 = CGPoint(x: 680, y: 880)
            
            let endLeft1 = CGPoint(x: 135, y: 500)
            let endRight1 = CGPoint(x: 705, y: 500)
            let path = UIBezierPath()
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endLeft1, controlPoint: controlPoint1)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint3)
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endRight1, controlPoint: controlPoint2)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint4)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 8
    //臉型動畫
    //        let animation = CABasicAnimation(keyPath: "strokeEnd")
    //        animation.fromValue = 0
    //        animation.toValue = 1
    //        //animation.repeatCount = 3 // repeat times
    //        animation.duration = 1  // duration times in seconds
    //        layer.add(animation, forKey: "")
            canvasView.layer.addSublayer(layer)
        }
        else if faceNumber == 2 {
            let startPoint = CGPoint(x: 420, y: 110)
            let endPoint = CGPoint(x: 420, y: 880)
            let controlPoint1 = CGPoint(x: 50, y: 120)
            let controlPoint2 = CGPoint(x: 790, y: 120)
            
            let controlPoint3 = CGPoint(x: 145, y: 850)
            let controlPoint4 = CGPoint(x: 695, y: 850)
            
            let endLeft1 = CGPoint(x: 85, y: 550)
            let endRight1 = CGPoint(x: 755, y: 550)
            let path = UIBezierPath()
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endLeft1, controlPoint: controlPoint1)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint3)
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endRight1, controlPoint: controlPoint2)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint4)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 8
            canvasView.layer.addSublayer(layer)
        }
        else if faceNumber == 3 {
            let startPoint = CGPoint(x: 420, y: 100)
            let endPoint = CGPoint(x: 420, y: 900)
            let controlPoint1 = CGPoint(x: 50, y: 110)
            let controlPoint2 = CGPoint(x: 790, y: 110)
            
            let controlPoint3 = CGPoint(x: 145, y: 840)
            let controlPoint4 = CGPoint(x: 695, y: 840)
            
            let endLeft1 = CGPoint(x: 120, y: 550)
            let endRight1 = CGPoint(x: 720, y: 550)
            let path = UIBezierPath()
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endLeft1, controlPoint: controlPoint1)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint3)
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endRight1, controlPoint: controlPoint2)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint4)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 8
            canvasView.layer.addSublayer(layer)
        }
        else if faceNumber == 4 {
            let startPoint = CGPoint(x: 420, y: 100)
            let endPoint = CGPoint(x: 420, y: 900)
            let controlPoint1 = CGPoint(x: 80, y: 120)
            let controlPoint2 = CGPoint(x: 760, y: 120)
            
            let controlPoint3 = CGPoint(x: 210, y: 890)
            let controlPoint4 = CGPoint(x: 630, y: 890)
            
            let endLeft1 = CGPoint(x: 125, y: 550)
            let endRight1 = CGPoint(x: 715, y: 550)
            let path = UIBezierPath()
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endLeft1, controlPoint: controlPoint1)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint3)
            
            path.move(to: startPoint)
            path.addQuadCurve(to: endRight1, controlPoint: controlPoint2)
            path.addQuadCurve(to: endPoint, controlPoint: controlPoint4)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 8
            canvasView.layer.addSublayer(layer)
        }
        canvasView.clipsToBounds = true  //不會畫出畫板範圍
        featuresView.transform = CGAffineTransform(translationX: 0, y: 0)
        var countDownNum = 30
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countDownNum == 0 {
                  // 销毁计时器
                let image = UIImage(named: "post")
                let smallImage = self.resizeButton(image: image!, width: 100)
                let rightBarButton = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.addTapped))
                self.navigationItem.rightBarButtonItem = rightBarButton
                timer.invalidate()
                self.time.isHidden = true
                // countDownNum = 5
                print(">>> Timer has Stopped!")
            } else {
                self.time.text = String(countDownNum)
                print(">>> Countdown Number: \(countDownNum)")
                countDownNum -= 1
            }
        }
    }
    
    //按下post時觸發
    @objc func addTapped(){
        let controller = UIAlertController(title: "提醒", message: "是否送出?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "是的", style: .default) { (_) in
            let image = self.canvasView.takeScreenshot()
            //送出去時，清空畫布
            //canvasView.clearCanvasView()
            let smallImage = self.resizeImage(image: image, width: 300)
            let imageData = smallImage.pngData()
            let imageBase64String = imageData?.base64EncodedString()
                base64ToDisplay = imageBase64String!
            let json: [String: Any] = ["base64_str": [imageBase64String] ,"photo_name": ["A"], "photo_zodiac": ["87"], "photo_age": ["78"]]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)

            // create post request
            let url = URL(string: "http://140.136.151.131:8000/response_model")!
            
            //設定回傳限制時間
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = 60.0 //無限.infinity
            sessionConfig.timeoutIntervalForResource = 60.0
            let session = URLSession(configuration: sessionConfig)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            // insert json data to the request
            request.httpBody = jsonData

            //原本是URL... .shared.dataTasl
            let task = session.dataTask(with: request) { [self] data, response, error in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Array<String>] { //Any
                    
                    let base64_1 = responseJSON["base64_str"]![0]
                    let base64_2 = responseJSON["base64_str"]![1]
                    let base64_3 = responseJSON["base64_str"]![2]
                    let base64_4 = responseJSON["base64_str"]![3]

                    DispatchQueue.main.sync {
                        vc_face_1 = base64_1
                        vc_face_2 = base64_2
                        vc_face_3 = base64_3
                        vc_face_4 = base64_4

                        vc_name_1 = responseJSON["photo_name"]![0]
                        vc_name_2 = responseJSON["photo_name"]![1]
                        vc_name_3 = responseJSON["photo_name"]![2]
                        vc_name_4 = responseJSON["photo_name"]![3]
                        
                        vc_zodiac_1 = responseJSON["photo_zodiac"]![0]
                        vc_zodiac_2 = responseJSON["photo_zodiac"]![1]
                        vc_zodiac_3 = responseJSON["photo_zodiac"]![2]
                        vc_zodiac_4 = responseJSON["photo_zodiac"]![3]
                        
                        vc_age_1 = responseJSON["photo_age"]![0]
                        vc_age_2 = responseJSON["photo_age"]![1]
                        vc_age_3 = responseJSON["photo_age"]![2]
                        vc_age_4 = responseJSON["photo_age"]![3]
                    
                        print("toDisplay")
                        performSegue(withIdentifier: "goToDisplay", sender: vc_face_1)

                    }
                }
            }
            task.resume()
            //loading
            CustomLoader.instance.showLoaderView()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 17) {//5
                CustomLoader.instance.hideLoaderView()
            }
        }
        controller.addAction(okAction)
        let cancelAction = UIAlertAction(title: "不要啊啊啊啊", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
    //結束loading
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        CustomLoader.instance.hideLoaderView()
//        tmp = 0
//        print("here")
//    }
    
    //上一頁
    @objc func backViewBtnFnc(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickBrushWidth(_ sender: UISlider) {
        canvasView.strokeWidth = CGFloat(sender.value)
    }
    
    @IBAction func onClickClear(_ sender: Any) {
        let controller = UIAlertController(title: "提醒", message: "是否清除?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "是的", style: .default) { (_) in
            self.canvasView.clearCanvasView()
        }
        controller.addAction(okAction)
        let cancelAction = UIAlertAction(title: "不要啊啊啊啊", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    @IBAction func onClickUndo(_ sender: Any) {
        canvasView.undoDraw()
    }
    @IBAction func onClickEraser(_ sender: Any) {
        mark.image = UIImage(named: "office-material")
        canvasView.eraser()
    }
    @IBAction func onClickPencil(_ sender: Any) {
        mark.image = UIImage(named: "pencil")
        canvasView.pencil()
    }
    
    //調整按鈕post的大小
    func resizeButton(image: UIImage, width: CGFloat) -> UIImage {
          let size = CGSize(width: width, height:
                      image.size.height * width / image.size.width)
          let renderer = UIGraphicsImageRenderer(size: size)
          let newImage = renderer.image { (context) in
                      image.draw(in: renderer.format.bounds)
                  }
          return newImage
    }
    
    // 縮小圖片
    func resizeImage(image: UIImage, width: CGFloat) -> UIImage {
        //64*64
        let size = CGSize(width: 32, height: 32)
        let renderer = UIGraphicsImageRenderer(size: size)
        let newImage = renderer.image { (context) in
            image.draw(in: renderer.format.bounds)
        }
        return newImage
    }

    //save picture to album
    @IBAction func onClickSave(_ sender: Any) {  
        let image = canvasView.takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
    }

    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    //傳值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) //prepare固定宣告方式，寫在第一個頁面的swift中
    {
        if segue.identifier == "goToDisplay"//連結兩個頁面segue的identifier名稱
        {
            let controller = segue.destination as! DisplayViewController
            //指向下個頁面的swift檔，之後就可使用裡面宣告的參數
            //("ViewController2"為本範例中下一個頁面參考的swift檔)
            controller.dv_face_1 = vc_face_1
            controller.dv_face_2 = vc_face_2
            controller.dv_face_3 = vc_face_3
            controller.dv_face_4 = vc_face_4

            controller.dv_name_1 = vc_name_1
            controller.dv_name_2 = vc_name_2
            controller.dv_name_3 = vc_name_3
            controller.dv_name_4 = vc_name_4
            
            controller.dv_zodiac_1 = vc_zodiac_1
            controller.dv_zodiac_2 = vc_zodiac_2
            controller.dv_zodiac_3 = vc_zodiac_3
            controller.dv_zodiac_4 = vc_zodiac_4
            
            controller.dv_age_1 = vc_age_1
            controller.dv_age_2 = vc_age_2
            controller.dv_age_3 = vc_age_3
            controller.dv_age_4 = vc_age_4
            
            //指定下一個頁面中由哪個變數來接值
            //base64Name是在下個頁面swift檔(ViewController2)中宣告的一個變數
            
        }
    }
}

extension UIView {

    func takeScreenshot() -> UIImage {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
}
