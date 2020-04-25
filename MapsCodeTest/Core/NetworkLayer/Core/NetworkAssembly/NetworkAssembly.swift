import Foundation

public final class NetworkAssembly {
  fileprivate static let shared = NetworkAssembly()
}

public var resolver: NetworkAssembly {
  return NetworkAssembly.shared
}
