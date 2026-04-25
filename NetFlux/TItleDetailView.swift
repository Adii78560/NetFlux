//
//  TItleDetailView.swift
//  NetFlux
//
//  Created by Aditya Rai on 23/04/26.
//

import SwiftUI

struct TItleDetailView: View {
    let title: Title
    var body: some View {
        GeometryReader{geometry in
            ScrollView{
                LazyVStack (alignment: .leading){
                    YoutubePlayer(videoId: "")
                        .aspectRatio(1.3,contentMode: .fit)

                    Text((title.name ?? title.title ?? ""))
                        .bold()
                        .font(.title2)
                        .padding(5)
                    Text(title.overview ?? "")
                        .padding(5)

                }
            }
        }
    }
}

#Preview {
    TItleDetailView(title: Title.previewTitles[1])
}
