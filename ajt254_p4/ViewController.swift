//
//  ViewController.swift
//  ajt254_p4
//
//  Created by Alexei Tulloch on 4/13/20.
//  Copyright © 2020 Alexei Tulloch. All rights reserved.
//

import UIKit

protocol PresentDetailViewProtocol: class {
    func presentDetailView(row: Int, songName: String, artistName: String, albumName: String, songImage: UIImage)
}

protocol SaveSongDetailsProtocol: class {
    func saveSongDetails(row: Int, songName: String, artistName: String, albumName: String, songImage: UIImage)
}

class ViewController: UIViewController {

    var tableView: UITableView!

    let reuseIdentifier = "SongCellReuse"
    let cellHeight: CGFloat = 50
    var songs: [Song]!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Songs"
        view.backgroundColor = .white

        let getYou = Song(songName: "Get You", artistName: "Daniel Caesar", albumName: "Freudian", songImage: UIImage(named: "caesar")!)
        let bestPart = Song(songName: "Best Part", artistName: "Daniel Caesar", albumName: "Freudian", songImage: UIImage(named: "caesar")!)
        let weFindLove = Song(songName: "We Find Love", artistName: "Daniel Caesar", albumName: "Freudian", songImage: UIImage(named: "caesar")!)
        let blessed = Song(songName: "Blessed", artistName: "Daniel Caesar", albumName: "Freudian", songImage: UIImage(named: "caesar")!)
        let mbanguTe = Song(songName: "Mbangu te", artistName: "Ya Levis", albumName: "El mayalove", songImage: UIImage(named: "levis")!)
        let noRoleModelz = Song(songName: "No Role Modelz", artistName: "J. Cole", albumName: "2014 Forest Hills Drive", songImage: UIImage(named: "jcole")!)
        let loveYourz = Song(songName: "Love Yourz", artistName: "J. Cole", albumName: "2014 Forest Hills Drive", songImage: UIImage(named: "jcole")!)
        let apparently = Song(songName: "Apparently", artistName: "J. Cole", albumName: "2014 Forest Hills Drive", songImage: UIImage(named: "jcole")!)
        let dior = Song(songName: "Dior", artistName: "Pop Smoke", albumName: "Meet The Woo 2", songImage: UIImage(named: "music")!)
        let shakeTheRoom = Song(songName: "Shake The Room", artistName: "Pop Smoke", albumName: "Meet The Woo 2", songImage: UIImage(named: "music")!)
        
        songs = [getYou, bestPart, weFindLove, blessed, mbanguTe, noRoleModelz, loveYourz, apparently, dior, shakeTheRoom]
        // Initialize tableView!
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //tabelView Setup
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource=self
        tableView.delegate = self
        
        view.addSubview(tableView)
        setupConstraints()
    }

    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(for: song)
        
        return cell
    }
    
    //delete songs from list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        presentDetailView(row: indexPath.row,songName: song.songName, artistName: song.artistName, albumName: song.albumName, songImage: song.songImage)
    }
    
}

extension ViewController: PresentDetailViewProtocol{
    func presentDetailView(row: Int, songName: String, artistName: String, albumName: String, songImage: UIImage){
        let vc = DetailViewViewController(row: row, detailsDelegate: self, presentViewDelegate: self, songName: songName, artistName: artistName, albumName: albumName, songImage: songImage)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: SaveSongDetailsProtocol{
    func saveSongDetails(row: Int, songName: String, artistName: String, albumName: String, songImage: UIImage) {
        songs[row] = Song(songName: songName, artistName: artistName, albumName: albumName, songImage: songImage)
        tableView.reloadData()
    }
}
