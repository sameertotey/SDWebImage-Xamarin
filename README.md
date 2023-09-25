# Xamarin.iOS binding for SDWebImage

[![NuGet version](https://badge.fury.io/nu/Tnn.SDWebImage.svg)](https://badge.fury.io/nu/Tnn.SDWebImage)

- Native library: [SDWebImage](https://github.com/SDWebImage/SDWebImage)

**Support Net 7.0 for iOS (works with Xcode 15 and iOS 17)**

## Nuget

* `Install-Package Tnn.SDWebImage`
* <https://www.nuget.org/packages/Tnn.SDWebImage>

## Build

* `make`
* Output: `bin/Release/net7.0-ios/SDWebImage-Xamarin.dll`

## Usage

```csharp
// Creeate imageView or loaded from XIB
var imageView = new UIImageView();

// Download or usage cached image by url
imageView.SetImage(NSUrl.FromString(url));
```

## Contribution

Only 2 methods available on Xamarin.iOS to load the image from URL. Contribution to [ApiDefinition.cs](ApiDefinition.cs) are welcome, just send PRs.