//
//  TMDBAPI.swift
//  Movie
//
//  Created by hwanghye on 6/26/24.
//

import UIKit
import Alamofire

// Interface
struct Trending: Decodable {
    let page: Int
    let results: [TrendingDetail]
    let total_pages: Int
    let total_results: Int
}
struct TrendingDetail: Decodable {
    let poster_path: String
}

class TMDBAPI {
    static let shared = TMDBAPI()
    private init() { }
    
    typealias TrendingDetailHandler = ([TrendingDetail]?, String?) -> Void
    
    func tmdb(api: TMDBRequest, completionHandler: @escaping TrendingDetailHandler) {
        print(#function)
        AF.request(api.endpoint,
                   method: api.mothod,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .validate(statusCode: 200..<500)
        .responseDecodable(of: Trending.self) { response in
            switch response.result {
            case .success(let value):
                print("SUCCESS")
                completionHandler(value.results, nil)
                
            case .failure(let error):
                print("Failed")
                completionHandler(nil, "잠시 후 다시 시도해주세요")
                print(error)
            }
        }
    }
}
