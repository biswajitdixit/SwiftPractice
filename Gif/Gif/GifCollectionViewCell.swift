//
//  GifCollectionViewCell.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import UIKit

class GifCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    var gif:GifModel?{
        didSet{
            configure()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(){
        guard let gifUrl = gif?.gifUrl else { return  }
        gifView?.loadGif(url: gifUrl)
        guard let titleTxt = gif?.title else { return  }
        titleLbl?.text = titleTxt
    }
}
