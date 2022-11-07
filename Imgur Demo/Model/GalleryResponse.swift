//
//  GalleryResponse.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import Foundation

struct GalleryResponse: Codable {
    let data: [GalleryData]?
}

// MARK: - GalleryData
struct GalleryData: Codable, Hashable, Equatable {
    let id, title: String
    let description: String?
    let datetime: Int
    let link: String
    let section: String
    let totalImages: Int?
    let images: [Images]?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case description
        case datetime, link ,section
        case totalImages = "images_count"
        case images
    }
}


// MARK: - Images
struct Images: Codable, Hashable, Equatable {
    let id: String
    let link: String
}
