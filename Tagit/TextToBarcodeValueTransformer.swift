//
//  TextToBarcodeValueTransformer.swift
//  TMP
//
//  Created by Francois Levaux on 21.03.17.
//  Copyright © 2017 Francois Levaux. All rights reserved.
//

import Cocoa

@objc(TextToBarcodeValueTransformer)
class TextToBarcodeValueTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return NSImage.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let value = value as? String else {
            return nil
        }
        
        let data = value.data(using: .ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.applying(transform) {
                let imageRep = NSCIImageRep(ciImage: output)
                let image = NSImage(size: imageRep.size)
                image.addRepresentation(imageRep)
                return image as NSImage
            }
        }
        return nil
        
    }
}
