//
//  UpcomingResponseData.swift
//  TMDB
//
//  Created by Abhay Raj on 29/03/23.
//

import Foundation
@objc(UpcomingResponseData)
class UpcomingResponseData: NSObject, Decodable {
    @objc var dates: [String];
    @objc var page: Int;
    @objc var results: [Movie];
    @objc var total_pages: Int;
    @objc var total_results: Int;
    
    init(dates: [String], page: Int, results: [Movie], total_pages: Int, total_results: Int) {
        self.dates = dates
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }
}
