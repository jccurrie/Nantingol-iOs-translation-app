//
//  TranslationViewController.swift
//  Nantingol
//
//  Created by Julian Currie on 4/4/22.
//
import Foundation
import CoreData
import UIKit

class TranslationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var originalText: UITextField!
    @IBOutlet weak var translatedText: UITextField!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var Nantingol: UILabel!
    
    var original: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.originalText.delegate = self
        self.translatedText.delegate = self
        
        // Gradient layers/cosmetics for the view and textfield backgrounds
        createViewGradientLayer()
        originalText.text = original
    }
    
    
    @IBAction func favoriteTranslation(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newTranslation = NSEntityDescription.insertNewObject(forEntityName: "FavoriteEntity", into: context) as! FavoriteEntity
        newTranslation.originalText = "originalText.text"
        
        //TODO: run original text through API and return it here for saving (at the point we're doing this is may be ran else where, and this can just be set as translatedText.text though
        newTranslation.translatedText = "Blank text for now!"
    }
    
    func createViewGradientLayer()
    {
        originalText.layer.masksToBounds = true
        originalText.layer.cornerRadius = 20
        translatedText.layer.masksToBounds = true
        translatedText.layer.cornerRadius = 20
        
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: Nantingol.layer)
    }
}
