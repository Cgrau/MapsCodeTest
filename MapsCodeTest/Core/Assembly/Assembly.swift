import Foundation

public final class Assembly {
  fileprivate static let shared = Assembly()
}

public var container: Assembly {
  return Assembly.shared
}
