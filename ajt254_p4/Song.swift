//
//  Song.swift
//  ajt254_p4
//
//  Created by Alexei Tulloch on 4/13/20.
//  Copyright © 2020 Alexei Tulloch. All rights reserved.
//
import UIKit
import Foundation

class Song  {
    var songName: String
    var artistName: String
    var albumName: String
    var songImage: UIImage
    var isFavorite: Bool
    
    init(songName: String, artistName: String, albumName: String, songImage: UIImage) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.songImage = songImage
        self.isFavorite = false
    }
    
    

}
