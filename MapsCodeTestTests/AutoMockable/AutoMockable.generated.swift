// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import MapsCodeTest
import CoreLocation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class MapViewMock: NSObject, MapView {

    //MARK: - setupProviders

    private(set) var setupProvidersMapProviderRouteDrawableProviderCallsCount = 0
    var setupProvidersMapProviderRouteDrawableProviderCalled: Bool {
        return setupProvidersMapProviderRouteDrawableProviderCallsCount > 0
    }
    private(set) var setupProvidersMapProviderRouteDrawableProviderReceivedArguments: (mapProvider: MapProvider, routeDrawableProvider: RouteDrawable)?
    private(set) var setupProvidersMapProviderRouteDrawableProviderReceivedInvocations: [(mapProvider: MapProvider, routeDrawableProvider: RouteDrawable)] = []
    var setupProvidersMapProviderRouteDrawableProviderClosure: ((MapProvider, RouteDrawable) -> Void)?

    func setupProviders(mapProvider: MapProvider,                      routeDrawableProvider: RouteDrawable) {
        setupProvidersMapProviderRouteDrawableProviderCallsCount += 1
        setupProvidersMapProviderRouteDrawableProviderReceivedArguments = (mapProvider: mapProvider, routeDrawableProvider: routeDrawableProvider)
        setupProvidersMapProviderRouteDrawableProviderReceivedInvocations.append((mapProvider: mapProvider, routeDrawableProvider: routeDrawableProvider))
        setupProvidersMapProviderRouteDrawableProviderClosure?(mapProvider, routeDrawableProvider)
    }

    //MARK: - draw

    private(set) var drawRouteCallsCount = 0
    var drawRouteCalled: Bool {
        return drawRouteCallsCount > 0
    }
    private(set) var drawRouteReceivedRoute: Route?
    private(set) var drawRouteReceivedInvocations: [Route] = []
    var drawRouteClosure: ((Route) -> Void)?

    func draw(route: Route) {
        drawRouteCallsCount += 1
        drawRouteReceivedRoute = route
        drawRouteReceivedInvocations.append(route)
        drawRouteClosure?(route)
    }

    //MARK: - removeRoute

    private(set) var removeRouteCallsCount = 0
    var removeRouteCalled: Bool {
        return removeRouteCallsCount > 0
    }
    var removeRouteClosure: (() -> Void)?

    func removeRoute() {
        removeRouteCallsCount += 1
        removeRouteClosure?()
    }

}
