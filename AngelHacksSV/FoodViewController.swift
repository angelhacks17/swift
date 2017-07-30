//
//  FoodViewController.swift
//  AngelHacksSV
//
//  Created by Gautam Ajjarapu on 7/30/17.
//  Copyright © 2017 Gautam Ajjarapu. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase
var ref: FIRDatabaseReference!
import SwiftyJSON



struct StoryItem {
    
    var meal: String!
    var img: String!
    var price: String!
    var rating: Int!
    var la: Float!
    var lo: Float!
    var ph: String!
    
    // Initialize from arbitrary data
    init(meal: String, img: String, price: String, rating: Int, la: Float, lo: Float, ph: String) {
        self.meal = meal
        self.img = img
        self.price = price
        self.rating = rating
        self.la = la
        self.lo = lo
        self.ph=ph
    }
    
}




var items = [StoryItem]()
var cuisines = [JSON]()
var restaurant = ""



class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoryTableViewCellDelegate{

    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var foodLabel: UILabel!
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        ref.observe(.value, with: { (snapshot) in
            let objects = JSON(snapshot.value)
            //print(objects)
            
            let object2 = objects["Gautam"]["Cuisine"]
            for (key,subJson): (String, JSON) in object2 {
                //print(subJson["Meals"])
                    for (key,subSJson): (String, JSON) in subJson{
                        print(key)
                        restaurant = key
                        self.foodLabel.text="RESTAURANT: "+restaurant.uppercased()
                        cuisines.append(subSJson["Meals"])
                    }
            }
                
            
            
            //print(self.cuisines)
            //print(cuisines[cuisines.count-1])
            for (ind, index): (String, JSON) in cuisines[cuisines.count-1]
            {
                
                            //print(index)
                            //print(index["name"].string!)
                            //print(index["image"].string!)
                            //print(index["price"].string!)
                            items.append(StoryItem(meal: index["name"].string!, img: index["url"].string!, price: index["price"].string!, rating: index["rating"].int!, la: index["coordinates"]["latitude"].float!, lo: index["coordinates"]["longitude"].float!, ph: index["display_phone"].string!))
                
            }
            
            self.tableView.reloadData()
            
        })
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! StoryTableViewCell!
        if(items.count > 0)
        {
            let data = items[indexPath.row] as StoryItem!
            cell?.mealName.text = data?.meal
            cell?.mealPrice?.text = data?.price!
            cell?.mealDesc.text = data?.img
            var s = "\(data?.rating)"
            let index = s.index(s.startIndex, offsetBy: 9)
            cell?.rate.text = "Rating: "+"\(s[index])"
            cell?.latitude = data!.la
            cell?.longitude = data!.lo
            cell?.nom = (data?.ph)!
            cell?.delegate = self
            
        }
        return cell!;
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
        
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
    
    
    func storyTableViewCellDidTouchInterest(_ cell: StoryTableViewCell, sender: AnyObject) {
        performSegue(withIdentifier: "toButtons", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toButtons")
        {
            //let toView = segue.destination as! PainViewController
            //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            //toView.story = data[indexPath.row]
        }
    }


}
