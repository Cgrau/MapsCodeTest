import UIKit
import SnapKit

extension UIViewController {
  
  var loadingTag: Int { return 999999 }
  
  private var currentView: UIView {
    return parent?.view ?? view
  }
  
  private func loadingView() -> UIActivityIndicatorView {
    let loader = UIActivityIndicatorView(style: .large)
    loader.tag = loadingTag
    return loader
  }
  
  private func showLoading() {
    self.view.isUserInteractionEnabled = false
    self.removeLoading()
    let loader = self.loadingView()
    currentView.addSubview(loader)
    currentView.bringSubviewToFront(loader)
    
    loader.snp.makeConstraints { (maker) in
      maker.edges.equalTo(self.currentView)
    }
    loader.startAnimating()
  }
  
  private func removeLoading() {
    self.view.isUserInteractionEnabled = true
    guard let view = currentView.viewWithTag(loadingTag) else {
      return
    }
    view.removeFromSuperview()
  }
  
  // MARK: Public methods
  func showLoadingView() {
    showLoading()
  }
  
  func hideLoadingView() {
    removeLoading()
  }
}
