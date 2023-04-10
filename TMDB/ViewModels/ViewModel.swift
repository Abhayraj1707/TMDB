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
    
    @objc func loadTrendingTvData(completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        nm.getTrendingDataFromURL(urlStr:"https://api.themoviedb.org/3/trending/tv/day?api_key=626c45c82d5332598efa800848ea3571" , reqType: "GET", headers: header) {trendingTvData, error in
            if(error != nil){
                print("trending Tv error is ",error);
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
    
    @objc func loadPopularTvData(completionHandler: @escaping () -> ()) {
      let nm = NetworkManager()
      let header = NSDictionary(object: "", forKey: "" as NSCopying);
      nm.getPopularTvDataFromURL(urlStr:"https://api.themoviedb.org/3/tv/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" , reqType: "GET", headers: header){popularTvData, error in
          if(error != nil){
              print("popular Tv error is ", error);
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
    
    
    @objc func loadUpcomingData(completionHandler: @escaping () -> ()) {
      let nm = NetworkManager()
      let header = NSDictionary(object: "", forKey: "" as NSCopying);
      nm.getDataFromURL(urlStr:"https://api.themoviedb.org/3/movie/upcoming?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1", reqType: "GET", headers: header){upcomingData, error in
          if(error != nil){
              print("Upcoming error is ", error);
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
      nm.getDataFromURL(urlStr:"https://api.themoviedb.org/3/movie/popular?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1" , reqType: "GET", headers: header){RecommendationData, error in
          if(error != nil){
              print("Recommendation error is ", error);
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
    
  

}
