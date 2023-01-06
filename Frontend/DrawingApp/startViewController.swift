//
//  startViewController.swift
//  DrawingApp
//
//  Created by 鄭又寧 on 2020/12/19.
//  Copyright © 2020 Ranosys. All rights reserved.
//

import UIKit

class startViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
        //將nevigation的back弄掉
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func startButton(_ sender: Any) {
        
        
        
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
