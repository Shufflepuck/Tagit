//
//  NSImage Extension.swift
//  TMP
//
//  Created by Francois Levaux on 21.03.17.
//  Copyright © 2017 Francois Levaux. All rights reserved.
//

import Cocoa

extension NSImage {
    
    
    /// Returns a random Desktop Picture image
    func randomBackgroundImage() -> NSImage? {
        do {
            let url = URL(fileURLWithPath: "/Library/Desktop Pictures/")
            
            let desktopPictures = try FileManager.default.contentsOfDirectory(at: url,
                                                                              includingPropertiesForKeys: nil,
                                                                              options: .skipsHiddenFiles)
            
            let randomImage = Int(arc4random_uniform(UInt32(desktopPictures.count)))
            
            return NSImage(byReferencing: desktopPictures[randomImage])
            
        } catch {
            
            NSLog("Error getting the background image")
            return nil
            
        }
    }
}
