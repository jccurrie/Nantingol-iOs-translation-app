//
//  Language.swift
//  Nantingol
//
//  Created by Daniel Young on 4/15/22.
//

struct Language: Decodable {
    let language: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case language
        case name
    }
}


