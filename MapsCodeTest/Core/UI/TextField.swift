import UIKit

private enum Constants {
  static let cornerRadius: CGFloat = 10
  static let horizontalPadding: CGFloat = 5
  static let borderWidth: CGFloat = 2
  static let borderColor: CGColor = UIColor.blue.cgColor
}


/// UITextField subclass with padding on text
class TextField: UITextField {
  
  private let padding = UIEdgeInsets(top: 0,
                                     left: Constants.horizontalPadding,
                                     bottom: 0,
                                     right: Constants.horizontalPadding)
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    layer.borderColor = Constants.borderColor
    layer.borderWidth = Constants.borderWidth
    layer.cornerRadius = Constants.cornerRadius
  }
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
