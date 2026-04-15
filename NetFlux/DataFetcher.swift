//
//  DataFetcher.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation
struct DataFetcher {

    func fetchTitles(for media: String) async throws -> [Title] {
        
        guard let config = APIConfig.shared else {
            throw NetworkError.missingConfig
        }
        
        let baseURL = config.tmdbBaseURL
        let apiKey  = config.tmdbAPIKey
        
        guard let fetchTitlesURL = URL(string: baseURL)?
            .appending(path: "3/trending/\(media)/day")
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        print("Final URL:", fetchTitlesURL)
        
        let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.badURLResponse(
                underlyingError: NSError(
                    domain: "DataFetcher",
                    code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                    userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]
                )
            )
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        var titles = try decoder.decode(ApiObject.self, from: data).results
        
        Constants.addPosterPath(to: &titles)
        
        return titles
    }
}
