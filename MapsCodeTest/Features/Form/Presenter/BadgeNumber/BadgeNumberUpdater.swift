import UIKit

protocol AppIconBadgeNumberUpdater {
  var applicationIconBadgeNumber: Int { get set }
}

extension UIApplication: AppIconBadgeNumberUpdater {}

protocol BadgeNumberUpdater: class, AutoMockable {
  func updateBadge(at value: Int)
}

final class DefaultBadgeNumberUpdater: BadgeNumberUpdater {
  
  private var app: AppIconBadgeNumberUpdater
  
  init(app: AppIconBadgeNumberUpdater) {
    self.app = app
  }
  
  func updateBadge(at value: Int) {
    app.applicationIconBadgeNumber = value
  }
}
