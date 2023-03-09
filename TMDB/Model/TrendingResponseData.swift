//
//  TrendingResponseData.swift
//  TMDB
//
//  Created by Abhay Raj on 08/03/23.
//

import Foundation

@objc(TrendingResponseData)
class TrendingResponseData: NSObject, Decodable {
    @objc var page: Int;
    @objc var results: [TrendingMovies];
    @objc var total_pages: Int;
    @objc var total_results: Int;
    
    init(page: Int, results: [TrendingMovies], total_pages: Int, total_results: Int) {
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}
