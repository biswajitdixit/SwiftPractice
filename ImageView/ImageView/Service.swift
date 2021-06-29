//
//  Service.swift
//  ImageView
//
//  Created by admin on 25/06/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Service {
    static var images = [Image]()
    static func uploadImageToFirebase(_ image: UIImage, completion: @escaping (_ imageUrl: String) -> ()) {
        let imageName = UUID().uuidString
        let ref = Storage.storage().reference().child("collection_images").child(imageName)
        
        if let uploadData = image.jpegData(compressionQuality: 0.2) {
            ref.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                
                if error != nil {
                    print("Failed to upload image:", error!)
                    return
                }
                
                ref.downloadURL(completion: { (url, err) in
                    if let err = err {
                        print(err)
                        return
                    }
                    
                    completion(url?.absoluteString ?? "")
                })
                
            })
        }
    }
    static func addImage(_ imageUrl: String,image: UIImage){
        let ref = Database.database().reference().child("images")
        let childRef = ref.childByAutoId()
        
        let values = ["imageUrl": imageUrl, "imageWidth": "\(image.size.width)" , "imageHeight": "\(image.size.height)" ] as [String : Any]
        childRef.setValue(values)
        
    }
    static func fetchImage(Completion:@escaping ([Image])->Void){
        Database.database().reference().child("images").queryOrderedByKey().observe(.value){
            (snapshot) in
            self.images.removeAll()
            if let snapShot  = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    if let dictionary = snap.value as? [String:AnyObject]{
                        let imageUrl = dictionary["imageUrl"] as? String
                        let imageWidth = dictionary["imageWidth"] as? String
                        let imageHeight = dictionary["imageHeight"] as? String
                        self.images.append(Image(imageUrl: imageUrl!, imageWidth: imageWidth!, imageHeight:imageHeight!))
                        Completion(images)
                       
                    }
                }
            }}
    }

}
