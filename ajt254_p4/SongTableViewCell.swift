//
//  SongTableViewCell.swift
//  ajt254_p4
//
//  Created by Alexei Tulloch on 4/13/20.
//  Copyright © 2020 Alexei Tulloch. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumNameLabel: UILabel!
    var songImageView: UIImageView!
    var heartImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songNameLabel=UILabel()
        songNameLabel.font=UIFont.boldSystemFont(ofSize: 16)
        songNameLabel.translatesAutoresizingMaskIntoConstraints=false
        contentView.addSubview(songNameLabel)
        
        artistNameLabel=UILabel()
        artistNameLabel.font = UIFont.systemFont(ofSize: 12)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints=false
        contentView.addSubview(artistNameLabel)
        
        albumNameLabel=UILabel()
        albumNameLabel.font = UIFont.systemFont(ofSize: 12)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints=false
        contentView.addSubview(albumNameLabel)
        
        songImageView = UIImageView()
        songImageView.contentMode = .scaleToFill
        songImageView.translatesAutoresizingMaskIntoConstraints=false
        contentView.addSubview(songImageView)
        
        heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "heart")
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.translatesAutoresizingMaskIntoConstraints=false
        contentView.addSubview(heartImageView)
        
        setupContstraints()
    }
    
    func setupContstraints(){
        
        let padding : CGFloat = 8
        let labelHeight: CGFloat = 16
        let songImageLength: CGFloat = 25
        let heartImageLegnth: CGFloat = 25
        
        NSLayoutConstraint.activate([
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            songNameLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: padding),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 5),
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: 1),
            albumNameLabel.leadingAnchor.constraint(equalTo: artistNameLabel.trailingAnchor, constant: 10),
            artistNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            songImageView.heightAnchor.constraint(equalToConstant: songImageLength),
            songImageView.widthAnchor.constraint(equalToConstant: songImageLength),
            songImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: heartImageLegnth),
            heartImageView.widthAnchor.constraint(equalToConstant: heartImageLegnth),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configure(for song: Song){
        songNameLabel.text = song.songName
        artistNameLabel.text = song.artistName
        albumNameLabel.text = song.albumName
        songImageView.image = song.songImage
        heartImageView.isHidden = !song.isFavorite
    }
    
    func toggleImageView() {
        heartImageView.isHidden.toggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
