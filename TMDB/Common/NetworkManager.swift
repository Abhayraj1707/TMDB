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
        
        guard let url = URL(string: urlStr as String) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "The URL string is not valid"])
            completionHandler(nil, error)
            return
            
        }
        var request = URLRequest(url:url)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                
                return;
            }
            
            let responseData = try? JSONDecoder().decode(ResponseData.self, from: data)
            completionHandler(responseData, nil)
        }
        dataTask.resume()
    }
    
    
    @objc func getTrendingDataFromURL(urlStr: NSString, reqType: NSString, headers: NSDictionary, completionHandler: @escaping (TrendingResponseData?, NSError?) -> ()) {
        var request = URLRequest(url: URL(string: urlStr as String)!)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                return;
            }
            
            do {
                let responseData = try JSONDecoder().decode(TrendingResponseData.self, from: data)
                completionHandler(responseData, nil)
            } catch {
                print(error)
                completionHandler(nil, nil)
            }
        }
        dataTask.resume()
    }
    
    @objc func getGenreDataFromURL(urlStr: NSString, reqType: NSString, headers: NSDictionary, completionHandler: @escaping (GenreData?, NSError?) -> ()) {
        
        var request = URLRequest(url: URL(string: urlStr as String)!)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                return;
            }
            
            do {
                let responseData = try JSONDecoder().decode(GenreData.self, from: data)
                completionHandler(responseData, nil)
            } catch {
                print(error)
                completionHandler(nil, nil)
            }
        }
        dataTask.resume()
    }
    
    @objc func getPopularTvDataFromURL(urlStr: NSString, reqType: NSString, headers: NSDictionary, completionHandler: @escaping (PopularTvResponseData?, NSError?) -> ()) {
        guard let url = URL(string: urlStr as String) else {return}
        var request = URLRequest(url:url)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                return;
            }
            
            do {
                let responseData = try JSONDecoder().decode(PopularTvResponseData.self, from: data)
                completionHandler(responseData, nil)
            } catch {
                print(error)
                completionHandler(nil, nil)
            }
        }
        dataTask.resume()
    }
    
    @objc func getUpcomingDataFromURL(urlStr: NSString, reqType: NSString, headers: NSDictionary, completionHandler: @escaping (UpcomingResponseData?, NSError?) -> ()) {
        
        guard let url = URL(string: urlStr as String) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = reqType as String
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error as NSError?)
                return;
            }
            do {
                let responseData = try JSONDecoder().decode(UpcomingResponseData.self, from: data)
                completionHandler(responseData, nil)
            } catch {
                print(error.localizedDescription)
                completionHandler(nil, error as NSError?)
            }
            
        }
        dataTask.resume()
    }
}
