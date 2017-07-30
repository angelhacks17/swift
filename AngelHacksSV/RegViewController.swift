//
//  RegViewController.swift
//  AngelHacksSV
//
//  Created by Gautam Ajjarapu on 7/30/17.
//  Copyright © 2017 Gautam Ajjarapu. All rights reserved.
//

import UIKit
var initial = ""


class RegViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func nextButtonDidTouch(_ sender: Any) {
        
        performSegue(withIdentifier: "toList", sender: nil)
        
        
    }
    
    
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        pickerData = ["Indian", "Italian", "Greek", "Mexican", "Chinese", "Thai"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_  pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
