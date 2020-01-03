//
//  DetailInterfaceController.swift
//  Watch_SimpsonsProject WatchKit Extension
//
//  Created by dirtbag on 12/26/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import UIKit
import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var lblDetail: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        
        if let cast = context as? Cast {
            lblDetail.setText(cast.text)
        }
        
        
    }
}
