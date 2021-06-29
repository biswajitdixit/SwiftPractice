//
//  GifModel.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import Foundation
import Firebase
struct GifModel{
    var gifUrl:String?
    var title:String?
    init(gifUrl:String, title:String ) {
        self.gifUrl = gifUrl
        self.title = title
    }
}
extension GifModel{
    func fetchGifRecord(record:[DataSnapshot])->[GifModel]{
        
    }
}

