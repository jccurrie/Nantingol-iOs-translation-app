//
//  ViewController.swift
//  Nantingol
//
//  Created by Daniel Young on 3/23/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Picker view required functions Columns and Rows
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "\(pickerData[row])"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var pickerData: [String] = [String]()
 
    @IBOutlet weak var translateToPicker: UIPickerView!
    
    @IBOutlet weak var translateFromPicker: UIPickerView!

    @IBOutlet weak var myStuff: UILabel!
    
    @IBOutlet weak var myField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        // Connect language array to the from translation / to translation option pickers
        self.translateFromPicker.delegate = self
        self.translateFromPicker.dataSource = self
        self.translateToPicker.delegate = self
        self.translateToPicker.dataSource = self

        // Language array data for the from translation / to translation option pickers
        pickerData = ["Language 1", "Language 2", "Language 3", "Language 4",]

        
        // Gradient layers/cosmetics for the view and textfields backgrounds
        createViewGradientLayer()
        myField.layer.masksToBounds = true
        myField.layer.cornerRadius = 20
        translateToPicker.layer.masksToBounds = true
        translateToPicker.layer.cornerRadius = 20
        translateFromPicker.layer.masksToBounds = true
        translateFromPicker.layer.cornerRadius = 20
    
    }
    
    
    func createViewGradientLayer()
    {
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: myStuff.layer)
    }
}

