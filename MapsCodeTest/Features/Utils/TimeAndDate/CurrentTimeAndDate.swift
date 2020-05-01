import Foundation

protocol TimeAndDateProvider: AutoMockable {
  func currentTimeAndDate() -> (time: String, date: String)?
}

final class DefaultTimeAndDateProvider: TimeAndDateProvider {
  func currentTimeAndDate() -> (time: String, date: String)? {
    let date = Date()
    let calender = Calendar.current
    let components = calender.dateComponents([.year, .month, .day, .hour, .minute],
                                             from: date)
    guard let day = components.day,
      let month = components.month,
      let year = components.year,
      let hour = components.hour,
      let minute = components.minute else {
      return nil
    }
    let dateString = "\(day)/\(month)/\(year)"
    let timeString = "\(hour):\(minute)"
    return (timeString, dateString)
  }
}
