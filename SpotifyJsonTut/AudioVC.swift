//
//  AudioVC.swift
//  SpotifyJsonTut
//
//  Created by Shane Noonan on 29/11/2016.
//  Copyright © 2016 Shane Noonan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AudioVC : UIViewController {
    
    var image = UIImage()
    var mainSongTitle: String = ""
    var mainPreviewURL: String = ""
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var albumArt: UIImageView!
    @IBOutlet var songTitle: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    
    
    override func viewDidLoad() {
        songTitle.text = mainSongTitle
        backgroundImage.image = image
        albumArt.image = image
        
        downloadFileFromURL(url: URL(string: mainPreviewURL)!)
        
        playPauseButton.setTitle("Pause", for: .normal)
    }
    
    func downloadFileFromURL(url: URL) {
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customURL, response, error in
            
            self.play(url: customURL!)
            
        })
        
        downloadTask.resume()
        
    }
    
    func play(url: URL) {
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }
            
        catch {
            print(error)
        }
    }
    
    @IBAction func playPause(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }
        else {
            player.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
    }
}
