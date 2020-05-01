import UIKit

protocol FormInteractor: class, AutoMockable {
  var delegate: FormInteractorDelegate? { get set }
  
  func getTimeAndDate()
  func save(data: FormInfo)
}
