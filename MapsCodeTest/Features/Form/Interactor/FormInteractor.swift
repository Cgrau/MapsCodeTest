import UIKit

protocol FormInteractor: class{
  var delegate: FormInteractorDelegate? { get set }
  
  func getTimeAndDate()
  func save(data: FormInfo)
}
