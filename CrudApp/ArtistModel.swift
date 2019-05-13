//
//  ArtistModel.swift
//  CrudApp
//
//  Created by Prince Darlington on 12/05/2019.
//  Copyright © 2019 Prince Darlington. All rights reserved.
//

class ArtistModel {
    var id:String?
    var name:String?
    var genre:String?
    init(_ id:String?,_ name:String?, _ genre:String?){
        self.id = id
        self.name = name
        self.genre = genre
    }
}
