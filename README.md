# MapsCodeTest

Application written in Swift and designed using clean architecture. Map based app showing routes from an endpoint and display them on demand.

:warning: Please run "pod install" in order to get all the dependencies.

## Application overview :rocket:

### Map TripList & Selecting Route 
<img src="https://github.com/Cgrau/assets/blob/master/MapsCodeTest/TripList.png" width="225" height="487"><img src="https://github.com/Cgrau/assets/blob/master/MapsCodeTest/SelectTrip.png" width="225" height="487">

Once the application loads, you get all trips. In this scene you can select any of them to see the route in the map and all the stops. Also the map will be centered on the selected route

When you select one of them you will see which one is selected in the top-left corner.

### Stop selection
<img src="https://github.com/Cgrau/assets/blob/master/MapsCodeTest/SelectStop.png" width="225" height="487">

When one Stop Point is select an it will display information regarding it in the top-right corner.

### Contact Form
<img src="https://github.com/Cgrau/assets/blob/master/MapsCodeTest/ContactForm.png" width="225" height="487">

In case of finding any issue, there's a contact form to let us know what happens :smiley:

## Architecture and implementation details

The application is written in Swift and designed using VIPER :heart: architecture. The functionality is divided in different scenes:

- TripList scene

Represents the core of the application. Here is where you can see the map and a list of trips.

- ContactForm scene

Show the contact form to report any issue.

## Third party libraries

Main:
- Sourcery - https://github.com/krzysztofzablocki/Sourcery
- SnapKit - https://github.com/SnapKit/SnapKit
- RxSwift & RxCocoa - https://github.com/ReactiveX/RxSwift
- Moya & Moya/RxSwift https://github.com/Moya/Moya
- SwiftLint https://github.com/realm/SwiftLint

Test:
- RxBlocking - https://github.com/ReactiveX/RxSwift/tree/master/RxBlocking
- OHHTTPStubs - https://github.com/AliSoftware/OHHTTPStubs
- Swift Snapshot Testing - https://github.com/pointfreeco/swift-snapshot-testing

## Support & contact

You can contact me via e-mail: carles828@gmail.com