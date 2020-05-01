import Foundation

extension Bundle {
  /// Framework bundle
  static var framework: Bundle {
    guard let url = Bundle(for: Framework.self).url(forResource: "MapsCodeTest", withExtension: "bundle") else {
      return Bundle(for: Framework.self)
    }
    return Bundle(url: url) ?? Bundle(for: Framework.self)
  }

  public static func framework(_ `for`: NSObject) -> Bundle {
    return Bundle(for: `for`.classForCoder)
  }

  public static func framework(_ `for`: AnyClass) -> Bundle {
    return Bundle(for: `for`)
  }
}
private final class Framework {}
