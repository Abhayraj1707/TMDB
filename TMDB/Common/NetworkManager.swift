//
//  NetworkManager.swift
//  TMDB
//
//  Created by Abhay Raj on 03/03/23.
//

import Foundation

@objc(NetworkManager)
class NetworkManager: NSObject {
    override init() {
        super.init()
        
    }
    
    @objc func getDataFromURL(urlStr: NSString, reqType: NSString, headers: NSDictionary, completionHandler: @escaping (ResponseData?, NSError?) -> ()) {
        var request = URLRequest(url: URL(string: urlStr as String)!)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                return;
            }
            do {
                let responseData = try? JSONDecoder().decode(ResponseData.self, from: data)
                completionHandler(responseData, nil)
                
            } catch {
                print("error")
            }
        }
        dataTask.resume()
    }
}
