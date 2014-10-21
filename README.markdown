
## Introduction

`FPIconFontKit` is an OS X framework written in Swift trying to make it easier to use icon fonts like `octicons`.

## How to use

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

```
@import FPIconFontKit;

FPIconFont *font = [[FPIconFont alloc] initWithPath:[[NSBundle mainBundle] pathForResource:@"octicons" ofType:@"ttf"]];
    NSImage *image = [font getImage:@"heart" size:128 color:[NSColor purpleColor]];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });

```

you can checkout `src/Demo[Objc]` for more details.


### Generate string constants for use
```shell
FPIconFontKit.framework/generate -i ~/Desktop/octicons.ttf -o ~/Desktop/ --objc
```

## TOOD