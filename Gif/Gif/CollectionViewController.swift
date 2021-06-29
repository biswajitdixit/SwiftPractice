//
//  CollectionViewController.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    
    var gifs = [GifModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionFlowLayout()
      fetchGif()
        print(Service.gif.count)
       
    }
    func collectionFlowLayout(){
        let layout = GifCollectionFlowLayOut()
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func fetchGif(){
        Service.fetchGif { (gif) in
            self.gifs = gif
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(gifs.count)
        return gifs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        let gif = gifs[indexPath.row]
        cell.gif = gif
    
        return cell
    }

   
}
