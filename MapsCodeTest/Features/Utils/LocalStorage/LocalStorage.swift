protocol LocalStorage: AutoMockable {
  func store(string: String, forKey key: LocalStorageKey)
  func clear()
}
