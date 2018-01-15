//
//  SentMemeTableViewController.swift
//  MemeMe-V1
//
//  Created by Galvatron on 1/14/18.
//  Copyright © 2018 Galvatron. All rights reserved.
//

import Foundation
import UIKit

class SentMemeTableViewController: UITableViewController {
    
    // add outlets for table and prototype cell
    @IBOutlet weak var sentMemeTableView: UITableView!
    
    var memes: [Meme]!
    var memeToBeEdited: Meme?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add it to the memes array in the Application Delegate
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of memes in the array
        return self.memes.count
    }
    
    // the following function is responsible for loading memes into view
    func memeLoader() {
        memes = appDelegate.memes
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeLoader()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name, image and the correct fit for content
        cell.textLabel?.text = "\(meme.topText) \(meme.bottomText)"
        cell.imageView?.image = meme.memedImage
        cell.imageView?.contentMode = .scaleAspectFit
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "SentMemeTableViewController") as! SentMemeTableViewController
        controller.memeToBeEdited = memes[indexPath.row]
        navigationController!.pushViewController(controller, animated: true)
        print("did this work?")
    }
    

}
