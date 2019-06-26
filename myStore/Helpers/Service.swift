//
//  Service.swift
//  myStore
//
//  Created by Bartek Bugajski on 22/06/2019.
//  Copyright © 2019 BB. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service() //singleton
    
    func fetchScreenshots(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
            print("Fetching iTunes apps from Service layer")
            
            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
            guard let url = URL(string: urlString) else { return }
            //fetch data from the internet
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    print("Failed to fetch apps:", err)
                    completion([], nil)
                    return
                }
                //success
                //            print(data)
                //            print(String(data: data!, encoding: .utf8))
                guard let data = data else { return }
                
                do {
                    
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    completion(searchResult.results, nil)
                    
                } catch let jsonErr {
                    print("Failed to decode: json:", jsonErr)
                    completion([], jsonErr)
                    
                }
                
                
                
                }.resume() //fires of request
            
        }
    }

