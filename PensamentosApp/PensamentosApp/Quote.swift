//
//  Quote.swift
//  PensamentosApp
//
//  Created by Marcos V. S. Matsuda on 05/12/18.
//  Copyright © 2018 Marcos V. S. Matsuda. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "“" + quote + "”"
    }
    
    var authorFormatted: String{
        return "- " + author + " -"
    }
}
