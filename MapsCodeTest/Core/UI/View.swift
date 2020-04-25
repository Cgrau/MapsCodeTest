import UIKit

open class View: UIView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  private var selectedScrollView: UIScrollView?
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  public init() {
    super.init(frame: .zero)
    setup()
  }
  
  private func setup() {
    backgroundColor = .white
    setupView()
    setupConstraints()
    bindViewModel()
  }
  
  open func setupView() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
  
  open func setupConstraints() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
  
  open func bindViewModel() {}
}

extension View {
  public func setupKeyboardBehaviour(to scrollView: UIScrollView) {
    selectedScrollView = scrollView
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(View.keyboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(View.keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(_ notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardKey = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
    let keyboardSize = keyboardKey.cgRectValue
    selectedScrollView?.contentInset = UIEdgeInsets(top: .zero, left: .zero, bottom: keyboardSize.height, right: .zero)
  }
  
  @objc func keyboardWillHide(_ notification: Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard userInfo[UIResponder.keyboardFrameBeginUserInfoKey] != nil else { return }
    selectedScrollView?.contentInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
  }
}
