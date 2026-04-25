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
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var heroTitle = Title.previewTitles[1]
    
    func getTitles() async {
        homeStatus = .fetching
        if trendingMovies.isEmpty{
            
            do{
                async let tMovies =  dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedMovies = try await tRMovies
                topRatedTV = try await tRTV
                
                if let title = trendingMovies.randomElement(){
                    heroTitle = title
                }
                
                homeStatus = .sucess
                print("trending movies data fetched Sucessfully")
            }catch{
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        }else{
            homeStatus = .sucess
        }
    }
}
