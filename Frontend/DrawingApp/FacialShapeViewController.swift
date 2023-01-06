//
//  FacialShapeViewController.swift
//  DrawingApp
//
//  Created by 張品謙 on 2020/12/6.
//  Copyright © 2020 Ranosys. All rights reserved.
//

import UIKit

var faceid = 0
class FacialShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        //設定back按鈕
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backimage = UIImage(named: "back")
        let smallImage = self.resizeButton(image: backimage!, width: 100)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: smallImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backViewBtnFnc))
        // Do any additional setup after loading the view.
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) //prepare固定宣告方式，寫在第一個頁面的swift中
        {
            if segue.identifier == "goToFace1"//連結兩個頁面segue的identifier名稱
              {
                let controller = segue.destination as! ViewController
                faceid = 1
                 //指向下個頁面的swift檔，之後就可使用裡面宣告的參數
                 //("ViewController2"為本範例中下一個頁面參考的swift檔)
                controller.faceNumber = faceid
                //指定下一個頁面中由哪個變數來接值
               //base64Name是在下個頁面swift檔(ViewController2)中宣告的一個變數
            }
            else if segue.identifier == "goToFace2"{
                let controller = segue.destination as! ViewController
                faceid = 2
                 //指向下個頁面的swift檔，之後就可使用裡面宣告的參數
                 //("ViewController2"為本範例中下一個頁面參考的swift檔)
                controller.faceNumber = faceid
                //指定下一個頁面中由哪個變數來接值
               //base64Name是在下個頁面swift檔(ViewController2)中宣告的一個變數
            }
            else if segue.identifier == "goToFace3"{
                let controller = segue.destination as! ViewController
                faceid = 3
                 //指向下個頁面的swift檔，之後就可使用裡面宣告的參數
                 //("ViewController2"為本範例中下一個頁面參考的swift檔)
                controller.faceNumber = faceid
                //指定下一個頁面中由哪個變數來接值
               //base64Name是在下個頁面swift檔(ViewController2)中宣告的一個變數
            }
            else if segue.identifier == "goToFace4"{
                let controller = segue.destination as! ViewController
                faceid = 4
                 //指向下個頁面的swift檔，之後就可使用裡面宣告的參數
                 //("ViewController2"為本範例中下一個頁面參考的swift檔)
                controller.faceNumber = faceid
                //指定下一個頁面中由哪個變數來接值
               //base64Name是在下個頁面swift檔(ViewController2)中宣告的一個變數
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
