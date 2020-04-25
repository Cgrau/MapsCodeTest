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














class MapProviderMock: NSObject, MapProvider {
    var mapView: UIView {
        get { return underlyingMapView }
        set(value) { underlyingMapView = value }
    }
    var underlyingMapView: UIView!

}
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
class RouteDrawableMock: NSObject, RouteDrawable {

    //MARK: - draw

    private(set) var drawRouteCallsCount = 0
    var drawRouteCalled: Bool {
        return drawRouteCallsCount > 0
    }
    private(set) var drawRouteReceivedPolyLineString: String?
    private(set) var drawRouteReceivedInvocations: [String] = []
    var drawRouteClosure: ((String) -> Void)?

    func draw(route polyLineString: String) {
        drawRouteCallsCount += 1
        drawRouteReceivedPolyLineString = polyLineString
        drawRouteReceivedInvocations.append(polyLineString)
        drawRouteClosure?(polyLineString)
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
class TripListInteractorMock: NSObject, TripListInteractor {
    var delegate: TripListInteractorDelegate?

    //MARK: - getTrips

    private(set) var getTripsCallsCount = 0
    var getTripsCalled: Bool {
        return getTripsCallsCount > 0
    }
    var getTripsClosure: (() -> Void)?

    func getTrips() {
        getTripsCallsCount += 1
        getTripsClosure?()
    }

}
class TripListInteractorDelegateMock: NSObject, TripListInteractorDelegate {

    //MARK: - didLoad

    private(set) var didLoadTripsCallsCount = 0
    var didLoadTripsCalled: Bool {
        return didLoadTripsCallsCount > 0
    }
    private(set) var didLoadTripsReceivedTrips: [Trip]?
    private(set) var didLoadTripsReceivedInvocations: [[Trip]] = []
    var didLoadTripsClosure: (([Trip]) -> Void)?

    func didLoad(trips: [Trip]) {
        didLoadTripsCallsCount += 1
        didLoadTripsReceivedTrips = trips
        didLoadTripsReceivedInvocations.append(trips)
        didLoadTripsClosure?(trips)
    }

    //MARK: - didFailLoaingTrips

    private(set) var didFailLoaingTripsErrorCallsCount = 0
    var didFailLoaingTripsErrorCalled: Bool {
        return didFailLoaingTripsErrorCallsCount > 0
    }
    private(set) var didFailLoaingTripsErrorReceivedError: Error?
    private(set) var didFailLoaingTripsErrorReceivedInvocations: [Error] = []
    var didFailLoaingTripsErrorClosure: ((Error) -> Void)?

    func didFailLoaingTrips(error: Error) {
        didFailLoaingTripsErrorCallsCount += 1
        didFailLoaingTripsErrorReceivedError = error
        didFailLoaingTripsErrorReceivedInvocations.append(error)
        didFailLoaingTripsErrorClosure?(error)
    }

}
class TripListNavigatorMock: NSObject, TripListNavigator {

    //MARK: - navigate

    private(set) var navigateCallsCount = 0
    var navigateCalled: Bool {
        return navigateCallsCount > 0
    }
    var navigateClosure: (() -> Void)?

    func navigate() {
        navigateCallsCount += 1
        navigateClosure?()
    }

}
class TripListPresenterMock: NSObject, TripListPresenter {
    var ui: TripListUI?

    //MARK: - didLoad

    private(set) var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

}
class TripListUIMock: NSObject, TripListUI {

    //MARK: - show

    private(set) var showTripsCallsCount = 0
    var showTripsCalled: Bool {
        return showTripsCallsCount > 0
    }
    private(set) var showTripsReceivedTrips: [Trip]?
    private(set) var showTripsReceivedInvocations: [[Trip]] = []
    var showTripsClosure: (([Trip]) -> Void)?

    func show(trips: [Trip]) {
        showTripsCallsCount += 1
        showTripsReceivedTrips = trips
        showTripsReceivedInvocations.append(trips)
        showTripsClosure?(trips)
    }

    //MARK: - show

    private(set) var showErrorMessageCallsCount = 0
    var showErrorMessageCalled: Bool {
        return showErrorMessageCallsCount > 0
    }
    private(set) var showErrorMessageReceivedErrorMessage: String?
    private(set) var showErrorMessageReceivedInvocations: [String] = []
    var showErrorMessageClosure: ((String) -> Void)?

    func show(errorMessage: String) {
        showErrorMessageCallsCount += 1
        showErrorMessageReceivedErrorMessage = errorMessage
        showErrorMessageReceivedInvocations.append(errorMessage)
        showErrorMessageClosure?(errorMessage)
    }

}
