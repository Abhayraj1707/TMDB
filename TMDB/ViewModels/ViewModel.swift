//
//  ViewModel.swift
//  TMDB
//
//  Created by Abhay Raj on 06/04/23.
//

import Foundation
import SystemConfiguration

@objc
class ViewModel: NSObject {
    @objc var genre: Int
    @objc var trendingMovies: [TrendingMovies] = []
    @objc var popularMovies: [Movie] = []
    @objc var topRatedmovies:[Movie] = []
    @objc var upcomingMovies:[Movie] = []
    @objc var trendingTv: [TrendingMovies] = []
    @objc var popularTv: [PopularTv] = []
    @objc var recommendationMovies: [Movie] = []
    
    @objc init(genre: Int = 0) {
        self.genre = genre
    }
    
 
    
    @objc func loadTrendingData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        nm.getTrendingDataFromURL(urlStr:trendingApi as NSString , reqType: getReq as NSString, headers: header) {trendingData, error in
            if(error != nil){
                print(trendingText, errorText,error);
            }
            self.trendingMovies = trendingData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getTrendingData() -> [TrendingMovies] {
        guard genre > 0 else { return trendingMovies }
        
        var filtered: [TrendingMovies] = []
        for movie in trendingMovies {
            if movie.filteredMovie(genreID: genre) { filtered.append(movie) }
        }
        return filtered
    }
    
    @objc func loadTrendingTvData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        
        nm.getTrendingDataFromURL(urlStr:trendingTvApi as NSString , reqType: getReq as NSString, headers: header) {trendingTvData, error in
            if(error != nil){
                print(trendingText,errorText,error);
            }
            self.trendingTv = trendingTvData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getTrendingTvData() -> [TrendingMovies] {
        guard genre > 0 else { return trendingTv}
        
        var filtered: [TrendingMovies] = []
        for movie in trendingTv {
            if movie.filteredMovie(genreID: genre) { filtered.append(movie) }
        }
        return filtered
    }
    
    @objc func loadPopularData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        
        nm.getDataFromURL(urlStr:popularApi as NSString , reqType: getReq as NSString, headers: header){popularData, error in
            if(error != nil){
                print(popularText,errorText, error);
            }
            self.popularMovies = popularData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getPopularData() -> [Movie] {
        guard genre > 0 else {
            return popularMovies
        }
        var filtered: [Movie] = []
        for movie in popularMovies { 
            if movie.filteredMovie(genreID: genre){filtered.append(movie)}
        }
        return filtered;
    }
    
    @objc func loadPopularTvData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        nm.getPopularTvDataFromURL(urlStr:popularTvApi as NSString , reqType: getReq as NSString, headers: header){popularTvData, error in
            if(error != nil){
                print(popularText,errorText,error);
            }
            self.popularTv = popularTvData!.results
            print(self.popularTv.count);
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getPopularTvData() -> [PopularTv] {
        guard genre > 0 else {
            return popularTv
        }
        var filtered: [PopularTv] = []
        for movie in popularTv {
            if movie.filteredTV(genreID: genre){filtered.append(movie)}
        }
        return filtered;
    }
    
    @objc func loadTopRatedData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        nm.getDataFromURL(urlStr:topRatedApi as NSString , reqType: getReq as NSString, headers: header){topRatedData, error in
            if(error != nil){
                print(topRatedText,errorText, error);
            }
            self.topRatedmovies = topRatedData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getTopRatedData() -> [Movie] {
        guard genre > 0 else {
            return topRatedmovies
        }
        var filtered: [Movie] = []
        for movie in topRatedmovies {
            if movie.filteredMovie(genreID: genre){filtered.append(movie)}
        }
        return filtered;
    }
    
    
    @objc func loadUpcomingData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        
        nm.getDataFromURL(urlStr:upcomingApi as NSString, reqType: getReq as NSString, headers: header){upcomingData, error in
            if(error != nil){
                print(upcomingText,errorText, error);
            }
            self.upcomingMovies = upcomingData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getUpcomingdData() -> [Movie] {
        guard genre > 0 else {
            return upcomingMovies
        }
        var filtered: [Movie] = []
        for movie in upcomingMovies {
            if movie.filteredMovie(genreID: genre){filtered.append(movie)}
        }
        return filtered;
    }
    
    @objc func loadRecommendationData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        
        let reachability = SCNetworkReachabilityCreateWithName(nil, "google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if !isNetworkReachable(with: flags) {
            print("Internet connection not available")
            return
        }
        nm.getDataFromURL(urlStr:recommendationApi as NSString, reqType: getReq as NSString, headers: header){RecommendationData, error in
            if(error != nil){
                print(recommendationsText,errorText, error);
            }
            self.recommendationMovies = RecommendationData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    @objc func getRecommendationData() -> [Movie] {
        guard genre > 0 else {
            return recommendationMovies
        }
        var filtered: [Movie] = []
        for movie in recommendationMovies {
            if movie.filteredMovie(genreID: genre){filtered.append(movie)}
        }
        return filtered;
    }
    
    func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
    
    
    
}
