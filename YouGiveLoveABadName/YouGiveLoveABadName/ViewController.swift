//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJoviPic: UIImageView!

    // set variable for image height -- as a constraint
    
    var imageHeight: NSLayoutConstraint!
    var imageExpanded: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // give the height an initial value: 0.5 of view height
        self.bonJoviPic.translatesAutoresizingMaskIntoConstraints = false
        self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45)
        self.imageHeight.isActive = true
        
        
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        self.view.layoutIfNeeded()
        
        if imageExpanded == false {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: .beginFromCurrentState, animations: {
            
        // SHRINK image
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                // disable height constraint for now
                self.imageHeight.isActive = false
                
                // shrink image first
                self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3)
                
                // activate height constraint?
                self.imageHeight.isActive = true
                
                self.view.layoutIfNeeded()
                })
            
        // EXPAND image beyond view
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                // disable height constraint again?
                self.imageHeight.isActive = false
                // expand image to beyond the height of view
                self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.2)
                self.imageHeight.isActive = true
                
                self.view.layoutIfNeeded()
            })
            
        // REFRAME image back to view
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                self.imageHeight.isActive = false
                self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1)
                self.imageHeight.isActive = true
                
                
                
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
            self.imageExpanded = true
            
        } else if imageExpanded == true {
            self.view.layoutIfNeeded()
            
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: .beginFromCurrentState, animations: {
                
                // GROW beyond height of screen
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {

                    self.imageHeight.isActive = false
                    
                    self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.3)
                    
                    self.imageHeight.isActive = true
                    
                    self.view.layoutIfNeeded()
                })
                
                // SHRINK down below final height
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                
                    self.imageHeight.isActive = false
        
                    self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
                    
                    self.imageHeight.isActive = true
                    
                    self.view.layoutIfNeeded()
                })
                
                // RETURN to starting height
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                    self.imageHeight.isActive = false
                    self.imageHeight = self.bonJoviPic.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45)
                    self.imageHeight.isActive = true
                    
                    self.view.layoutIfNeeded()
                    
                })
                
                }, completion: nil)
    
             self.imageExpanded = false
            }
       
            
        }
    


}

