//
//  ViewModel.swift
//  TMDB
//
//  Created by Abhay Raj on 06/04/23.
//

import Foundation

@objc
class ViewModel: NSObject {
    @objc var genre: Int
    @objc var trendingMovies: [TrendingMovies] = []
    @objc var popularMovies: [Movie] = []
    @objc var topRatedmovies:[Movie] = []
    
    @objc init(genre: Int = 0) {
        self.genre = genre
    }
    
   @objc func loadTrendingData(completionHandler: @escaping () -> ()) {
       let nm = NetworkManager()
       let header = NSDictionary(object: "", forKey: "" as NSCopying);
       nm.getTrendingDataFromURL(urlStr:"https://api.themoviedb.org/3/trending/movie/day?api_key=626c45c82d5332598efa800848ea3571" , reqType: "GET", headers: header) {trendingData, error in
           if(error != nil){
               print("trending error is ",error);
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
    
      @objc func loadPopularData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        nm.getDataFromURL(urlStr:"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" , reqType: "GET", headers: header){popularData, error in
            if(error != nil){
                print("popular error is ", error);
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
    
    @objc func loadTopRatedData(completionHandler: @escaping () -> ()) {
      let nm = NetworkManager()
      let header = NSDictionary(object: "", forKey: "" as NSCopying);
      nm.getDataFromURL(urlStr:"https://api.themoviedb.org/3/movie/top_rated?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" , reqType: "GET", headers: header){topRatedData, error in
          if(error != nil){
              print("TopRated error is ", error);
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
    
  

}
