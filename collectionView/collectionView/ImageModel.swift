//
//  ImageModel.swift
//  collectionView
//
//  Created by admin on 25/06/21.
//

import Foundation
struct ImageModel{
    var imageUrl: String?
    var imageWidth: NSNumber?
    var imageHeight: NSNumber?
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String
        self.imageWidth = dictionary["imageWidth"] as? NSNumber
        self.imageHeight = dictionary["imageHeight"] as? NSNumber
    }
}
