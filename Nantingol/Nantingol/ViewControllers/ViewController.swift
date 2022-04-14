//
//  ViewController.swift
//  Nantingol
//
//  Created by Daniel Young on 3/23/22.
//
import Foundation
import CoreData
import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [String] = [String]()
    @IBOutlet weak var translateToPicker: UIPickerView!
    @IBOutlet weak var translateFromPicker: UIPickerView!
    @IBOutlet weak var Nantingol: UILabel!
    @IBOutlet weak var myText: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    let TRANSLATION_API = "AIzaSyDe9TnAY7b8zKxcqHvlr6L14I5xm7jYhG4"
    var languages: NSDictionary = [:]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For gesture-shake function
        self.becomeFirstResponder()
        
        // Connect language array to the "from translation" / "to translation" option pickers
        self.translateFromPicker.delegate = self
        self.translateFromPicker.dataSource = self
        self.translateToPicker.delegate = self
        self.translateToPicker.dataSource = self

        // Language array data for the from translation / to translation option pickers
        pickerData = ["bob"]
        // Gradient layers/cosmetics for the view and textfields backgrounds
        createViewGradientLayer()
        fetchSupportedLanguages()
    }
    
    func fetchSupportedLanguages(){
        let encoder = URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(arrayEncoding: .noBrackets))
        
        let parameters = [
            "target": "en",
            "key": TRANSLATION_API,
        ]
        
        AF.request("https://translation.googleapis.com/language/translate/v2/languages", parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success:
                    self.languages =  response.value as! NSDictionary
//                    for (key, value) in self.languages {
//                        print("Value: \(value) for Key: \(key)")
//                    }
                    
                    let temp = self.languages.value(forKey: "data")
                    for item in temp? {
                        print(item)
                    }
                    print(temp)
                    print(self.languages.value(forKey: "data") as Any)
                }
            }
//            .responseDecodable(of: SupportedLanguages.self){ response in
//                guard let tempArray = response.value else { return }
//                print(response.value)
//        }
        
    }
    
    //On motion end gesture clears input text field to default message.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            myText.text = "Insert text for translation, shake your device to clear this text:"
        }
    }
    
    //Segue on translate click, transfers myText field data to the favoritesViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "translateText") {
            let svc = segue.destination as! TranslationViewController
             svc.original = myText.text
        }
    }
    
    // Picker view required functions Columns and Rows
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return languages.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return "\(languages[row])"
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
        translateFromPicker.layer.masksToBounds = true
        translateFromPicker.layer.cornerRadius = 20
        
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: Nantingol.layer)
    }
}

