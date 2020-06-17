//
//  AlertService.swift
//  Knock
//
//  Created by Christopher Grayston on 6/13/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert() -> AlertViewController {
        
        let storyboard = UIStoryboard(name: "Alert", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(identifier: "AlertVC") as! AlertViewController
        
        return alertVC
    }
}
