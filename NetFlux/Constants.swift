//
//  Constants.swift
//  NetFlux
//
//  Created by Aditya Rai on 14/04/26.
//

import Foundation
import SwiftUI

struct Constants{
    static let homeString = "Home"
    static let upcommingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "download"
    static let playString = "Play"
    static let trendingMoviesString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMoviesString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIcon = "house"
    static let upcommingIcon = "play.circle"
    static let searchIcon = "magnifyingglass"
    static let downloadIcon = "arrow.down.to.line.alt"
    
    static let testTitleURL = "https://images.unsplash.com/photo-1511875762315-c773eb98eec0?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    static let testTitleURL2 = "https://images.unsplash.com/photo-1641549058491-8a3442385da0?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    static let testTitleURL3 = "https://images.unsplash.com/photo-1635805737707-575885ab0820?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    
    
}

//created an extention of a button so we can use this particular function to reduce the redencency of the code

extension Text{
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder,lineWidth: 5)
            }
    }
}
