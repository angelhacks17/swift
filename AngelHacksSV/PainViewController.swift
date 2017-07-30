//
//  PainViewController.swift
//  AngelHacksSV
//
//  Created by Gautam Ajjarapu on 7/30/17.
//  Copyright © 2017 Gautam Ajjarapu. All rights reserved.
//

import UIKit
import Button

class PainViewController: UIViewController {

    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var mealLabel: UILabel!
    
    @IBOutlet weak var tryButton: BTNDropinButton!
 
    @IBOutlet weak var delivButton: BTNDropinButton!
    
    @IBOutlet weak var callView: UIView!
    
    
    @IBAction func callDidTouch(_ sender: Any) {
        
                
    }
    
    var story = [String: AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        restLabel.text = restaurant.uppercased()
        mealLabel.text = nameMeal.uppercased()
        
        let location = BTNLocation(name: restaurant, latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
        let context: BTNContext = BTNContext.init(subjectLocation: location);
        
        if let button = self.tryButton {
            
            
            button.buttonId = "btn-60fd997b7caa696b"
            
            button.prepare(with: context, completion: { (isDisplayable: Bool) -> Void in
                print("Displayable: \(isDisplayable)")
            })
        }
        
        
        
        let location2 = BTNLocation(name: restaurant, latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon));
        let context2 = BTNContext(subjectLocation: location2);
        
        if let button2 = self.delivButton {
            
           
            button2.buttonId = "btn-14fd8b3b27849214"
            
            button2.prepare(with: context2, completion: { (isDisplayable: Bool) -> Void in
                print("Displayable: \(isDisplayable)")
            })
        }
        
        
        
        callView.layer.cornerRadius = 7;
        callView.layer.masksToBounds = true;
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }

}
