//
//  HomeView.swift
//  NetFlux
//
//  Created by Aditya Rai on 14/04/26.
//

import SwiftUI

struct HomeView: View {
    
    var heroTestTitle = Constants.testTitleURL
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                
                switch viewModel.homeStatus {
                    
                case .notStarted:
                    EmptyView()
                    
                case .fetching:
                    ProgressView()
                    
                case .sucess:
                    LazyVStack {
                        
                        AsyncImage(url: URL(string: heroTestTitle)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(
                                        stops: [
                                            .init(color: .clear, location: 0.75),
                                            .init(color: .gradient, location: 1)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width,
                               height: geo.size.height * 0.86)
                        
                        HStack {
                            Button {} label: {
                                Text(Constants.playString)
                                    .ghostButton()
                            }
                            
                            Button {} label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                        }
                        
                        HorizontalListView(
                            header: Constants.trendingMoviesString,
                            titles: viewModel.trendingMovies
                        )
                    }
                    
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .task {
                if case .notStarted = viewModel.homeStatus {
                    await viewModel.getTitles()
                    if let config = APIConfig.shared{
                        print("API KEY RAW:", config.tmdbAPIKey.debugDescription)
                        print("BASE URL RAW:", config.tmdbBaseURL.debugDescription)
                        print("BASE URL LENGTH:", config.tmdbBaseURL.count)
                        print("Hero URL RAW:", "[\(heroTestTitle)]")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
