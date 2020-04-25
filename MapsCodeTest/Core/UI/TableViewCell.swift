import UIKit

open class TableViewCell: UITableViewCell {
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  public init() {
    super.init(style: .default, reuseIdentifier: "")
    setup()
  }
  
  private func setup() {
    backgroundColor = .white
    setupView()
    setupConstraints()
  }
  
  open func setupView() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
  
  open func setupConstraints() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
}
