//
//  StoryTableViewCell.swift
//  AngelHacksSV
//
//  Created by Gautam Ajjarapu on 7/29/17.
//  Copyright © 2017 Gautam Ajjarapu. All rights reserved.
//

import UIKit


protocol StoryTableViewCellDelegate : class {
    func storyTableViewCellDidTouchInterest(_ cell: StoryTableViewCell, sender: AnyObject)
   
    
}

var nameMeal = ""
var lat: Float = 0.0
var lon: Float = 0.0
var phone: String = ""
class StoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var rectView: UIView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealDesc: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var nom: String = ""
    weak var delegate: StoryTableViewCellDelegate?
    

    @IBAction func interestButtonDidTouch(_ sender: AnyObject) {
        lat = latitude
        lon = longitude
        phone = nom
        nameMeal = mealName.text!.uppercased()
        delegate?.storyTableViewCellDidTouchInterest(self, sender: sender)
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        rectView.layer.shadowColor = UIColor.black.cgColor
        rectView.layer.shadowOpacity = 0.55
        rectView.layer.shadowOffset = CGSize.zero
        rectView.layer.shadowRadius = 4
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
