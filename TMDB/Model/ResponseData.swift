//
//  Result.swift
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

import Foundation

@objc(ResponseData)
class ResponseData: NSObject, Decodable {
    @objc var page: Int;
    @objc var results: [Movie];
    @objc var total_pages: Int;
    @objc var total_results: Int;
    
    init(page: Int, results: [Movie], total_pages: Int, total_results: Int) {
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}
