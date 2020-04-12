//
//  AddChannelViewController.swift
//  Smack-chat-app
//
//  Created by Pravir Ahuja on 12/04/20.
//  Copyright © 2020 Priyank Ahuja. All rights reserved.
//

import UIKit

class AddChannelViewController: UIViewController {

    //Outlets
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    //Actions
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVIew()
        // Do any additional setup after loading the view.
    }

    func setupVIew() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelViewController.closeTapped(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameText.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceHolder])
        descriptionText.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceHolder])
    }
    
    @objc func closeTapped(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
