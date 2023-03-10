//
//  GenreData.swift
//  TMDB
//
//  Created by Abhay Raj on 10/03/23.
//

import Foundation

@objc(GenreData)

class GenreData: NSObject, Decodable {
    @objc var genres: [MovieGenre];
    
    init(genres: [MovieGenre]) {
        self.genres = genres
    }
}
  
    
