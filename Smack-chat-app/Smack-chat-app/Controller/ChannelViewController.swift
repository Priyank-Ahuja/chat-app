//
//  ChannelViewController.swift
//  Smack-chat-app
//
//  Created by Pravir Ahuja on 09/04/20.
//  Copyright © 2020 Priyank Ahuja. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }

}
