//
//  main.swift
//  generate
//
//  Created by hewig on 10/20/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Foundation

// MARK: Constants
let ConstantKeyPrefix = "kFPIconFont"
let GeneratedFileName = "FPIconFontConstants"
let SwiftExt = ".swift"
let ObjcHeaderExt = ".h"
let ObjcImpExt = ".m"


func generate(font: FPIconFont, output: String, isObjc: Bool = false) {
    
    let outputFileName = output + "/" + GeneratedFileName
    
    let glyphs = font.glyphKeys
    var header: NSMutableString = "//This file is generated, you should not edit it directly\n\n"
    var implention: NSMutableString? = nil
    if isObjc {
        header.appendString("#ifndef FontTest_FPFontKitGlyphConstant_h\n");
        header.appendString("#define FontTest_FPFontKitGlyphConstant_h\n\n");
        header.appendString("#import <Foundation/Foundation.h>\n\n");
        
        implention = NSMutableString(string: "#import \"\(GeneratedFileName + ObjcHeaderExt)\"\n\n")
    }
    for glyph in glyphs {
        let glyphName = glyph as NSString
        let array: NSArray = glyphName.capitalizedString.componentsSeparatedByCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        let glyphNameKey = ConstantKeyPrefix + array.componentsJoinedByString("")
        
        if isObjc {
            header.appendFormat("extern NSString * const %@;\n", glyphNameKey)
            implention?.appendFormat("NSString * const %@ = @\"%@\";\n", glyphNameKey, glyphName)
        } else {
            header.appendFormat("let %@ = \"%@\"\n", glyphNameKey, glyphName)
        }
    }
    
    if isObjc {
        header.appendString("\n#endif")
    }
    
    var error: NSError? = nil
    if isObjc {
        header.writeToFile(outputFileName + ObjcHeaderExt, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
        implention?.writeToFile(outputFileName + ObjcImpExt, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    } else {
        header.writeToFile(outputFileName + SwiftExt, atomically: false, encoding: NSUTF8StringEncoding, error: &error)
    }
    if error != nil {
        println("generate error : \(error?.description)")
    }
}

func main(){
    let cli = CommandLine()
    
    let inputOption = StringOption(shortFlag: "i", longFlag: "input-file",
        required: true, helpMessage: "Path to icon font file")
    let outputOption = StringOption(shortFlag: "o", longFlag: "output-path",
        required: false, helpMessage: "Path to output for generated files")
    let objcOption = BoolOption(shortFlag: "c", longFlag: "objc", helpMessage: "Generate ObjC files")
    let helpOption = BoolOption(shortFlag: "h", longFlag: "help", helpMessage: "Print this help message")
    
    cli.addOptions(inputOption, outputOption, objcOption, helpOption)
    let (success, error) = cli.parse()
    if !success {
        println(error!)
        cli.printUsage()
        exit(EX_USAGE)
    }
    
    let font = FPIconFont(path: inputOption.value!)
    var path: String? = nil
    if (outputOption.value != nil) {
        path = outputOption.value?.stringByDeletingPathExtension
    } else {
        path = "."
    }

    generate(font, path!, isObjc: objcOption.value)
}

// MARK: entry point
main()


