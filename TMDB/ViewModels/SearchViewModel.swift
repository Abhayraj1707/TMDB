//
//  SearchViewModel.swift
//  TMDB
//
//  Created by Abhay Raj on 10/04/23.
//

import Foundation

@objc
class SearchViewModel: NSObject{
    @objc var filterdData: [Movie] = []
    
    
    
    
 @objc   func loadSearchData(str: NSString, completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
     var url = "https://api.themoviedb.org/3/search/movie?api_key=626c45c82d5332598efa800848ea3571&language=en-US&page=1&include_adult=false&query=%" + (str as String)
     nm.getDataFromURL(urlStr: url as NSString, reqType:"GET" , headers: header){searchData,error in
            if(error != nil){
                print("search error is ", error )
            }
            self.filterdData = searchData!.results
            DispatchQueue.main.async {
                completionHandler()
            }

        }
    }
    
}
