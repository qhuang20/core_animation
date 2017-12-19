//
//  ViewController.swift
//  core_animation
//
//  Created by Qichen Huang on 2017-12-18.
//  Copyright © 2017 Qichen Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startingFrame = CGRect(x: 0, y: 0, width: 200, height: 100)

    lazy var zoomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.startingFrame
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(zoomImageView)
    }
    
    @objc func animate() {
        UIView.animate(withDuration: 0.75) {
            let height = (self.view.frame.width / self.startingFrame.width) * self.startingFrame.height

            let y = self.view.frame.height / 2 - height / 2
            
            self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
        }
    }

}

