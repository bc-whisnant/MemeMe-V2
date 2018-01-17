//
//  MemeDetailViewController.swift
//  MemeMe-V1
//
//  Created by Galvatron on 1/15/18.
//  Copyright © 2018 Galvatron. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    var memeToBeEdited: Meme?

    @IBOutlet weak var pickedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickedImageView.image = memeToBeEdited?.memedImage
        pickedImageView.contentMode = .scaleAspectFit
    }
    
}
