//
//  main.swift
//  generate
//
//  Created by hewig on 10/20/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Foundation

let HeaderKeyPrefix = "kFPIconFont"
let HeaderFileName = "FPIconFontConstants.swift"

func usage(){
    println("Usage: generate /path/to/iconfont /output/path")
}

func generate(font : FPIconFont, output : String) {
    
    let outputFileName = output + "/" + HeaderFileName
    
    let glyphs = font.glyphKeys
    var header : NSMutableString = "//This file is generated, you should not edit it directly\n\n"
    for glyph in glyphs {
        let glyphName = glyph as NSString
        let array : NSArray = glyphName.capitalizedString.componentsSeparatedByCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        let glyphNameKey = HeaderKeyPrefix + array.componentsJoinedByString("")
        
        header.appendFormat("let %@ = \"%@\"\n", glyphNameKey, glyphName)
    }
    
    var error : NSError? = nil
    if !header.writeToFile(outputFileName, atomically: false, encoding: NSUTF8StringEncoding, error: &error) {
        if error != nil {
            println("generate error : \(error?.description)")
        }
    }
}

func main(arguments:[AnyObject]){
    if arguments.count <= 1 {
        usage()
    } else {
        let iconPath = arguments[1] as String
        
        var outputPath : String? = nil
        if arguments.count >= 2 {
            outputPath = arguments[2] as? String
        } else {
            outputPath = "."
        }
        
        let iconFont = FPIconFont(path: iconPath)
        generate(iconFont, outputPath!)
    }
}

let arguments = NSProcessInfo.processInfo().arguments
main(arguments)