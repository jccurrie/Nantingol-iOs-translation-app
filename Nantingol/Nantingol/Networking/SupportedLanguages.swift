//
//  SupportedLanguages.swift
//  Nantingol
//
//  Created by Daniel Young on 4/13/22.
//

import Foundation
import SwiftUI



struct SupportedLanguages: Decodable {
    let data: [Languages]
    
    enum SupportedLanguage: String, CodingKey {
        case data
    }
}



    
    



