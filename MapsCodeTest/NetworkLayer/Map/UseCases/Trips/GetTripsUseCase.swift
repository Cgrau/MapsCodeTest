import RxSwift

public protocol GetTripsUseCase {
  func execute() -> Single<[Trip]>
}
