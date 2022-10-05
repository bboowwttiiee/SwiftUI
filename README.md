# SwiftUI
Apps or some interesting features developed using SwiftUI framework and sometimes small implementations of UIKit

### 1. Dynamic Island – a new look of notifications on iPhones with Dynamic Island

https://user-images.githubusercontent.com/25493451/190871852-2b0ac5b2-130a-462d-9649-5367b62a0c01.mov

> To simulate notifications, simply create a file with the *.apns* extension, add the following content to it:

    {
        "aps" : {
            "alert" : {
                "title" : "Push Notification's",
                "body" : "In-app Notification using Dynamic Island!!!"
            },
            "badge" : 0
        },
        "Simulator Target Bundle" : "com.bowtie.Dynamic-Island"
    }

### 2. Landmarks – an app for discovering and sharing the places you love

https://user-images.githubusercontent.com/25493451/190873140-fd4f5a43-4829-46aa-adfe-2a6138fcb9f3.mp4

### 3. ShapeMorphingAnimation – an app that shows shape morphing animation that was created using Canvas and Filters

https://user-images.githubusercontent.com/25493451/194049170-20754be9-c80b-4e9d-8dfa-bf801db4c817.mov
