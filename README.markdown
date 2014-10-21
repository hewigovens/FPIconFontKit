
## 

## 

```
git clone https://github.com/hewigovens/FPIconFontKit.git --recursive
```

```
let iconFont = FPIconFont(path: self.testFontPath)
let image = iconFont.getImage("heart", size: 24, color: NSColor.purpleColor())
```

```
./generate -i ~/Desktop/octicons.ttf -o ~/Desktop/ --objc
```