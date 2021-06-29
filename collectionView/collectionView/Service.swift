//
//  Service.swift
//  collectionView
//
//  Created by admin on 25/06/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Service {
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
        
        let values = ["imageUrl": imageUrl, "imageWidth": image.size.width as AnyObject, "imageHeight": image.size.height ] as [String : Any]
        childRef.updateChildValues(values)
        
    }
}
