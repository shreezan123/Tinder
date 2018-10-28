//
//  CardsViewController.swift
//  Tinder
//
//  Created by Shrijan Aryal on 10/28/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit
class CardsViewController: UIViewController {
    var fadeTransition: FadeTransition!
    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanCard(_:)))
        
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(panGestureRecognizer)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = imageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            if (velocity.x > 0){
                imageView.transform = imageView.transform.rotated(by: CGFloat(0.15 * M_PI / 180))
            }
            else if (velocity.x < 0){
                imageView.transform = imageView.transform.rotated(by: CGFloat(-0.15 * M_PI / 180))
            }
            
        } else if sender.state == .ended {
            print("Gesture ended")
            if (translation.x < -150) {
                imageView.removeFromSuperview()
            } else if (translation.x > 150) {
                imageView.removeFromSuperview()
            }else{
                imageView.center.x = cardInitialCenter.x
                imageView.center.y = cardInitialCenter.y
                imageView.transform = CGAffineTransform.identity
            }
        }
        
        
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.custom
        vc.userImage = imageView.image!
        
        //Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        vc.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
