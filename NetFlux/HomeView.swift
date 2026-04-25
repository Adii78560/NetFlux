//
//  HomeView.swift
//  NetFlux
//
//  Created by Aditya Rai on 14/04/26.
//

import SwiftUI

struct HomeView: View {
    
//    var heroTestTitle = Constants.testTitleURL
    
    @State private var viewModel = ViewModel()
    @State private var titleDetailPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $titleDetailPath) {
            GeometryReader { geo in
                ScrollView {
                    
                    switch viewModel.homeStatus {
                        
                    case .notStarted:
                        EmptyView()
                        
                    case .fetching:
                        ProgressView()
                            .frame(width: geo.size.width, height: geo.size.height)
                        
                    case .sucess:
                        LazyVStack {
                            
                            AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")) { image in
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
                                Button {
                                    titleDetailPath.append(viewModel.heroTitle)
                                } label: {
                                    Text(Constants.playString)
                                        .ghostButton()
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text(Constants.downloadString)
                                        .ghostButton()
                                }
                            }
                            
                            HorizontalListView(
                                header: Constants.trendingMoviesString,
                                titles: viewModel.trendingMovies
                            ){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.trendingTVString, titles: viewModel.trendingTV){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTV){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: Constants.topRatedMoviesString, titles: viewModel.topRatedMovies){title in
                                titleDetailPath.append(title)
                            }
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
                            print("Hero URL RAW:", "[\(viewModel.heroTitle.posterPath)]")
                        }
                    }
                }.navigationDestination(for: Title.self) { title in
                    TItleDetailView(title: title)
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
