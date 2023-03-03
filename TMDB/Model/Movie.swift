//
//  Movie.swift
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

import Foundation

@objc(Movie)
class Movie: NSObject {
    var page: Int;
    var results: [Result];
    var total_pages: Int;
    var total_results: Int;
    
    init(page: Int, results: [Result], total_pages: Int, total_results: Int) {
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}

@objc(Result)
class Result: NSObject {
    var id : Int;
    var adult : Bool;
    var title : String;
    var video : Bool;
    var overview : String;
    var popularity : Float;
    var backdrop_path : String;
    var poster_path : String;
    var original_title : String;
    var release_date : String;
    var vote_count : Int;
    var vote_average : Float;
    var original_language : String;
    var genre_ids : [Int];
    
    init(id: Int, adult: Bool, title: String, video: Bool, overview: String, popularity: Float, backdrop_path: String, poster_path: String, original_title: String, release_date: String, vote_count: Int, vote_average: Float, original_language: String, genre_ids: [Int]) {
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

}
