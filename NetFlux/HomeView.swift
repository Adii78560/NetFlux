//
//  HomeView.swift
//  NetFlux
//
//  Created by Aditya Rai on 14/04/26.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack{
                    //so the image of the title is fetched from an url thats why were gona user async to load on a different thread so it should not block the main thread
                    AsyncImage(url: URL(string: heroTestTitle)){image in
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .overlay{
                                LinearGradient(
                                    stops: [Gradient.Stop(color: .clear, location: 0.75),
                                    Gradient.Stop(color: .gradient, location: 1)],
                                startPoint: .top,
                                    endPoint: .bottom)
                            }
                        //addind a place holder as a progress view so if the image loads it shows the Progress view while loading the image form the backend/internet
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.86)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Text(Constants.playString)
                                .ghostButton()
                        }
                        Button{
                            
                        }label: {
                            Text(Constants.downloadString)
                                .ghostButton()
                        }
                    }
                    
                    HorizontalListView(header: Constants.topRatedMoviesString)
                    HorizontalListView(header: Constants.topRatedTVString)
                    HorizontalListView(header: Constants.trendingTVString)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
