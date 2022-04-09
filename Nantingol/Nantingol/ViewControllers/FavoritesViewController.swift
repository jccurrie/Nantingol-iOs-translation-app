//
//  FavoritesViewController.swift
//  Nantingol
//
//  Created by Julian Currie on 4/4/22.
//

import Foundation
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favorites: UITableView!
    @IBOutlet weak var Nantingol: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect language array to the from translation / to translation option pickers
        //self.favorites.delegate = self
        //self.favorites.dataSource = self
        
        // Gradient layers/cosmetics for the view and textfields backgrounds
        createViewGradientLayer()

    }
    
    func createViewGradientLayer()
    {
        favorites.layer.masksToBounds = true
        favorites.layer.cornerRadius = 20
        
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: Nantingol.layer)
    }
}
