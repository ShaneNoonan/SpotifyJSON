//
//  AudioVC.swift
//  SpotifyJsonTut
//
//  Created by Shane Noonan on 29/11/2016.
//  Copyright © 2016 Shane Noonan. All rights reserved.
//

import Foundation
import UIKit

class AudioVC : UIViewController {
    
    var image = UIImage()
    var mainSongTitle: String = ""
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var albumArt: UIImageView!
    @IBOutlet var songTitle: UILabel!
    
    
    override func viewDidLoad() {
        songTitle.text = mainSongTitle
        backgroundImage.image = image
        albumArt.image = image
    }
}
