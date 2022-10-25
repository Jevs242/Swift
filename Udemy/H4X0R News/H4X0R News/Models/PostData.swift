//
//  PostData.swift
//  H4X0R News
//
//  Created by Jose Velazquez on 10/24/22.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable , Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
