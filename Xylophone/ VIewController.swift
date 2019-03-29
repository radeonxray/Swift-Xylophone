//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController{
    
    var player = AVAudioPlayer()
    var soundArr = ["note1","note2", "note3", "note4","note5","note6", "note7"]
    var selectedSoundFileName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {

         selectedSoundFileName = soundArr[sender.tag-1]
        
        playSound(tagString: selectedSoundFileName)
    }
    
    //Function for playing a sound
    func playSound(tagString: String){
        let xylophoneSound = Bundle.main.url(forResource: tagString, withExtension: "wav")
        
        do{
            player = try AVAudioPlayer(contentsOf: xylophoneSound!)
            
        } catch {
            print(error)
            
        }
        
        player.play()
    }
    
    
    //Alternaive to playing sound
    func playSoundAudioToolbox(){
        if let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav"){
            var mySound : SystemSoundID = 0;
            
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
        

    }
    
  

}

