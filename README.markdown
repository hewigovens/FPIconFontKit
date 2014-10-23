
## Introduction

`FPIconFontKit` is an icon font framework written in Swift trying to make it easier to use fonts like `octicons` in OS X (Yosemite and above) apps. 

## How to use

* Add `FPIconFontKit.xcodeproj` to your project
* Add `FPIconFontKit` as a target dependency
* Link & Copy to `Frameworks` folder

### Swift code
```swift
import FPIconFontKit

let fontPath = NSBundle.mainBundle().pathForResource("octicons", ofType: "ttf")
let font = FPIconFont(path:fontPath!)
        
let image = font.getImage("heart", size: 256, color: NSColor.purpleColor())
dispatch_async(dispatch_get_main_queue(), { () -> Void in
    self.imageView.image = image
})

```

### Objc code

```objc
@import FPIconFontKit;

FPIconFont *font = [[FPIconFont alloc] initWithPath:[[NSBundle mainBundle] pathForResource:@"octicons" ofType:@"ttf"]];
NSImage *image = [font getImage:@"heart" size:128 color:[NSColor purpleColor]];
dispatch_async(dispatch_get_main_queue(), ^{
    self.imageView.image = image;
});

```

you can checkout `src/Demo[Objc]` for more details. `FPIconFontKit` also provides a command line utility to generate header file contains glyph name constants extracting from icons, e.g.
```shell
FPIconFontKit.framework/generate -i ~/Desktop/octicons.ttf -o ~/Desktop/ --objc
```

### Screenshot

![demo-objc](docs/demo_objc.jpg)

## TODO
* Cache
* Cocoa pod
* more icon font testing


## Thanks
* [Github octicons](https://octicons.github.com/)
* [ionicons](http://ionicons.com/)
* [FontAwesomeKit](https://github.com/PrideChung/FontAwesomeKit)
* [iconfontr](https://github.com/shanzi/iconfontr.git)
* [RoboFont](http://doc.robofont.com/)

## License

MIT