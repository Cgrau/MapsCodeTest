import UIKit

private enum Constants {
  static let cornerRadius: CGFloat = 10
  static let padding: CGFloat = 5
  static let borderWidth: CGFloat = 2
  static let borderColor: CGColor = UIColor.blue.cgColor
}

class TextView: UITextView {
  
  private let padding = UIEdgeInsets(top: Constants.padding,
                                     left: Constants.padding,
                                     bottom: Constants.padding,
                                     right: Constants.padding)
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
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
    textContainerInset = padding
  }
}
