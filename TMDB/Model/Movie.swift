//
//  Movie.swift
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

import Foundation

@objc(Movie)
class Movie: NSObject, Decodable {
    @objc var id : Int;
    @objc var adult : Bool;
    @objc var title : String?;
    @objc var video : Bool;
    @objc var overview : String?;
    @objc var popularity : Float;
    @objc var backdrop_path : String?;
    @objc var poster_path : String?;
    @objc var original_title : String?;
    @objc var release_date : String?;
    @objc var vote_count : Int;
    @objc var vote_average : Float;
    @objc var original_language : String?;
    @objc var genre_ids : [Int]?;
    
    
    init(id: Int, adult: Bool, title: String? = nil, video: Bool, overview: String? = nil, popularity: Float, backdrop_path: String? = nil, poster_path: String? = nil, original_title: String? = nil, release_date: String? = nil, vote_count: Int, vote_average: Float, original_language: String? = nil, genre_ids: [Int]? = nil) {
        self.id = id
        self.adult = adult
        self.title = title
        self.video = video
        self.overview = overview
        self.popularity = popularity
        self.backdrop_path = backdrop_path
        self.poster_path = poster_path
        self.original_title = original_title
        self.release_date = release_date
        self.vote_count = vote_count
        self.vote_average = vote_average
        self.original_language = original_language
        self.genre_ids = genre_ids
    }
    
    func filteredMovie(genreID: Int) -> Bool {
        let genreIDS = self.genre_ids ?? []
        return genreIDS.contains(genreID)
    }

}
