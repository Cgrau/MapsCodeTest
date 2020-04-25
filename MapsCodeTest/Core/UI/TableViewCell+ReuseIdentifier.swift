import UIKit

public protocol Identifiable: class {
  static var cellIdentifier: String { get }
}

public extension Identifiable {
  static var cellIdentifier: String {
    return String(describing: Self.self)
  }
}

extension UITableViewCell: Identifiable {}

public extension UITableView {
  func register<T: UITableViewCell>(_ cell: T.Type) {
    self.register(T.self, forCellReuseIdentifier: T.cellIdentifier)
  }
}
