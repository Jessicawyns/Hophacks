//
//  Song Button ViewController.swift
//  MusicPlayer
//
//  Created by Jessica Nguyen on 9/14/19.
//  Copyright © 2019 Jessica Nguyen. All rights reserved.
//

import UIKit
import MediaPlayer

class Song_Button_ViewController: UIViewController {
    var musicplayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//comment to self
    

     @IBAction func ButtonTap(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{
            (status) in
            if status == .authorized{
                
                self.playGenre(genre: sender.currentTitle!)
            }
            
        }
        self.playGenre(genre: sender.currentTitle!)
     }
    
    @IBAction func NextButton(_ sender: UIButton) {
        musicplayer.skipToNextItem()
    }
    
    @IBAction func StopButton(_ sender: UIButton) {
        musicplayer.stop()
    }
    
    func playGenre(genre: String){
        musicplayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicplayer.setQueue(with: query)
        musicplayer.shuffleMode = .songs
        musicplayer.play()
        
        
        
        
        
    }
    
}
