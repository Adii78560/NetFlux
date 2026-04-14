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

struct Title: Decodable, Identifiable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var psoterPath: String?
    
}
