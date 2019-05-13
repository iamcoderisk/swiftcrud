//
//  SecondViewController.swift
//  CrudApp
//
//  Created by Prince Darlington on 12/05/2019.
//  Copyright © 2019 Prince Darlington. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref : DatabaseReference!
    var artistModel = [ArtistModel]()
    
    @IBOutlet weak var tableView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistModel.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for:indexPath) as! ViewControllerTableViewCell
        let artist:ArtistModel
        artist = artistModel[indexPath.row]
        cell.artistLabel.text = artist.name
        cell.artistGenre.text = artist.genre
        return cell
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          ref = Database.database().reference().child("artists")
        ref.observe(DataEventType.value, with: {(DataSnapshot) in
        
            if DataSnapshot.childrenCount > 0 {
                self.artistModel.removeAll()
                
                for artists in DataSnapshot.children.allObjects as![DataSnapshot]{
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistName = artistObject?["artistName"]
                    let artistGenre = artistObject?["artistGenre"]
                    let artistId = artistObject?["id"]
                    let artist = ArtistModel(artistId as? String, artistName as? String, artistGenre as? String)
                    self.artistModel.append(artist)
                }
                self.tableView.reloadData()
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
