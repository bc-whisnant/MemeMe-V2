//
//  SentMemeCollectionViewController.swift
//  MemeMe-V1
//
//  Created by Galvatron on 1/15/18.
//  Copyright © 2018 Galvatron. All rights reserved.
//

import Foundation
import UIKit

class SentMemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sentMemeCollectionView: UICollectionView!
    //@IBOutlet weak var collectionImage: UIImageView!
    
    
    var memes: [Meme]!
    var memeToBeEdited: Meme?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    collectionView(_:numberOfItemsInSection:) ---> returns number of memes in array
//    collectionView(_:cellForItemAt:) ---> returns a custom cell
//    collectionView(_:didSelectItemAt:)
//
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        //return the number of memes in the array
        return self.memes.count
    }
    
    // the following function is responsible for loading memes into view
    func memeLoader() {
        memes = appDelegate.memes
        self.collectionView?.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeLoader()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name, image and the correct fit for content
        collectionCell.memeImageView.image = meme.memedImage
        collectionCell.collectionImageLabelTop.text = "\(meme.topText)"
        collectionCell.collectionImageLabelBottom.text = "\(meme.bottomText)"
        collectionCell.memeImageView.contentMode = .scaleAspectFit

        return collectionCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SentMemeCollectionViewController") as! SentMemeCollectionViewController
        controller.memeToBeEdited = memes[indexPath.item]
        navigationController?.pushViewController(controller, animated: true)
    }

}
