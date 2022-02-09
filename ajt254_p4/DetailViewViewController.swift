//
//  DetailViewViewController.swift
//  ajt254_p4
//
//  Created by Alexei Tulloch on 4/13/20.
//  Copyright © 2020 Alexei Tulloch. All rights reserved.
//

import UIKit

class DetailViewViewController: UIViewController {
    
    weak var detailsDelegate: SaveSongDetailsProtocol?
    weak var presentViewDelegate: PresentDetailViewProtocol? 
    var songNameTextField: UITextField!
    var artistNameTextField: UITextField!
    var albumNameTextField: UITextField!
    var songImageView: UIImageView!
    var songName: String!
    var artistName: String!
    var albumName: String!
    var songImage: UIImage!
    var saveButton: UIBarButtonItem!
    var row: Int!
    
    init(row: Int, detailsDelegate: SaveSongDetailsProtocol?, presentViewDelegate: PresentDetailViewProtocol?, songName: String, artistName: String, albumName: String, songImage: UIImage){
        super.init(nibName: nil, bundle: nil)
        
        self.row = row
        self.detailsDelegate = detailsDelegate
        self.presentViewDelegate = presentViewDelegate
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.songImage = songImage
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSongDetails))
        navigationItem.rightBarButtonItem = saveButton
        
        songNameTextField=UITextField()
        songNameTextField.text = songName
        songNameTextField.font=UIFont.boldSystemFont(ofSize: 16)
        songNameTextField.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(songNameTextField)
        
        artistNameTextField=UITextField()
        artistNameTextField.text = artistName
        artistNameTextField.font = UIFont.systemFont(ofSize: 12)
        artistNameTextField.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(artistNameTextField)
        
        albumNameTextField=UITextField()
        albumNameTextField.text = albumName
        albumNameTextField.font = UIFont.systemFont(ofSize: 12)
        albumNameTextField.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(albumNameTextField)
        
        songImageView = UIImageView()
        songImageView.image = songImage
        songImageView.contentMode = .scaleToFill
        songImageView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(songImageView)
        
        setupContstraints()
    }
    
    @objc func saveSongDetails(){
        if songNameTextField.text != "" && artistNameTextField.text != "" && albumNameTextField.text != ""{
            detailsDelegate?.saveSongDetails(row: row, songName: songNameTextField.text ?? "Error", artistName: artistNameTextField.text ?? "Error", albumName: albumNameTextField.text ?? "Error", songImage: (songImageView.image ?? UIImage(named: "music"))!)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            let alertController = UIAlertController(title: "Alert", message: "All fields must be at least 1 character", preferredStyle: .alert)
                    
            let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            }

            alertController.addAction(action2)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func setupContstraints(){
        
        let padding : CGFloat = 8
        let labelHeight: CGFloat = 16
        let songImageLength: CGFloat = 300
        
        NSLayoutConstraint.activate([
            songNameTextField.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: padding),
            songNameTextField.heightAnchor.constraint(equalToConstant: labelHeight),
            songNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            artistNameTextField.topAnchor.constraint(equalTo: songNameTextField.bottomAnchor, constant: 5),
            artistNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistNameTextField.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            albumNameTextField.topAnchor.constraint(equalTo: artistNameTextField.bottomAnchor, constant: 1),
            albumNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumNameTextField.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            songImageView.heightAnchor.constraint(equalToConstant: songImageLength),
            songImageView.widthAnchor.constraint(equalToConstant: songImageLength),
            songImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            songImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
