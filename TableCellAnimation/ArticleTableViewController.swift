//
//  ArticleTableViewController.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 3/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    
    let postTitles = ["Use Background Transfer Service To Download File in Background",
                      "Face Detection in iOS Using Core Image",
                      "Building a Speech-to-Text App Using Speech Framework in iOS 10",
                      "Building Your First Web App in Swift Using Vapor",
                      "Creating Gradient Colors Using CAGradientLayer",
                      "A Beginner's Guide to CALayer"];
    let postImages = ["imessage-sticker-pack", "face-detection-featured", "speech-kit-featured", "vapor-web-framework", "cagradientlayer-demo", "calayer-featured"];
    
    var postShown = [Bool](repeating: false, count: 6)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 258.0
        tableView.rowHeight = UITableView.automaticDimension
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTitles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        
        // Configure the cell...
        cell.titleLabel.text = postTitles[(indexPath as NSIndexPath).row]
        cell.postImageView.image = UIImage(named: postImages[(indexPath as NSIndexPath).row])

        return cell
    }
    
    // Function to create animations for the cells
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Determine if the post is displayed. If yes, we just return and no animation will be created
        if postShown[indexPath.row] {
            return
        }
        
        // Indicate the post has been displayed, so the animation won't be displayed again
        postShown[indexPath.row] = true
        
        // Fade in animation -> lines 62 - 66
        
        // Define the initial state (Before the animation)
        cell.alpha = 0
        
        // Define the final state (After the animation)
        UIView.animate(withDuration: 1.0, animations: { cell.alpha = 1 })
        
        // Rotate animation -> Lines 72 - 77
        // The idea is to rotate the image 90 degree first and the bring them back into the normal position
        
        // Define the initital state (Before the animation
        //let rotationAngleInRadians = 90.0 * CGFloat(Double.pi/180.0)
        //let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        //cell.layer.transform = rotationTransform
        
        // Define final state (After the animation)
        //UIView.animate(withDuration: 1.0, animations: { cell.layer.transform = CATransform3DIdentity})
        
        // Fly in animation -> Lines 82 - 87
    
        // Define the initital state (Before the animation
        //let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        //cell.layer.transform = rotationTransform
        
        // Define final state (After the animation)
        //UIView.animate(withDuration: 1.0, animations: { cell.layer.transform = CATransform3DIdentity})
    }
    

}
