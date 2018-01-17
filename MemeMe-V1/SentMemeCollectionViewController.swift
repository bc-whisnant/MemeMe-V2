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
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionAddButton: UIBarButtonItem!
    
    
    var memes: [Meme]!
    var memeToBeEdited: Meme?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimensionWidth = (view.frame.size.width - (2 * space)) / 3.0
        let dimensionHeight = (view.frame.size.height - (3 * space)) / 4.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionWidth, height: dimensionHeight)
    }
    
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
        
        // set the name, image and the correct fit for content
        collectionCell.memeImageView.image = meme.memedImage
        collectionCell.collectionImageLabelTop.text = "\(meme.topText)"
        collectionCell.collectionImageLabelBottom.text = "\(meme.bottomText)"
        collectionCell.memeImageView.contentMode = .scaleAspectFit

        return collectionCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //pushes the memedetailviewcontroller on top of current controller
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
            controller.memeToBeEdited = memes[indexPath.item]
            navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    @IBAction func collectionAddButtonPressed(_ sender: Any) {
        // shows the memeviewcontroller when the add button is pressed
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    
    

}
