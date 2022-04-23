//
//  ViewController.swift
//  Nantingol
//
//  Created by Daniel Young on 3/23/22.
//
import Foundation
import CoreData
import UIKit



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [String] = ["Afrikaans", "Bulgarian", "Czech", "German", "Spanish"]
    
    @IBOutlet weak var translateToPicker: UIPickerView!
    @IBOutlet weak var Nantingol: UILabel!
    @IBOutlet weak var myText: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    
    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For gesture-shake function
        self.becomeFirstResponder()
        
        // Connect language array to the "to translation" option picker
        self.translateToPicker.delegate = self
        self.translateToPicker.dataSource = self

        // Language array data for the translation option pickers
        // Gradient layers/cosmetics for the view and textfields backgrounds
        createViewGradientLayer()
    }
    
    
    //On motion end gesture clears input text field to default message.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            myText.text = ""
        }
    }
    
    //Segue on translate click, transfers myText field data to the favoritesViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "translateText") {
            let svc = segue.destination as! TranslationViewController
            svc.original = myText.text
            svc.languageChoice = self.language
        }
    }
    
    // Picker view required functions Columns and Rows
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.language = pickerData[row] as String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createViewGradientLayer()
    {
        // make everything look nice(rounds corners)
        myText.layer.masksToBounds = true
        myText.layer.cornerRadius = 20
        translateToPicker.layer.masksToBounds = true
        translateToPicker.layer.cornerRadius = 20
        
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: Nantingol.layer)
    }
}

