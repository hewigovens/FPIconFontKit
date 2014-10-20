//
//  FPIconFont.swift
//  FPIconFontKit
//
//  Created by hewig on 10/16/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Cocoa

class FPIconGlyph: NSObject{
    let name : String = ""
    let code : String = ""
    let bezierPath : NSBezierPath? = nil
}

class FPIconFont: NSObject {

    let fontPath : String
    let fontName : String
    let glyphs : Array<FPIconGlyph> = []
    init(fontName name : String, fontPath path: String) {
        fontName = name
        fontPath = path
        
        let url = CFURLCreateWithString(nil, path, nil)
        let provider = CGDataProviderCreateWithURL(url)
        let fontRef = CGFontCreateWithDataProvider(provider)
        
    }
    func getImage(name : String, size : Int, color : NSColor) -> NSImage? {
        return nil
    }
}

extension NSImageView {
    func setImageWithIconFont(name : String, size : Int, color : NSColor){
        
    }
}