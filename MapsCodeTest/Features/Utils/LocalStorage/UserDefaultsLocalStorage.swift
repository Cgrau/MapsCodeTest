import Foundation

final class UserDefaultsLocalStorage: LocalStorage {
  private let userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }
  
  func store(value: String) {
    userDefaults.set(value,
                     forKey: LocalStorageKey.bugReport.rawValue)
    let savedItemsCount = getSavedItemsCount() + 1
    userDefaults.set(savedItemsCount,
                     forKey: LocalStorageKey.savedItems.rawValue)
  }
  
  func getSavedItemsCount() -> Int {
    return userDefaults.integer(forKey: LocalStorageKey.savedItems.rawValue)
  }
  
  func clear() {
    guard let domain = Bundle.main.bundleIdentifier else { return }
    userDefaults.removePersistentDomain(forName: domain)
  }
}
