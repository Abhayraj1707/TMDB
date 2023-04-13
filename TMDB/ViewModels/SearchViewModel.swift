//
//  SearchViewModel.swift
//  TMDB
//
//  Created by Abhay Raj on 10/04/23.
//

import Foundation

@objc
class SearchViewModel: NSObject{
    @objc var filteredData: [Movie] = []
    
    @objc func loadSearchData(str: NSString, completionHandler: @escaping () -> ()) {
        let nm = NetworkManager()
        let header = NSDictionary(object: "", forKey: "" as NSCopying);
        let url = searchApi + (str as String)
        nm.getDataFromURL(urlStr: url as NSString, reqType:getReq as NSString , headers: header){searchData,error in
            if(error != nil){
                print(error )
            }
            self.filteredData = searchData!.results
            DispatchQueue.main.async {
                completionHandler()
            }
            
        }
    }
    
}
