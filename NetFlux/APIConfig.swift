//
//  APIConfig.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation

struct APIConfig: Decodable{
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    let youtubeBaseURL: String
    
    static let shared: APIConfig? = {
        do {
            return try loadConfig()
        } catch {
            print("Error loading API Config: \(error)")
            return nil
        }
    }()
    
    
    private static func loadConfig() throws -> APIConfig {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            throw APIConfigError.fileNotFound
        }
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }catch let error as DecodingError {
            throw APIConfigError.decodingFailed(underlyingError: error)
        }catch{
            throw APIConfigError.decodingFailed(underlyingError: error)
        }
    }
}
