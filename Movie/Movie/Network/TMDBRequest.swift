//
//  TMDBRequest.swift
//  Movie
//
//  Created by hwanghye on 6/26/24.
//

import UIKit
import Alamofire

enum TMDBRequest {
    
    case trendingTV
    case trendingMovie
    case search(query: String)
    case images(id: Int)
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    var endpoint: URL {
        switch self {
        case .trendingTV:
            return URL(string: baseURL + "trending/tv/day")!
        case .trendingMovie:
            return URL(string: baseURL + "trending/movie/day")!
        case .search:
            return URL(string: baseURL + "search/movie")!
        case .images(let id):
            return URL(string: baseURL + "movie/\(id)/images")!
        }
    }
    var header: HTTPHeaders{
        return ["Authorization": APIKey.tmdb_token]
    }
    var mothod: HTTPMethod {
        return .get
    }
    var parameter: Parameters {
        switch self {
        case .trendingTV, .trendingMovie:
            return ["language": "ko-KR"]
        case .search(let query):
            return ["query": query]
        case .images:
            return ["": ""]
        }
    }
}
