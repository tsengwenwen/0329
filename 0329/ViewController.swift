//
//  ViewController.swift
//  0329
//
//  Created by TsengWen on 2024/3/29.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var looper: AVPlayerLooper?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //音樂
        let player = AVQueuePlayer()
        let fileUrl = Bundle.main.url(forResource: "香蕉之歌", withExtension: "mp3")!
        let item = AVPlayerItem(url: fileUrl)
        self.looper = AVPlayerLooper(player: player, templateItem: item)
        player.play()
            
            //背景漸層
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
            gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.colors = [
                UIColor(red: 255/255, green: 174/255, blue: 150/255, alpha: 1).cgColor,
                UIColor(red: 230/255, green: 140/255, blue: 120/255, alpha: 0.7).cgColor,
                UIColor(red: 255/255, green: 228/255, blue: 200/255, alpha: 1).cgColor,]
            view.layer.addSublayer(gradientLayer)
            
    //香蕉動畫
    let bananaEmitterCell = CAEmitterCell()
        bananaEmitterCell.contents = UIImage(named: "banana")?.cgImage
        bananaEmitterCell.birthRate = 1
        bananaEmitterCell.lifetime = 0.4
        bananaEmitterCell.velocity = 80
        bananaEmitterCell.yAcceleration = 20
        bananaEmitterCell.lifetime = 20
        bananaEmitterCell.scale = 0.4
        bananaEmitterCell.scaleRange = 0.2
        bananaEmitterCell.spin = 0.3
        bananaEmitterCell.spinRange = 1
    let bananaEmitterLayer = CAEmitterLayer()
        bananaEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -30)
        bananaEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        bananaEmitterLayer.emitterShape = .line
        bananaEmitterLayer.emitterCells = [bananaEmitterCell]
            view.layer.addSublayer(bananaEmitterLayer)
            
            
            //GIF動圖
            let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 300, height: 230))
            view.addSubview(imageView)
            let animatedImage = UIImage.animatedImageNamed("giphy-1561383342-", duration: 1)
            imageView.image = animatedImage
            
            let imageViewA = UIImageView(frame: CGRect(x: 250, y: 600, width: 100, height: 200))
            view.addSubview(imageViewA)
            let animatedImageA = UIImage.animatedImageNamed("4639-", duration: 1)
            imageViewA.image = animatedImageA
            
            
        }
    }

    
    #Preview {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ViewController")
    }
