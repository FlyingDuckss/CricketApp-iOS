//
//  NewsModel.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

struct News {
    var headline: String?
    var subheading: String?
    var imageURL: String?
    var url: String?
    
    init(headline: String? = nil, subheading: String? = nil, imageURL: String? = nil, url: String? = nil) {
        self.headline = headline
        self.subheading = subheading
        self.imageURL = imageURL
        self.url = url
    }
}
