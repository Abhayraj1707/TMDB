//
//  TrendingMovies.swift
//  TMDB
//
//  Created by Abhay Raj on 08/03/23.
//

import Foundation


@objc(TrendingMovies)
class TrendingMovies: NSObject, Decodable {
    @objc var id : Int;
    @objc var adult : Bool;
    @objc var title : String;
    @objc var video : Bool;
    @objc var overview : String;
    @objc var popularity : Float;
    @objc var backdrop_path : String;
    @objc var poster_path : String;
    @objc var original_title : String;
    @objc var release_date : String;
    @objc var vote_count : Int;
    @objc var vote_average : Float;
    @objc var original_language : String;
    @objc var genre_ids : [Int];
    @objc var media_type : String
    
    init(id: Int, adult: Bool, title: String, video: Bool, overview: String, popularity: Float, backdrop_path: String, poster_path: String, original_title: String, release_date: String, vote_count: Int, vote_average: Float, original_language: String, genre_ids: [Int], media_type : String) {
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
        self.media_type = media_type;
     
    }

}
