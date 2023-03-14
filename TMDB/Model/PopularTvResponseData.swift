//
//  PopularTvResponseData.swift
//  TMDB
//
//  Created by Abhay Raj on 14/03/23.
//

import Foundation

@objc(PopularTvResponseData)
class PopularTvResponseData: NSObject, Decodable {
    @objc var page: Int;
    @objc var results: [PopularTv];
    @objc var total_pages: Int;
    @objc var total_results: Int;
    
    init(page: Int, results: [PopularTv], total_pages: Int, total_results: Int) {
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}
