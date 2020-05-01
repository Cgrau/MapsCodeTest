protocol LocalStorage: AutoMockable {
  func store(value: String)
  func getSavedItemsCount() -> Int
  func clear()
}
