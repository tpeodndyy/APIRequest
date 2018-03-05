//
//  ViewController.swift
//  Example
//
//  Created by Peera Kerdkokaew on 3/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }

    func loadPosts() {
        let searchRequest = CustomParameterSearchRequest(searchOption: SearchOption(userId: "1"))
        URLSession.shared.send(apiRequest: searchRequest) { [weak self]
            (posts, error) in
            guard let `self` = self else {
                return
            }
            if let posts = posts {
                self.posts.append(contentsOf: posts)
                let indexPaths = (0..<posts.count).map( { IndexPath(row: $0, section: 0) } )
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.performBatchUpdates({
                        self?.tableView.insertRows(at: indexPaths, with: .automatic)
                    }, completion: nil)
                }
            } else {
                
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
}

extension UIViewController {
    
    func show(alertViewWithTitle title: String, message: String, actionTitle: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
}

