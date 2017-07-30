//
//  StartViewController.swift
//  AngelHacksSV
//
//  Created by Gautam Ajjarapu on 7/29/17.
//  Copyright © 2017 Gautam Ajjarapu. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var eatButton: SpringImageView!

    @IBOutlet weak var gradBack: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gradient = CAGradientLayer()
        print(3/255)
        gradient.frame = gradBack.bounds
        gradient.colors = [UIColor(red: 11/255, green: 151/255, blue: 255/255, alpha: 1).cgColor,UIColor(red: 121/255, green: 199/255, blue: 255/255, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradBack.layer.insertSublayer(gradient, at: 0)
        eatButton.layer.cornerRadius = 8.0
        eatButton.layer.shadowColor = UIColor.black.cgColor
        eatButton.layer.shadowOpacity = 0.2
        eatButton.layer.shadowOffset = CGSize.zero
        eatButton.layer.shadowRadius = 4
        
        let thumbnail = resizeImage(image: #imageLiteral(resourceName: "rob-bye-98949"), targetSize: CGSize.init(width: 70, height: 70))
        //bgImage.image = UIImage(named: "henry")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}
