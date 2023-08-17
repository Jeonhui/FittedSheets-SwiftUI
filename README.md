# FittedSheets-SwiftUI

## Requirements

![iOSVersion](https://img.shields.io/badge/iOS-13-green.svg) 
![SwiftVersion](https://img.shields.io/badge/Swift-5-green.svg)

### Abstarct
> Using SwiftUI, I found it difficult to lower the minimum version of iOS, one of which was related to sheet.
> So, I looked for related technologies and worked on the project so that gordontucker's fitted sheets could be used in SwiftUI.

## Usage & Example

```swift
struct ContentView: View {
    @State var showFittedSheet: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showFittedSheet.toggle()
            } label: {
                Text("open sheet")
            }
        }
        .fittedSheet(isPresented: $showFittedSheet) {
            Text("opened")
        }
    }
}
```

## Swift Package Manager
- File > Swift Packages > Add Package Dependency
- Add https://github.com/Jeonhui/FitttedSheets-SwiftUI
```asm
https://github.com/Jeonhui/FitttedSheets-SwiftUI
```

## License

FittedSheets-SwiftUI is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.


## Thanks for [gordontucker/FittedSheets](https://github.com/gordontucker/FittedSheets)  
- [MIT License](https://github.com/gordontucker/FittedSheets)

