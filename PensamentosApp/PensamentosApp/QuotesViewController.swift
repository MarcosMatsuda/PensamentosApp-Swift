//
//  QuotesViewController.swift
//  PensamentosApp
//
//  Created by Marcos V. S. Matsuda on 05/12/18.
//  Copyright © 2018 Marcos V. S. Matsuda. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBackground: UIImageView!
    @IBOutlet weak var lbQuotes: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    let config = Configuration.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156/255, green: 68/255, blue: 15/255, alpha: 1)
        lbQuotes.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192/255, green: 96/255, blue: 49/255, alpha: 1) : .yellow
        prepareQuote()
    }
    
    func prepareQuote(){
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        
        showRandomQuote()
    }
    
    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        
        lbQuotes.text = quote.quote
        lbAuthor.text = quote.authorFormatted
        ivPhoto.image =  UIImage(named: quote.image)
        ivPhotoBackground.image = ivPhoto.image
        
        lbQuotes.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBackground.alpha = 0.0
        ctTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuotes.alpha = 1
            self.lbAuthor.alpha = 1
            self.ivPhoto.alpha = 1
            self.ivPhotoBackground.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
        
    }

    

}
