//
//  GIfViewController.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import UIKit
private let reuseIdentifier = "GifCollectionViewCell"
class GIfViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    var gifs = [GifModel]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        collectionFlowLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchGif()
        // Do any additional setup after loading the view.
    }
    

    private func registerCell()
    {
        collectionView.register(UINib.init(nibName: "GifCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(gifs.count)
        return gifs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GifCollectionViewCell
    
        let gif = gifs[indexPath.row]
        cell.gif = gif
    
        return cell
    }


}
