#1 [!] unable to determine the platform for the `` target.
-> only select ios


#2 Header comment
Xcode header comments config for you
-> go to project
-> to #project-name.xcodeproj -> switch -> show package content
    -> create file
    -> copy -> paste
    -> change file IDETemplateMacros.plist
    -> change for xcodeworkspace
    
-> close xcode 
-> open -> run project
-> oke check it


// Copy IDETemplateMacros.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">


<plist version="1.0">
<dict>
    <key>FILEHEADER</key>
    <string>
//  File: ___FILENAME___. Package: ___PACKAGENAME___
//  🍋‍🟩 Created by (___FULLUSERNAME___/P.Dev) on ___DATE___.
//  Copyright © ___YEAR___ ___FULLUSERNAME___. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project. 
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

    </string>
</dict>
</plist>


