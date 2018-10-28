//
//  CardProfileViewController.swift
//  Tinder
//
//  Created by Shrijan Aryal on 10/28/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userImage:UIImage!
    @IBOutlet weak var userImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.image = userImage
        
    }
    // Do any additional setup after loading the view.
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapDone(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
