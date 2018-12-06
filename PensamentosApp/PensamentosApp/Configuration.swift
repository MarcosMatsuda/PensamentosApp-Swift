//
//  Configuration.swift
//  PensamentosApp
//
//  Created by Marcos V. S. Matsuda on 05/12/18.
//  Copyright © 2018 Marcos V. S. Matsuda. All rights reserved.
//

import Foundation

enum userDefaultKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autoRefresh = "autoRefresh"
    
}

class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double{
        get{
            return defaults.double(forKey: userDefaultKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userDefaultKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int{
        get{
            return defaults.integer(forKey: userDefaultKeys.colorScheme.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userDefaultKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool{
        get{
            return defaults.bool(forKey: userDefaultKeys.autoRefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userDefaultKeys.autoRefresh.rawValue)
        }
    }
    
    private init(){
        if defaults.double(forKey: userDefaultKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: userDefaultKeys.timeInterval.rawValue)
        }
    }
}
