import RxSwift

public protocol GetTripsUseCase: AutoMockable {
  func execute() -> Single<[Trip]>
}
