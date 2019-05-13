//
//  ViewController.swift
//  CrudApp
//
//  Created by Prince Darlington on 12/05/2019.
//  Copyright © 2019 Prince Darlington. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    var ref : DatabaseReference!

    @IBAction func submitArtist(_ sender: Any) {
        AddArtist()
    }
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var artistGenre: UITextField!
    @IBOutlet weak var artistName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference().child("artists")
    }
    

    func AddArtist(){
        let artistKey = ref.childByAutoId().key
        let artist = [
            "id":artistKey,
            "artistName":artistName.text! as String,
            "artistGenre":artistGenre.text! as String
        ]
        ref.child(artistKey!).setValue(artist)
        message.text = "Artist Added!"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}

