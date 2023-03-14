//
//  PopularTv.swift
//  TMDB
//
//  Created by Abhay Raj on 14/03/23.
//

import Foundation

@objc(PopularTV)


class PopularTv : NSObject, Decodable{
    @objc var id : Int
    @objc var name : String?
    @objc var overview : String?
    @objc var popularity : Float
    @objc var backdrop_path : String?
    @objc var poster_path : String?
    @objc var origin_country : [String]?
    @objc var first_air_date : String?
    @objc var vote_count : Int
    @objc var vote_average : Float
    @objc var original_language : String?
    @objc var original_name : String?
    @objc var genre_ids : [Int]?
    
    init(id: Int, name: String? = nil, overview: String? = nil, popularity: Float, backdrop_path: String? = nil, poster_path: String? = nil, origin_country: [String]? = nil, first_air_date: String? = nil, vote_count: Int, vote_average: Float, original_language: String? = nil, original_name: String? = nil, genre_ids: [Int]? = nil) {
        self.id = id
        self.name = name
        self.overview = overview
        self.popularity = popularity
        self.backdrop_path = backdrop_path
        self.poster_path = poster_path
        self.origin_country = origin_country
        self.first_air_date = first_air_date
        self.vote_count = vote_count
        self.vote_average = vote_average
        self.original_language = original_language
        self.original_name = original_name
        self.genre_ids = genre_ids
    }

}

