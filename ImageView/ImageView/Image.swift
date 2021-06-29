//
//  Image.swift
//  ImageView
//
//  Created by admin on 25/06/21.
//

import Foundation
struct Image{
  
var imageUrl: String?
var imageWidth: String?
var imageHeight: String?
    init(imageUrl: String , imageWidth: String, imageHeight: String) {
 //   self.id = dictionary["id"] as? String
    self.imageUrl = imageUrl
    self.imageWidth = imageWidth
    self.imageHeight = imageHeight
}
}
