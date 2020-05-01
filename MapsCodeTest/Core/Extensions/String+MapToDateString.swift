import Foundation

private enum Constants {
  static let inFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
  static let outFormat = "HH:mm - dd-MM-yyyy"
}

extension String {
  func formatDateString() -> String? {
    let dateFormatterInput = DateFormatter()
    dateFormatterInput.dateFormat = Constants.inFormat

    let dateFormatterOutput = DateFormatter()
    dateFormatterOutput.dateFormat = Constants.outFormat

    guard let date = dateFormatterInput.date(from: self) else { return nil }
    return dateFormatterOutput.string(from: date)
  }
}
