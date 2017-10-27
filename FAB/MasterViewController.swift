//
//  MasterViewController.swift
//  FAB
//
//  Created by Alexander Zakatnov on 09/10/2017.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import UIKit
import SafariServices

let kInstabotUrl = "https://www.instabot.io/?utm_medium=githubfabsample&platform=ios"

class MasterViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        FAButton.addToWindow(width: 56.0, position: .rightBottom, draggable: true)
        guard let btnImage:UIImage = UIImage(named: "fab") else {
            return
        }
        FAButton.globalButtonImage = btnImage
    }
    
    @IBAction func register(_ sender: Any) {
        guard let url = URL(string: kInstabotUrl) else {
            return
        }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
    }


}

