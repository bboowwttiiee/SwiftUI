# SwiftUI
Apps or some interesting features developed using SwiftUI framework and sometimes small implementations of UIKit

### 1. Dynamic Island – a new look of notifications on iPhones with Dynamic Island

https://user-images.githubusercontent.com/25493451/190871852-2b0ac5b2-130a-462d-9649-5367b62a0c01.mov

> To simulate notifications, simply create a file with the apns extension, add the following content to it:

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
