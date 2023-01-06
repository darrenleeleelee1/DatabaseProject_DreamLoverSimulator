//
//  LunchScreenViewController.swift
//  DrawingApp
//
//  Created by 鄭又寧 on 2020/12/10.
//  Copyright © 2020 Ranosys. All rights reserved.
//
import AVKit
import AVFoundation
import UIKit

class LunchScreenViewController: UIViewController {
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定只弄淺色模式
        overrideUserInterfaceStyle = .light
//        let barAppearance = UINavigationBarAppearance()
//        barAppearance.configureWithDefaultBackground()
//        navigationItem.standardAppearance = barAppearance
        
//      讓nevigation bar消失
        let barAppearance =  UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = barAppearance
//        loadVideo()
    }
    
//    private func loadVideo() {
//        //this line is important to prevent background music stop
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
//        } catch { }
//
//        let path = Bundle.main.path(forResource: "draw", ofType:"mp4")
//
//        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
//        let playerLayer = AVPlayerLayer(player: player)
//
//        playerLayer.frame = self.view.frame
//        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        playerLayer.zPosition = -1
//
//        self.view.layer.addSublayer(playerLayer)
//
//        player?.seek(to: CMTime.zero)
//        player?.play()
//    }
    
//    動畫，如何連貫
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "draw", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        player.play()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {//5
            self.performSegue(withIdentifier: "goToStart", sender: nil)
        }
    }
}
