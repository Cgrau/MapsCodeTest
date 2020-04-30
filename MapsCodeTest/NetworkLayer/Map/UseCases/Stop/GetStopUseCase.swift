import RxSwift

public protocol GetStopUseCase: AutoMockable {
  func execute(request: StopRequest) -> Single<Stop>
}
