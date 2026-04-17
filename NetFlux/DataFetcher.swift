//
//  DataFetcher.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation
struct DataFetcher{
    
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    
    func fetchTitles(for media: String, by type: String) async throws -> [Title] {
        
        guard let fetchTitlesURL = URL(string: baseURL)?
            .appending(path: "3/trending/\(media)/day")
            .appending(queryItems: [URLQueryItem(name: "api_key", value: apiKey)])else{
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL)
        
        let(data, urlResponce) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let responce = urlResponce as? HTTPURLResponse, responce.statusCode == 200 else{
            throw NetworkError.badURLResponse(underlyingError: NSError(domain: "DataFetcher",
                                                                       code: (urlResponce as? HTTPURLResponse)? .statusCode ?? -1,
                                                                       userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Responce"]))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles =  try decoder.decode(ApiObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        return titles
    }
    private func buildURL(media: String,type: String) throws -> URL?{
        guard let baseURL = tmdbBaseURL else{
            throw NetworkError.missingConfig
        }
        guard let APIKey = tmdbAPIKey else{
            throw NetworkError.missingConfig
        }
        var path: String
        if type == 
    }
}
