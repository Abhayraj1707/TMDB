//
//  MovieGenre.swift
//  TMDB
//
//  Created by Abhay Raj on 10/03/23.
//

import Foundation

@objc(MovieGenre)

class MovieGenre : NSObject, Decodable {
    @objc var id : Int;
    @objc var name: String;
    
    init(id : Int,name : String){
        self.id = id;
        self.name = name;
    }
}
