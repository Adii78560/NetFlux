//
//  Title.swift
//  NetFlux
//
//  Created by Aditya Rai on 15/04/26.
//

import Foundation

struct ApiObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable, Hashable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "A Movie about BeetleJuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview: "A Movie About Pulp Fiction", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "The Dark Knight", name: "The Dark Knight", overview: "A Moview About BatMan", posterPath: Constants.testTitleURL3)
    ]
    
}
