//
//  Main.swift
//  Media
//
//  Created by hwanghye on 6/11/24.
//

import Foundation

// Interface 정의
struct MovieTrend: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let backdropPath: String
    let originalTitle, overview, posterPath, mediaType: String
    let title, originalLanguage: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case title
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
