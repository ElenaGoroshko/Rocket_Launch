//
//  ViewController.swift
//  RocketLaunch
//
//  Created by Elena Goroshko on 10/11/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var rocketWifhStreamView: UIImageView!
    @IBOutlet weak var LaunchView: UIView!
    @IBOutlet weak var LaunchModeLabel: UILabel!
    @IBOutlet weak var ONLabel: UILabel!

    var player : AVAudioPlayer?

    @IBAction func LaunchPressed(_ sender: Any) {
        LaunchView.isHidden = false
        player?.play()
        UIView.animate(withDuration: 3.0, animations: {
            var rocketFrame = self.rocketWifhStreamView.frame
            rocketFrame.origin.y = 70
            self.rocketWifhStreamView.frame = rocketFrame
        }) { _ in
            self.LaunchModeLabel.isHidden = false
            self.ONLabel.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "rocket_launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

