//
//  ContentView.swift
//  NetFlux
//
//  Created by Aditya Rai on 14/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIcon){
                HomeView()
            }
            Tab(Constants.upcommingString, systemImage: Constants.upcommingIcon){
                Text(Constants.upcommingString)
            }
            Tab(Constants.searchString, systemImage: Constants.searchIcon){
                Text(Constants.searchString)
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIcon){
                Text(Constants.downloadString)
            }
        }
    }
}

#Preview {
    ContentView()
}
