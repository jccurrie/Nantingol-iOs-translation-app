//
//  SupportedLanguages.swift
//  Nantingol
//
//  Created by Daniel Young on 4/13/22.
//

import Foundation

struct SupportedLanguage: Decodable {
    let language: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case language
        case name
        
    }

}


struct SupportedLanguages: Decodable {
    let count: Int
    let all: [SupportedLanguage]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "Optional"
    }
}

    



//extension SupportedLanguages: Displayable {
//    var languageText: String {
//        language
//    }
//
//    var nameText: String {
//        name
//    }
//}
