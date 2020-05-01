import Foundation

final class UserDefaultsLocalStorage: LocalStorage {
  private let userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }
  
  
  func store(string: String, forKey key: LocalStorageKey) {
    userDefaults.set(string,
                     forKey: key.rawValue)
  }
  
  func clear() {
    guard let domain = Bundle.main.bundleIdentifier else { return }
    userDefaults.removePersistentDomain(forName: domain)
  }
}
