// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import MapsCodeTest
import CoreLocation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import RxSwift
#elseif os(OSX)
import AppKit
#endif














class AnnotationMock: NSObject, Annotation {
    var coordinate: CLLocationCoordinate2D {
        get { return underlyingCoordinate }
        set(value) { underlyingCoordinate = value }
    }
    var underlyingCoordinate: CLLocationCoordinate2D!
    var delegate: AnnotationDelegate?

    //MARK: - didSelect

    private(set) var didSelectCallsCount = 0
    var didSelectCalled: Bool {
        return didSelectCallsCount > 0
    }
    var didSelectClosure: (() -> Void)?

    func didSelect() {
        didSelectCallsCount += 1
        didSelectClosure?()
    }

    //MARK: - didDeselect

    private(set) var didDeselectCallsCount = 0
    var didDeselectCalled: Bool {
        return didDeselectCallsCount > 0
    }
    var didDeselectClosure: (() -> Void)?

    func didDeselect() {
        didDeselectCallsCount += 1
        didDeselectClosure?()
    }

}
class AnnotationDelegateMock: NSObject, AnnotationDelegate {

    //MARK: - annotationDidSelect

    private(set) var annotationDidSelectIdCoordinateCallsCount = 0
    var annotationDidSelectIdCoordinateCalled: Bool {
        return annotationDidSelectIdCoordinateCallsCount > 0
    }
    private(set) var annotationDidSelectIdCoordinateReceivedArguments: (id: Int, coordinate: CLLocationCoordinate2D)?
    private(set) var annotationDidSelectIdCoordinateReceivedInvocations: [(id: Int, coordinate: CLLocationCoordinate2D)] = []
    var annotationDidSelectIdCoordinateClosure: ((Int, CLLocationCoordinate2D) -> Void)?

    func annotationDidSelect(id: Int, coordinate: CLLocationCoordinate2D) {
        annotationDidSelectIdCoordinateCallsCount += 1
        annotationDidSelectIdCoordinateReceivedArguments = (id: id, coordinate: coordinate)
        annotationDidSelectIdCoordinateReceivedInvocations.append((id: id, coordinate: coordinate))
        annotationDidSelectIdCoordinateClosure?(id, coordinate)
    }

    //MARK: - annotationDidDeselect

    private(set) var annotationDidDeselectCallsCount = 0
    var annotationDidDeselectCalled: Bool {
        return annotationDidDeselectCallsCount > 0
    }
    var annotationDidDeselectClosure: (() -> Void)?

    func annotationDidDeselect() {
        annotationDidDeselectCallsCount += 1
        annotationDidDeselectClosure?()
    }

}
class AnnotationDrawableMock: NSObject, AnnotationDrawable {

    //MARK: - add

    private(set) var addAnnotationsCallsCount = 0
    var addAnnotationsCalled: Bool {
        return addAnnotationsCallsCount > 0
    }
    private(set) var addAnnotationsReceivedAnnotations: [Annotation]?
    private(set) var addAnnotationsReceivedInvocations: [[Annotation]] = []
    var addAnnotationsClosure: (([Annotation]) -> Void)?

    func add(annotations: [Annotation]) {
        addAnnotationsCallsCount += 1
        addAnnotationsReceivedAnnotations = annotations
        addAnnotationsReceivedInvocations.append(annotations)
        addAnnotationsClosure?(annotations)
    }

    //MARK: - removeAnnotations

    private(set) var removeAnnotationsCallsCount = 0
    var removeAnnotationsCalled: Bool {
        return removeAnnotationsCallsCount > 0
    }
    var removeAnnotationsClosure: (() -> Void)?

    func removeAnnotations() {
        removeAnnotationsCallsCount += 1
        removeAnnotationsClosure?()
    }

}
class GetStopUseCaseMock: NSObject, GetStopUseCase {

    //MARK: - execute

    private(set) var executeRequestCallsCount = 0
    var executeRequestCalled: Bool {
        return executeRequestCallsCount > 0
    }
    private(set) var executeRequestReceivedRequest: StopRequest?
    private(set) var executeRequestReceivedInvocations: [StopRequest] = []
    var executeRequestReturnValue: Single<Stop>!
    var executeRequestClosure: ((StopRequest) -> Single<Stop>)?

    func execute(request: StopRequest) -> Single<Stop> {
        executeRequestCallsCount += 1
        executeRequestReceivedRequest = request
        executeRequestReceivedInvocations.append(request)
        return executeRequestClosure.map({ $0(request) }) ?? executeRequestReturnValue
    }

}
class GetTripsUseCaseMock: NSObject, GetTripsUseCase {

    //MARK: - execute

    private(set) var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeReturnValue: Single<[Trip]>!
    var executeClosure: (() -> Single<[Trip]>)?

    func execute() -> Single<[Trip]> {
        executeCallsCount += 1
        return executeClosure.map({ $0() }) ?? executeReturnValue
    }

}
class MapKitAnnotationMock: NSObject, MapKitAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get { return underlyingCoordinate }
        set(value) { underlyingCoordinate = value }
    }
    var underlyingCoordinate: CLLocationCoordinate2D!
    var delegate: AnnotationDelegate?

    //MARK: - didSelect

    private(set) var didSelectCallsCount = 0
    var didSelectCalled: Bool {
        return didSelectCallsCount > 0
    }
    var didSelectClosure: (() -> Void)?

    func didSelect() {
        didSelectCallsCount += 1
        didSelectClosure?()
    }

    //MARK: - didDeselect

    private(set) var didDeselectCallsCount = 0
    var didDeselectCalled: Bool {
        return didDeselectCallsCount > 0
    }
    var didDeselectClosure: (() -> Void)?

    func didDeselect() {
        didDeselectCallsCount += 1
        didDeselectClosure?()
    }

}
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
    private(set) var drawRouteReceivedInvocations: [String?] = []
    var drawRouteClosure: ((String?) -> Void)?

    func draw(route polyLineString: String?) {
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

    //MARK: - getStop

    private(set) var getStopStopIDCallsCount = 0
    var getStopStopIDCalled: Bool {
        return getStopStopIDCallsCount > 0
    }
    private(set) var getStopStopIDReceivedStopID: Int?
    private(set) var getStopStopIDReceivedInvocations: [Int] = []
    var getStopStopIDClosure: ((Int) -> Void)?

    func getStop(stopID: Int) {
        getStopStopIDCallsCount += 1
        getStopStopIDReceivedStopID = stopID
        getStopStopIDReceivedInvocations.append(stopID)
        getStopStopIDClosure?(stopID)
    }

    //MARK: - map

    private(set) var mapTripPointsOriginDestinationAnnotationDelegateCallsCount = 0
    var mapTripPointsOriginDestinationAnnotationDelegateCalled: Bool {
        return mapTripPointsOriginDestinationAnnotationDelegateCallsCount > 0
    }
    private(set) var mapTripPointsOriginDestinationAnnotationDelegateReceivedArguments: (tripPoints: [TripStop], origin: TripPoint, destination: TripPoint, annotationDelegate: AnnotationDelegate)?
    private(set) var mapTripPointsOriginDestinationAnnotationDelegateReceivedInvocations: [(tripPoints: [TripStop], origin: TripPoint, destination: TripPoint, annotationDelegate: AnnotationDelegate)] = []
    var mapTripPointsOriginDestinationAnnotationDelegateClosure: (([TripStop], TripPoint, TripPoint, AnnotationDelegate) -> Void)?

    func map(tripPoints: [TripStop],           origin: TripPoint,           destination: TripPoint,           annotationDelegate: AnnotationDelegate) {
        mapTripPointsOriginDestinationAnnotationDelegateCallsCount += 1
        mapTripPointsOriginDestinationAnnotationDelegateReceivedArguments = (tripPoints: tripPoints, origin: origin, destination: destination, annotationDelegate: annotationDelegate)
        mapTripPointsOriginDestinationAnnotationDelegateReceivedInvocations.append((tripPoints: tripPoints, origin: origin, destination: destination, annotationDelegate: annotationDelegate))
        mapTripPointsOriginDestinationAnnotationDelegateClosure?(tripPoints, origin, destination, annotationDelegate)
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

    //MARK: - didFailLoadingTrips

    private(set) var didFailLoadingTripsErrorCallsCount = 0
    var didFailLoadingTripsErrorCalled: Bool {
        return didFailLoadingTripsErrorCallsCount > 0
    }
    private(set) var didFailLoadingTripsErrorReceivedError: Error?
    private(set) var didFailLoadingTripsErrorReceivedInvocations: [Error] = []
    var didFailLoadingTripsErrorClosure: ((Error) -> Void)?

    func didFailLoadingTrips(error: Error) {
        didFailLoadingTripsErrorCallsCount += 1
        didFailLoadingTripsErrorReceivedError = error
        didFailLoadingTripsErrorReceivedInvocations.append(error)
        didFailLoadingTripsErrorClosure?(error)
    }

    //MARK: - didLoad

    private(set) var didLoadStopCallsCount = 0
    var didLoadStopCalled: Bool {
        return didLoadStopCallsCount > 0
    }
    private(set) var didLoadStopReceivedStop: Stop?
    private(set) var didLoadStopReceivedInvocations: [Stop] = []
    var didLoadStopClosure: ((Stop) -> Void)?

    func didLoad(stop: Stop) {
        didLoadStopCallsCount += 1
        didLoadStopReceivedStop = stop
        didLoadStopReceivedInvocations.append(stop)
        didLoadStopClosure?(stop)
    }

    //MARK: - didFailLoadingStop

    private(set) var didFailLoadingStopErrorCallsCount = 0
    var didFailLoadingStopErrorCalled: Bool {
        return didFailLoadingStopErrorCallsCount > 0
    }
    private(set) var didFailLoadingStopErrorReceivedError: Error?
    private(set) var didFailLoadingStopErrorReceivedInvocations: [Error] = []
    var didFailLoadingStopErrorClosure: ((Error) -> Void)?

    func didFailLoadingStop(error: Error) {
        didFailLoadingStopErrorCallsCount += 1
        didFailLoadingStopErrorReceivedError = error
        didFailLoadingStopErrorReceivedInvocations.append(error)
        didFailLoadingStopErrorClosure?(error)
    }

    //MARK: - trip

    private(set) var tripAnnotationsCallsCount = 0
    var tripAnnotationsCalled: Bool {
        return tripAnnotationsCallsCount > 0
    }
    private(set) var tripAnnotationsReceivedAnnotations: [Annotation]?
    private(set) var tripAnnotationsReceivedInvocations: [[Annotation]] = []
    var tripAnnotationsClosure: (([Annotation]) -> Void)?

    func trip(annotations: [Annotation]) {
        tripAnnotationsCallsCount += 1
        tripAnnotationsReceivedAnnotations = annotations
        tripAnnotationsReceivedInvocations.append(annotations)
        tripAnnotationsClosure?(annotations)
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

    //MARK: - select

    private(set) var selectTripCallsCount = 0
    var selectTripCalled: Bool {
        return selectTripCallsCount > 0
    }
    private(set) var selectTripReceivedTrip: Trip?
    private(set) var selectTripReceivedInvocations: [Trip] = []
    var selectTripClosure: ((Trip) -> Void)?

    func select(trip: Trip) {
        selectTripCallsCount += 1
        selectTripReceivedTrip = trip
        selectTripReceivedInvocations.append(trip)
        selectTripClosure?(trip)
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

    private(set) var showErrorCallsCount = 0
    var showErrorCalled: Bool {
        return showErrorCallsCount > 0
    }
    private(set) var showErrorReceivedError: String?
    private(set) var showErrorReceivedInvocations: [String] = []
    var showErrorClosure: ((String) -> Void)?

    func show(error: String) {
        showErrorCallsCount += 1
        showErrorReceivedError = error
        showErrorReceivedInvocations.append(error)
        showErrorClosure?(error)
    }

    //MARK: - showLoading

    private(set) var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    private(set) var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

    //MARK: - show

    private(set) var showRouteDriverNameDescriptionCallsCount = 0
    var showRouteDriverNameDescriptionCalled: Bool {
        return showRouteDriverNameDescriptionCallsCount > 0
    }
    private(set) var showRouteDriverNameDescriptionReceivedArguments: (route: String, driverName: String, description: String)?
    private(set) var showRouteDriverNameDescriptionReceivedInvocations: [(route: String, driverName: String, description: String)] = []
    var showRouteDriverNameDescriptionClosure: ((String, String, String) -> Void)?

    func show(route: String,            driverName: String,            description: String) {
        showRouteDriverNameDescriptionCallsCount += 1
        showRouteDriverNameDescriptionReceivedArguments = (route: route, driverName: driverName, description: description)
        showRouteDriverNameDescriptionReceivedInvocations.append((route: route, driverName: driverName, description: description))
        showRouteDriverNameDescriptionClosure?(route, driverName, description)
    }

    //MARK: - add

    private(set) var addPointsCallsCount = 0
    var addPointsCalled: Bool {
        return addPointsCallsCount > 0
    }
    private(set) var addPointsReceivedPoints: [Annotation]?
    private(set) var addPointsReceivedInvocations: [[Annotation]] = []
    var addPointsClosure: (([Annotation]) -> Void)?

    func add(points: [Annotation]) {
        addPointsCallsCount += 1
        addPointsReceivedPoints = points
        addPointsReceivedInvocations.append(points)
        addPointsClosure?(points)
    }

}
