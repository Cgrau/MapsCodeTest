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














class AlertViewDelegateMock: NSObject, AlertViewDelegate {

    //MARK: - willShow

    private(set) var willShowAlertCallsCount = 0
    var willShowAlertCalled: Bool {
        return willShowAlertCallsCount > 0
    }
    private(set) var willShowAlertReceivedAlert: UIView?
    private(set) var willShowAlertReceivedInvocations: [UIView] = []
    var willShowAlertClosure: ((UIView) -> Void)?

    func willShow(alert: UIView) {
        willShowAlertCallsCount += 1
        willShowAlertReceivedAlert = alert
        willShowAlertReceivedInvocations.append(alert)
        willShowAlertClosure?(alert)
    }

    //MARK: - willRemove

    private(set) var willRemoveAlertCallsCount = 0
    var willRemoveAlertCalled: Bool {
        return willRemoveAlertCallsCount > 0
    }
    private(set) var willRemoveAlertReceivedAlert: UIView?
    private(set) var willRemoveAlertReceivedInvocations: [UIView] = []
    var willRemoveAlertClosure: ((UIView) -> Void)?

    func willRemove(alert: UIView) {
        willRemoveAlertCallsCount += 1
        willRemoveAlertReceivedAlert = alert
        willRemoveAlertReceivedInvocations.append(alert)
        willRemoveAlertClosure?(alert)
    }

}
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
class BadgeNumberUpdaterMock: NSObject, BadgeNumberUpdater {

    //MARK: - updateBadge

    private(set) var updateBadgeAtCallsCount = 0
    var updateBadgeAtCalled: Bool {
        return updateBadgeAtCallsCount > 0
    }
    private(set) var updateBadgeAtReceivedValue: Int?
    private(set) var updateBadgeAtReceivedInvocations: [Int] = []
    var updateBadgeAtClosure: ((Int) -> Void)?

    func updateBadge(at value: Int) {
        updateBadgeAtCallsCount += 1
        updateBadgeAtReceivedValue = value
        updateBadgeAtReceivedInvocations.append(value)
        updateBadgeAtClosure?(value)
    }

}
class FormInteractorMock: NSObject, FormInteractor {
    var delegate: FormInteractorDelegate?

    //MARK: - getTimeAndDate

    private(set) var getTimeAndDateCallsCount = 0
    var getTimeAndDateCalled: Bool {
        return getTimeAndDateCallsCount > 0
    }
    var getTimeAndDateClosure: (() -> Void)?

    func getTimeAndDate() {
        getTimeAndDateCallsCount += 1
        getTimeAndDateClosure?()
    }

    //MARK: - save

    private(set) var saveDataCallsCount = 0
    var saveDataCalled: Bool {
        return saveDataCallsCount > 0
    }
    private(set) var saveDataReceivedData: FormInfo?
    private(set) var saveDataReceivedInvocations: [FormInfo] = []
    var saveDataClosure: ((FormInfo) -> Void)?

    func save(data: FormInfo) {
        saveDataCallsCount += 1
        saveDataReceivedData = data
        saveDataReceivedInvocations.append(data)
        saveDataClosure?(data)
    }

}
class FormInteractorDelegateMock: NSObject, FormInteractorDelegate {

    //MARK: - didLoad

    private(set) var didLoadTimeDateCallsCount = 0
    var didLoadTimeDateCalled: Bool {
        return didLoadTimeDateCallsCount > 0
    }
    private(set) var didLoadTimeDateReceivedArguments: (time: String, date: String)?
    private(set) var didLoadTimeDateReceivedInvocations: [(time: String, date: String)] = []
    var didLoadTimeDateClosure: ((String, String) -> Void)?

    func didLoad(time: String, date: String) {
        didLoadTimeDateCallsCount += 1
        didLoadTimeDateReceivedArguments = (time: time, date: date)
        didLoadTimeDateReceivedInvocations.append((time: time, date: date))
        didLoadTimeDateClosure?(time, date)
    }

    //MARK: - didFailLoadingDateAndTime

    private(set) var didFailLoadingDateAndTimeMessageCallsCount = 0
    var didFailLoadingDateAndTimeMessageCalled: Bool {
        return didFailLoadingDateAndTimeMessageCallsCount > 0
    }
    private(set) var didFailLoadingDateAndTimeMessageReceivedMessage: String?
    private(set) var didFailLoadingDateAndTimeMessageReceivedInvocations: [String] = []
    var didFailLoadingDateAndTimeMessageClosure: ((String) -> Void)?

    func didFailLoadingDateAndTime(message: String) {
        didFailLoadingDateAndTimeMessageCallsCount += 1
        didFailLoadingDateAndTimeMessageReceivedMessage = message
        didFailLoadingDateAndTimeMessageReceivedInvocations.append(message)
        didFailLoadingDateAndTimeMessageClosure?(message)
    }

    //MARK: - didSaveData

    private(set) var didSaveDataMessageCallsCount = 0
    var didSaveDataMessageCalled: Bool {
        return didSaveDataMessageCallsCount > 0
    }
    private(set) var didSaveDataMessageReceivedMessage: String?
    private(set) var didSaveDataMessageReceivedInvocations: [String] = []
    var didSaveDataMessageClosure: ((String) -> Void)?

    func didSaveData(message: String) {
        didSaveDataMessageCallsCount += 1
        didSaveDataMessageReceivedMessage = message
        didSaveDataMessageReceivedInvocations.append(message)
        didSaveDataMessageClosure?(message)
    }

    //MARK: - didFailSavingData

    private(set) var didFailSavingDataErrorCallsCount = 0
    var didFailSavingDataErrorCalled: Bool {
        return didFailSavingDataErrorCallsCount > 0
    }
    private(set) var didFailSavingDataErrorReceivedError: String?
    private(set) var didFailSavingDataErrorReceivedInvocations: [String] = []
    var didFailSavingDataErrorClosure: ((String) -> Void)?

    func didFailSavingData(error: String) {
        didFailSavingDataErrorCallsCount += 1
        didFailSavingDataErrorReceivedError = error
        didFailSavingDataErrorReceivedInvocations.append(error)
        didFailSavingDataErrorClosure?(error)
    }

    //MARK: - display

    private(set) var displayCounterCallsCount = 0
    var displayCounterCalled: Bool {
        return displayCounterCallsCount > 0
    }
    private(set) var displayCounterReceivedCounter: Int?
    private(set) var displayCounterReceivedInvocations: [Int] = []
    var displayCounterClosure: ((Int) -> Void)?

    func display(counter: Int) {
        displayCounterCallsCount += 1
        displayCounterReceivedCounter = counter
        displayCounterReceivedInvocations.append(counter)
        displayCounterClosure?(counter)
    }

}
class FormNavigatorMock: NSObject, FormNavigator {

    //MARK: - dismiss

    private(set) var dismissCallsCount = 0
    var dismissCalled: Bool {
        return dismissCallsCount > 0
    }
    var dismissClosure: (() -> Void)?

    func dismiss() {
        dismissCallsCount += 1
        dismissClosure?()
    }

}
class FormPresenterMock: NSObject, FormPresenter {
    var ui: FormUI?

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

    //MARK: - closeButtonAction

    private(set) var closeButtonActionCallsCount = 0
    var closeButtonActionCalled: Bool {
        return closeButtonActionCallsCount > 0
    }
    var closeButtonActionClosure: (() -> Void)?

    func closeButtonAction() {
        closeButtonActionCallsCount += 1
        closeButtonActionClosure?()
    }

    //MARK: - saveButtonAction

    private(set) var saveButtonActionFullNameEmailPhoneNumberDateTimeCallsCount = 0
    var saveButtonActionFullNameEmailPhoneNumberDateTimeCalled: Bool {
        return saveButtonActionFullNameEmailPhoneNumberDateTimeCallsCount > 0
    }
    private(set) var saveButtonActionFullNameEmailPhoneNumberDateTimeReceivedArguments: (fullName: String?, email: String?, phoneNumber: String?, date: String?, time: String?)?
    private(set) var saveButtonActionFullNameEmailPhoneNumberDateTimeReceivedInvocations: [(fullName: String?, email: String?, phoneNumber: String?, date: String?, time: String?)] = []
    var saveButtonActionFullNameEmailPhoneNumberDateTimeClosure: ((String?, String?, String?, String?, String?) -> Void)?

    func saveButtonAction(fullName: String?,                        email: String?,                        phoneNumber: String?,                        date: String?,                        time: String?) {
        saveButtonActionFullNameEmailPhoneNumberDateTimeCallsCount += 1
        saveButtonActionFullNameEmailPhoneNumberDateTimeReceivedArguments = (fullName: fullName, email: email, phoneNumber: phoneNumber, date: date, time: time)
        saveButtonActionFullNameEmailPhoneNumberDateTimeReceivedInvocations.append((fullName: fullName, email: email, phoneNumber: phoneNumber, date: date, time: time))
        saveButtonActionFullNameEmailPhoneNumberDateTimeClosure?(fullName, email, phoneNumber, date, time)
    }

}
class FormUIMock: NSObject, FormUI {

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

    //MARK: - display

    private(set) var displayTimeDateCallsCount = 0
    var displayTimeDateCalled: Bool {
        return displayTimeDateCallsCount > 0
    }
    private(set) var displayTimeDateReceivedArguments: (time: String, date: String)?
    private(set) var displayTimeDateReceivedInvocations: [(time: String, date: String)] = []
    var displayTimeDateClosure: ((String, String) -> Void)?

    func display(time: String, date: String) {
        displayTimeDateCallsCount += 1
        displayTimeDateReceivedArguments = (time: time, date: date)
        displayTimeDateReceivedInvocations.append((time: time, date: date))
        displayTimeDateClosure?(time, date)
    }

    //MARK: - showSuccess

    private(set) var showSuccessMessageCompletionCallsCount = 0
    var showSuccessMessageCompletionCalled: Bool {
        return showSuccessMessageCompletionCallsCount > 0
    }
    private(set) var showSuccessMessageCompletionReceivedArguments: (message: String, completion: (() -> Void)?)?
    private(set) var showSuccessMessageCompletionReceivedInvocations: [(message: String, completion: (() -> Void)?)] = []
    var showSuccessMessageCompletionClosure: ((String, (() -> Void)?) -> Void)?

    func showSuccess(message: String, completion: (() -> Void)?) {
        showSuccessMessageCompletionCallsCount += 1
        showSuccessMessageCompletionReceivedArguments = (message: message, completion: completion)
        showSuccessMessageCompletionReceivedInvocations.append((message: message, completion: completion))
        showSuccessMessageCompletionClosure?(message, completion)
    }

    //MARK: - showError

    private(set) var showErrorMessageCallsCount = 0
    var showErrorMessageCalled: Bool {
        return showErrorMessageCallsCount > 0
    }
    private(set) var showErrorMessageReceivedMessage: String?
    private(set) var showErrorMessageReceivedInvocations: [String] = []
    var showErrorMessageClosure: ((String) -> Void)?

    func showError(message: String) {
        showErrorMessageCallsCount += 1
        showErrorMessageReceivedMessage = message
        showErrorMessageReceivedInvocations.append(message)
        showErrorMessageClosure?(message)
    }

}
class FormViewDelegateMock: NSObject, FormViewDelegate {

    //MARK: - didTapCloseButton

    private(set) var didTapCloseButtonCallsCount = 0
    var didTapCloseButtonCalled: Bool {
        return didTapCloseButtonCallsCount > 0
    }
    var didTapCloseButtonClosure: (() -> Void)?

    func didTapCloseButton() {
        didTapCloseButtonCallsCount += 1
        didTapCloseButtonClosure?()
    }

    //MARK: - didTapSaveButton

    private(set) var didTapSaveButtonFullNameEmailPhoneNumberDateTimeCallsCount = 0
    var didTapSaveButtonFullNameEmailPhoneNumberDateTimeCalled: Bool {
        return didTapSaveButtonFullNameEmailPhoneNumberDateTimeCallsCount > 0
    }
    private(set) var didTapSaveButtonFullNameEmailPhoneNumberDateTimeReceivedArguments: (fullName: String?, email: String?, phoneNumber: String?, date: String?, time: String?)?
    private(set) var didTapSaveButtonFullNameEmailPhoneNumberDateTimeReceivedInvocations: [(fullName: String?, email: String?, phoneNumber: String?, date: String?, time: String?)] = []
    var didTapSaveButtonFullNameEmailPhoneNumberDateTimeClosure: ((String?, String?, String?, String?, String?) -> Void)?

    func didTapSaveButton(fullName: String?,                        email: String?,                        phoneNumber: String?,                        date: String?,                        time: String?) {
        didTapSaveButtonFullNameEmailPhoneNumberDateTimeCallsCount += 1
        didTapSaveButtonFullNameEmailPhoneNumberDateTimeReceivedArguments = (fullName: fullName, email: email, phoneNumber: phoneNumber, date: date, time: time)
        didTapSaveButtonFullNameEmailPhoneNumberDateTimeReceivedInvocations.append((fullName: fullName, email: email, phoneNumber: phoneNumber, date: date, time: time))
        didTapSaveButtonFullNameEmailPhoneNumberDateTimeClosure?(fullName, email, phoneNumber, date, time)
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
class LocalStorageMock: NSObject, LocalStorage {

    //MARK: - store

    private(set) var storeValueCallsCount = 0
    var storeValueCalled: Bool {
        return storeValueCallsCount > 0
    }
    private(set) var storeValueReceivedValue: String?
    private(set) var storeValueReceivedInvocations: [String] = []
    var storeValueClosure: ((String) -> Void)?

    func store(value: String) {
        storeValueCallsCount += 1
        storeValueReceivedValue = value
        storeValueReceivedInvocations.append(value)
        storeValueClosure?(value)
    }

    //MARK: - getSavedItemsCount

    private(set) var getSavedItemsCountCallsCount = 0
    var getSavedItemsCountCalled: Bool {
        return getSavedItemsCountCallsCount > 0
    }
    var getSavedItemsCountReturnValue: Int!
    var getSavedItemsCountClosure: (() -> Int)?

    func getSavedItemsCount() -> Int {
        getSavedItemsCountCallsCount += 1
        return getSavedItemsCountClosure.map({ $0() }) ?? getSavedItemsCountReturnValue
    }

    //MARK: - clear

    private(set) var clearCallsCount = 0
    var clearCalled: Bool {
        return clearCallsCount > 0
    }
    var clearClosure: (() -> Void)?

    func clear() {
        clearCallsCount += 1
        clearClosure?()
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
class StopInfoAlertProviderMock: NSObject, StopInfoAlertProvider {
    var viewDelegate: AlertViewDelegate?

    //MARK: - showAlert

    private(set) var showAlertUserNameAddressPriceStopTimePaidCallsCount = 0
    var showAlertUserNameAddressPriceStopTimePaidCalled: Bool {
        return showAlertUserNameAddressPriceStopTimePaidCallsCount > 0
    }
    private(set) var showAlertUserNameAddressPriceStopTimePaidReceivedArguments: (userName: String, address: String, price: Double, stopTime: String, paid: Bool)?
    private(set) var showAlertUserNameAddressPriceStopTimePaidReceivedInvocations: [(userName: String, address: String, price: Double, stopTime: String, paid: Bool)] = []
    var showAlertUserNameAddressPriceStopTimePaidClosure: ((String, String, Double, String, Bool) -> Void)?

    func showAlert(userName: String,                 address: String,                 price: Double,                 stopTime: String,                 paid: Bool) {
        showAlertUserNameAddressPriceStopTimePaidCallsCount += 1
        showAlertUserNameAddressPriceStopTimePaidReceivedArguments = (userName: userName, address: address, price: price, stopTime: stopTime, paid: paid)
        showAlertUserNameAddressPriceStopTimePaidReceivedInvocations.append((userName: userName, address: address, price: price, stopTime: stopTime, paid: paid))
        showAlertUserNameAddressPriceStopTimePaidClosure?(userName, address, price, stopTime, paid)
    }

    //MARK: - removeStopInfo

    private(set) var removeStopInfoCallsCount = 0
    var removeStopInfoCalled: Bool {
        return removeStopInfoCallsCount > 0
    }
    var removeStopInfoClosure: (() -> Void)?

    func removeStopInfo() {
        removeStopInfoCallsCount += 1
        removeStopInfoClosure?()
    }

}
class TimeAndDateProviderMock: NSObject, TimeAndDateProvider {

    //MARK: - currentTimeAndDate

    private(set) var currentTimeAndDateCallsCount = 0
    var currentTimeAndDateCalled: Bool {
        return currentTimeAndDateCallsCount > 0
    }
    var currentTimeAndDateReturnValue: (time: String, date: String)?
    var currentTimeAndDateClosure: (() -> (time: String, date: String)?)?

    func currentTimeAndDate() -> (time: String, date: String)? {
        currentTimeAndDateCallsCount += 1
        return currentTimeAndDateClosure.map({ $0() }) ?? currentTimeAndDateReturnValue
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

    //MARK: - navigateToContactForm

    private(set) var navigateToContactFormCallsCount = 0
    var navigateToContactFormCalled: Bool {
        return navigateToContactFormCallsCount > 0
    }
    var navigateToContactFormClosure: (() -> Void)?

    func navigateToContactForm() {
        navigateToContactFormCallsCount += 1
        navigateToContactFormClosure?()
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

    //MARK: - didTapContactButton

    private(set) var didTapContactButtonCallsCount = 0
    var didTapContactButtonCalled: Bool {
        return didTapContactButtonCallsCount > 0
    }
    var didTapContactButtonClosure: (() -> Void)?

    func didTapContactButton() {
        didTapContactButtonCallsCount += 1
        didTapContactButtonClosure?()
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

    //MARK: - showStopInfo

    private(set) var showStopInfoUserNameAddressPriceStopTimePaidCallsCount = 0
    var showStopInfoUserNameAddressPriceStopTimePaidCalled: Bool {
        return showStopInfoUserNameAddressPriceStopTimePaidCallsCount > 0
    }
    private(set) var showStopInfoUserNameAddressPriceStopTimePaidReceivedArguments: (userName: String, address: String, price: Double, stopTime: String, paid: Bool)?
    private(set) var showStopInfoUserNameAddressPriceStopTimePaidReceivedInvocations: [(userName: String, address: String, price: Double, stopTime: String, paid: Bool)] = []
    var showStopInfoUserNameAddressPriceStopTimePaidClosure: ((String, String, Double, String, Bool) -> Void)?

    func showStopInfo(userName: String,                    address: String,                    price: Double,                    stopTime: String,                    paid: Bool) {
        showStopInfoUserNameAddressPriceStopTimePaidCallsCount += 1
        showStopInfoUserNameAddressPriceStopTimePaidReceivedArguments = (userName: userName, address: address, price: price, stopTime: stopTime, paid: paid)
        showStopInfoUserNameAddressPriceStopTimePaidReceivedInvocations.append((userName: userName, address: address, price: price, stopTime: stopTime, paid: paid))
        showStopInfoUserNameAddressPriceStopTimePaidClosure?(userName, address, price, stopTime, paid)
    }

    //MARK: - removeStopInfo

    private(set) var removeStopInfoCallsCount = 0
    var removeStopInfoCalled: Bool {
        return removeStopInfoCallsCount > 0
    }
    var removeStopInfoClosure: (() -> Void)?

    func removeStopInfo() {
        removeStopInfoCallsCount += 1
        removeStopInfoClosure?()
    }

}
