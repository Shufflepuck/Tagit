//
//  AppDelegate.swift
//  TMP
//
//  Created by Francois Levaux on 16.03.17.
//  Copyright © 2017 Francois Levaux. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var textToBarcodeValueTransformer: TextToBarcodeValueTransformer?
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        textToBarcodeValueTransformer = TextToBarcodeValueTransformer()
        ValueTransformer.setValueTransformer(textToBarcodeValueTransformer,
                                             forName: NSValueTransformerName(rawValue: "TextToBarcodeValueTransformer"))
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        

        
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

