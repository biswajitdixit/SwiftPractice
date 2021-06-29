//
//  ImageViewController.swift
//  ImageView
//
//  Created by admin on 25/06/21.
//

import Foundation
import UIKit
import Firebase
import SkeletonView
class ImageViewController:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var images = [Image]()
    override func viewDidLoad() {
        super.viewDidLoad()
   
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionFlowLayout()
        animation()
        fetchImage()
    
    }

    @IBAction func addImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CollectionViewCell", for: indexPath) as!CollectionViewCell
        let img = images[indexPath.row]
        cell.imageView.loadImageUsingCacheWithUrlString(img.imageUrl!)
        return cell
    }
     func collectionFlowLayout(){
        let layout = ImageCollectionFlowLayout()
       
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    
    
    func fetchImage(){

        Service.fetchImage { (image) in
            self.images = image
            DispatchQueue.main.async {
                self.collectionView.stopSkeletonAnimation()
                self.view.hideSkeleton()
                self.collectionView.reloadData()
            }
            
        }
        
    }
    func animation(){
        let gradiant = SkeletonGradient(baseColor: .lightGray)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
        collectionView.showAnimatedGradientSkeleton(usingGradient: gradiant, animation: animation)
    }
    
}
extension ImageViewController:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            Service.uploadImageToFirebase(selectedImage ,completion:{  (imageUrl) in
                Service.addImage(imageUrl, image: selectedImage)
                
            })
         }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            print("failed to navigate")
            return  }
        
        let image = images[indexPath.row]
        vC.images = image
        navigationController?.pushViewController(vC, animated: true )
        print("working")
    }
}
extension ImageViewController:SkeletonCollectionViewDataSource{
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CollectionViewCell"
    }
    
    
}
