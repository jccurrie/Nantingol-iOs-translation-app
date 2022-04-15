//
//  Languages.swift
//  Nantingol
//
//  Created by Daniel Young on 4/15/22.
//

struct Languages: Decodable {
    let languages: [[String: Language]]
    
    enum CodingKeys: String, CodingKey{
        case languages = "languages"
    }
}


