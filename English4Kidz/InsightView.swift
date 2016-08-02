//
//  InsightView.swift
//  Espanol4Kids
//
//  Created by HoangHai on 8/1/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class InsightView: UIViewController {

    @IBOutlet weak var detailImg: UIImageView!
    
    @IBOutlet weak var detailName: UILabel!
    
    var detailImage : UIImage!
    var text : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImg.image = detailImage
        detailName.text = text
    }
    
    @IBAction func pronounce(sender: UIButton) {
        let synth = AVSpeechSynthesizer()
        var utter = AVSpeechUtterance(string: "")
        utter = AVSpeechUtterance(string: text)
        utter.rate = Float(arc4random_uniform(60))/100
        print(utter.rate)
        utter.voice = AVSpeechSynthesisVoice(language: "es-ES")
        synth.speakUtterance(utter)
    }
    
  
}
