//
//  Service.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Service {
    //static var gif = [GifModel]()
    static func addGif(_ gifUrl: String,title: String){
        let ref = Database.database().reference().child("gifs")
        let childRef = ref.childByAutoId()
        
        let values = ["gifUrl": gifUrl, "title":title ] as [String : Any]
        childRef.setValue(values)
        
    }
    static func fetchGif(Completion:@escaping ([GifModel])->Void){
        Database.database().reference().child("gifs").queryOrderedByKey().observe(.value){
            (snapshot) in
           // self.gif.removeAll()
            if let snapShot  = snapshot.children.allObjects as? [DataSnapshot]{
                GifModel.fetchGifRecord(snapshot)
                
                for snap in snapShot{
                    if let dictionary = snap.value as? [String:AnyObject]{
                        let gifUrl = dictionary["gifUrl"] as? String
                        let title = dictionary["title"] as? String
                      //  self.gif.append(GifModel(gifUrl: gifUrl!, title: title!))
                        //print(gif.count)
                      //  Completion(gif)
                        
                    }
                }
            }}
    }
}
