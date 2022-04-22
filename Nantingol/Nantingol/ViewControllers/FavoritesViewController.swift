//
//  FavoritesViewController.swift
//  Nantingol
//
//  Created by Julian Currie on 4/4/22.
//

import Foundation
import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Nantingol: UILabel!
    
    var favorites: [FavoriteEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect language array to the from translation / to translation option pickers
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
        
        // Gradient layers/cosmetics for the view and textfields backgrounds
        createViewGradientLayer()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as? FavoriteTableViewCell
        {
            let fav = favorites[indexPath.row]
            cell.original.text = fav.originalText
            cell.translated.text = fav.translatedText
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fav = favorites[indexPath.row]
        
        let alert = UIAlertController(title: fav.originalText, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "View", style: .default, handler: {_ in
            let alert2 = UIAlertController(title: "Favorite", message: "\n" + "Original: " + fav.originalText! + "\n" + "\n" + "Translated: " + fav.translatedText! , preferredStyle: .alert)
            alert2.setValue(NSAttributedString(string: alert2.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24,weight: UIFont.Weight.medium),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
            alert2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert2, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {_ in
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                context.delete(fav)
                try context.save()
                self.favorites.remove(at: indexPath.row)
                tableView.reloadData()
            } catch {}
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func clearData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
        UserDefaults.standard.set(false, forKey: "isDownloaded")
        print("Data cleared")
    }
    
    func loadData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteEntity")
        do {
            let favs = try context.fetch(fetchRequest) as! [FavoriteEntity]
            updateData(favs: favs)
        } catch {
            print(error)
        }
    }
        
    
    func updateData(favs: [FavoriteEntity]) {
        self.favorites = favs
        self.tableView.reloadData()
    }

    
    func createViewGradientLayer()
    {
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 20
        
        // creates a sublayer underneath everything on the main view for background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemPurple.cgColor]
        view.layer.insertSublayer(gradientLayer, below: Nantingol.layer)
    }
}

