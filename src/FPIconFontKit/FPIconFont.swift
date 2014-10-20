//
//  FPIconFont.swift
//  FPIconFontKit
//
//  Created by hewig on 10/16/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Cocoa

public class FPIconFont: NSObject {

    public let name = ""
    public var glyphKeys : LazyBidirectionalCollection<MapCollectionView<[String : UInt], String>> {
        get {
            return glyphs.keys
        }
    }
    public var glyphCount : Int {
        get {
            return self.glyphs.count;
        }
    }
    
    private let path : String
    private var glyphs = Dictionary<String, UInt>()
    private var cgRontRef : CGFontRef? = nil

    public init(path: String) {
        
        self.path = path
        
        let provider = CGDataProviderCreateWithFilename(path)
        self.cgRontRef = CGFontCreateWithDataProvider(provider)
        
        let count = CGFontGetNumberOfGlyphs(self.cgRontRef)
        let font = CTFontCreateWithGraphicsFont(self.cgRontRef, 12.0, nil, nil) as NSFont
        self.name = font.fontName.capitalizedString
        
        for index in 0..<count {
            
            var glyphName : NSString = CGFontCopyGlyphNameForGlyph(self.cgRontRef, CGGlyph(index)) as NSString
            let rect = font.boundingRectForGlyph(NSGlyph(index))
            if !NSIsEmptyRect(rect) {
                var bezierPath = NSBezierPath()
                bezierPath.moveToPoint(NSPoint(x: -1 * rect.origin.x, y: -1 * rect.origin.y))
                bezierPath.appendBezierPathWithGlyph(NSGlyph(index), inFont: font)
                if !NSIsEmptyRect(bezierPath.bounds) {
                    self.glyphs[glyphName] = index
                }
            }
        }
    }
    public func getImage(name : String, size : Int, color : NSColor) -> NSImage? {
        
        let glyph = self.glyphs[name]
        
        if glyph == nil {
            return nil
        }
        
        let font : NSFont = CTFontCreateWithGraphicsFont(self.cgRontRef, 12.0, nil, nil) as NSFont
        
        var rect = font.boundingRectForGlyph(NSGlyph(glyph!))
        var bezierPath = NSBezierPath()
        bezierPath.moveToPoint(NSPoint(x: -1 * rect.origin.x, y: -1 * rect.origin.y))
        bezierPath.appendBezierPathWithGlyph(NSGlyph(glyph!), inFont: font)
        
        var bitmap = NSBitmapImageRep(bitmapDataPlanes: nil,
                                            pixelsWide: size * 2,
                                            pixelsHigh: size * 2,
                                         bitsPerSample: 8,
                                       samplesPerPixel: 4,
                                              hasAlpha: true,
                                              isPlanar: false,
                                        colorSpaceName: NSCalibratedRGBColorSpace,
                                           bytesPerRow: 0,
                                          bitsPerPixel: 32)
        
        NSGraphicsContext.saveGraphicsState()
        let drawContext = NSGraphicsContext(bitmapImageRep: bitmap!)
        NSGraphicsContext.setCurrentContext(drawContext)
        
        color.set()
        bezierPath.fill()
        
        NSGraphicsContext.restoreGraphicsState()
        let data = bitmap?.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: Dictionary<NSObject, AnyObject>())
        let image = NSImage(data: data!)

        return image
    }
}