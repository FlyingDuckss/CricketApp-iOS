//
//  ExploreModel.swift
//  Go Cricket
//
//  Created by Usama on 04/10/2024.
//

struct ExploreModel {
    var title: String?
    var url: String?
    var imageURL: String?
    
    
    init(title: String? = nil, url: String? = nil, imageURL: String? = nil) {
        self.title = title
        self.url = url
        self.imageURL = imageURL
    }
}
