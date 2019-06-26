//
//  SearchResult.swift
//  myStore
//
//  Created by Bartek Bugajski on 20/06/2019.
//  Copyright © 2019 BB. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let artistName: String
    let primaryGenreName: String
    let artworkUrl100: String //video icon
    let screenshotUrls: [String]
}
