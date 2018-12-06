//
//  QuotesManager.swift
//  PensamentosApp
//
//  Created by Marcos V. S. Matsuda on 05/12/18.
//  Copyright © 2018 Marcos V. S. Matsuda. All rights reserved.
//

import Foundation

class QuotesManager {
    
    let quotes: [Quote]
    
    init() {
        
        let fileUrl = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        
        let jsonData = try! Data(contentsOf: fileUrl)
        
        let jsonDecoder = JSONDecoder()
        
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
        
        
    }
    func getRandomQuote()->Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
    
}
