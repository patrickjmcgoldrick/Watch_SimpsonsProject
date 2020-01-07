//
//  InterfaceController.swift
//  Watch_SimpsonsProject WatchKit Extension
//
//  Created by dirtbag on 12/26/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    var characterData: [Cast]?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let network = NetworkController()
        network.getSouthParkCharacters { (characters) in
            
            self.characterData = characters
            
            guard let chars = self.characterData else { return }
            
            print(chars.count)
            
            if !chars.isEmpty {
                self.table.setNumberOfRows(chars.count, withRowType: "cell")
                for index in 0..<chars.count {
                    
                    let row = self.table.rowController(at: index) as? TableRowController
                    
                    let castMember = chars[index]
                    DispatchQueue.main.async {
                        
                        if let name = castMember.text.split(separator: "-").first {
                            row?.lblName.setText(String(name))
                        }
                        if let imageURL = castMember.icon?.url {
                            row?.imageView.downloadImageFrom(link: imageURL)
                            
                        }
                    }
                    
                }
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        print(rowIndex)
        if let character = characterData?[rowIndex] {
            pushController(withName: "detailIC", context: character)
        }
        
    }

}
