//
//  ViewModel.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation

@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case sucess
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do{
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .sucess
            print("trending movies data fetched Sucessfully")
        }catch{
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
