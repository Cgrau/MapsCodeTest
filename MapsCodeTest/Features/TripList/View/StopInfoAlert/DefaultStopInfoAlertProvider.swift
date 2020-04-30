import UIKit

private enum Constants {
  static let verticalSpacing: CGFloat = 32
}

class DefaultStopInfoAlertProvider: StopInfoAlertProvider {

  private let view: UIView
  private var currentAlert: StopInfoAlertView?
  weak var viewDelegate: AlertViewDelegate?
  
  init(view: UIView) {
    self.view = view
  }
  
  func showAlert(userName: String,
                 address: String,
                 price: Double,
                 stopTime: String,
                 paid: Bool) {
    currentAlert = StopInfoAlertView()
    guard let alertView = currentAlert else { return }
    view.addSubview(alertView)
    alertView.snp.makeConstraints { make in
      make.top.equalTo(self.view).offset(Constants.verticalSpacing)
      make.trailing.equalTo(self.view)
    }
    alertView.setup(userName: userName,
                    address: address,
                    price: price,
                    stopTime: stopTime,
                    paid: paid)
  }
  
  func removeStopInfo() {
    removeCurrentAlert()
  }
}

// MARK: - Private funcs
extension DefaultStopInfoAlertProvider {
  
  private func removeCurrentAlert() {
    if let alert = currentAlert {
      viewDelegate?.willRemove(alert: alert)
    }
    currentAlert?.removeFromSuperview()
    currentAlert = nil
  }
}
