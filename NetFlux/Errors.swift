//
//  Errors.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation
//error provides the errors in the particular area
//and the localized error helps in throwing more user friendly messages

enum APIConfigError: Error, LocalizedError{
    
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case let .dataLoadingFailed(underlyingError):
            return "Failed to load data: \(underlyingError.localizedDescription)"
        case let .decodingFailed(underlyingError):
            return "Failed to decode data: \(underlyingError.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError{
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    var errorDescription: String? {
        switch self {
        case let .badURLResponse(underlyingError):
            return "Bad URL Response: \(underlyingError.localizedDescription)"
        case .missingConfig:
            return "Missing Configuration"
        case .urlBuildFailed:
            return "URL Build Failed"
        }
        
    }
}
