//
//  Favorite.swift
//  Nantingol
//
//  Created by Julian Currie on 4/6/22.
//

import Foundation
import CoreData
import UIKit


struct BigCiv: Codable {
    let civilizations: [CivAPIOBJ]
}

struct CivAPIOBJ: Codable {
    let name: String?
    let id: Int16?
    let expansion: String?
    let bonus: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, expansion
        case bonus = "team_bonus"
    }

