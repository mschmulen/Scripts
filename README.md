Scripts
===

### Autocomplete Git commands and Branch names

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/Scripts/.git-completion.bash

- update ~/.bash_profile
	
```
## git autocomplete
if [ -f ~/Scripts/.git-completion.bash ]; then
  . ~/Scripts/.git-completion.bash
fi
```

## Misc Brew Installs



- node 

```brew install node```


- SourceKitten: framework and command line tool for interacting with SourceKit.
https://github.com/jpsim/SourceKitten

`
brew install sourcekitten
`


#### Installs TODO

#### https://github.com/realm/SwiftLint
```
brew install swiftlint

```

##### https://github.com/yonaskolb/XcodeGen

````
$ brew tap yonaskolb/XcodeGen https://github.com/yonaskolb/XcodeGen.git
$ brew install XcodeGe
````

## Machine Apps

- chrome
- slack
- textMate
- Xcode
- Android Studio [https://developer.android.com/studio/](https://developer.android.com/studio/)

- brew: https://brew.sh/

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Carthage 

- CocoaPods 

```
sudo gem install cocoapods ?? vs brew 
```

- ngrok

https://ngrok.com/download
cp ngrok /usr/local/bin/

- docker
https://www.docker.com/community-edition#/mac

- Git config

```
ssh-keygen -t rsa -b 4096 -C "matt.schmulen@gmail.com"

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

git config --global user.email
```

- fastlane [https://docs.fastlane.tools/getting-started/ios/running-tests/](https://docs.fastlane.tools/getting-started/ios/running-tests/)

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

configure snapshot
`fastlane snapshot init`

update:
To update fastlane, just run [sudo] bundle update fastlane


### Other Tools

- Convert JSON to Swift codable models [https://github.com/nixzhu/Baby](https://github.com/nixzhu/Baby)

### Misc Macbook configuration

Touch Bar Configuration

Touch ID:

https://support.apple.com/guide/?platform=mac&product=mac-help&vanityname=use-touch-id-on-your-mac&version=10.13&locale=en_US&topicid=MCHL16FBF90A&type=ddm&platformOSVersion=10.13

## configs

### .bashProfile

colors

alias DeleteDerivedData='rm -rf ~/Library/Developer/Xcode/DerivedData'

### github ssh keys


## fastlane notes

fastlane test

https://github.com/fastlane/fastlane/issues/1678

```
xcrun xcodebuild -workspace './Yack.xcworkspace' -scheme 'Snapshot' test
```

```
xcrun xcodebuild -scheme 'Yack' -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.2' test
```

