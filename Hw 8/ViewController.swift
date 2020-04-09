//
//  ViewController.swift
//  Hw 8
//
//  Created by Ashawn C Berry on 3/30/20.
//  Copyright © 2020 Ashawn C Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var originalRect: CGRect!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func foundTap(_ sender: Any) {
        
        outputLabel.text = "You tapped!"
    }
    
    
    @IBAction func slideMe(_ sender: Any) {
        outputLabel.text = "You slid!"
    }
    
    
    
     override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion==UIEvent.EventSubtype.motionShake{
            outputLabel.text="Shake things up!"
        }
    }
   
    
    @IBAction func pinch(_ sender: Any) {
        var recgnizer: UIPinchGestureRecognizer
        var feedback: String
        var scale:CGFloat
        
        recgnizer=sender as! UIPinchGestureRecognizer
        scale=recgnizer.scale
        imageView.transform = CGAffineTransform(rotationAngle: 0.0)
        
        feedback=String( format: "Pinched, Scale: %1.2f, Velocity %1.2f")
        outputLabel.text=feedback
        
        imageView.frame = CGRect(origin:CGPoint(x:
            self.originalRect.origin.x,y :originalRect.origin.y), size:
            CGSize(width: originalRect.size.width*scale, height:
                originalRect.size.height*scale))
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        becomeFirstResponder()
        
        originalRect=imageView.frame;
        var tempImageView: UIImageView
        tempImageView=UIImageView(image: UIImage(named: "waves.png"))
        tempImageView.frame=originalRect
        view.addSubview(tempImageView)
        self.imageView=tempImageView
        
        
        
        
    }


}

