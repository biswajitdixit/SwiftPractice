//
//  CollectionViewCell.swift
//  ImageView
//
//  Created by admin on 25/06/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var images:Image?{
        didSet{
            configure()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
    }
    func configure(){
        guard let image = images?.imageUrl else {return}
        imageView.loadImageUsingCacheWithUrlString(image)
    }

}
