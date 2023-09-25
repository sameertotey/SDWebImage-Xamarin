SDK=17.0
SRC_FOLDER=SDWebImage-Xcode
NATIVE_RELEASE=5.14.3
NUGET_VERSION=5.14.3.1
SRC_FOLDER=SDWebImage-$(NATIVE_RELEASE)
PROJ_NAME=SDWebImage.xcodeproj

all: prepare xcodebuild build pack clean

prepare: 
	curl -L https://github.com/SDWebImage/SDWebImage/archive/refs/tags/${NATIVE_RELEASE}.zip | tar xz
	
xcodebuild:
	xcodebuild -project $(SRC_FOLDER)/$(PROJ_NAME) build -target "SDWebImage static" -sdk iphonesimulator$(SDK) IPHONEOS_DEPLOYMENT_TARGET=12.0 EXCLUDED_ARCHS="arm64"
	xcodebuild -project $(SRC_FOLDER)/$(PROJ_NAME) build -target "SDWebImage static" -sdk iphoneos$(SDK) IPHONEOS_DEPLOYMENT_TARGET=12.0
	lipo -create $(SRC_FOLDER)/build/Release-iphoneos/libSDWebImage.a $(SRC_FOLDER)/build/Release-iphonesimulator/libSDWebImage.a -output ./libSDWebImage.a
	lipo -info ./libSDWebImage.a
    
build:
	dotnet build -c Release SDWebImage-Xamarin.csproj

pack:
	dotnet pack -c Release SDWebImage-Xamarin.csproj

clean:
	rm -rf obj $(SRC_FOLDER) include
	
nuget:
	nuget push bin/Release/Tnn.SDWebImage.${NUGET_VERSION}.nupkg -Source nuget.org