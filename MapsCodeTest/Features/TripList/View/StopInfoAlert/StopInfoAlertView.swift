import UIKit

private enum Constants {
  enum Spacing {
    static let big: CGFloat = 8
    static let small: CGFloat = 4
  }
  static let cornerRadius: CGFloat = 10
  static let borderWidth: CGFloat = 1
}

public final class StopInfoAlertView: View {

  private var containerView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = Constants.cornerRadius
    view.layer.borderWidth = Constants.borderWidth
    view.layer.borderColor = UIColor.blue.cgColor
    return view
  }()
  
  private var userNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    label.textColor = .blue
    return label
  }()
  
  private var addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.small)
    label.textColor = .blue
    return label
  }()
  
  private var priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.small)
    label.textColor = .blue
    return label
  }()
  
  private var stopTimeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.small)
    label.textColor = .blue
    return label
  }()
  
  private var paidLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.small)
    label.textColor = .blue
    return label
  }()
  
  public override func setupView() {
    containerView.addSubview(userNameLabel)
    containerView.addSubview(addressLabel)
    containerView.addSubview(priceLabel)
    containerView.addSubview(stopTimeLabel)
    containerView.addSubview(paidLabel)
    addSubview(containerView)
  }
  
  public override func setupConstraints() {
    userNameLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(Constants.Spacing.big)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.big)
      make.top.equalToSuperview()
    }
    addressLabel.snp.makeConstraints { make in
      make.top.equalTo(userNameLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(userNameLabel)
      make.trailing.equalTo(userNameLabel)
    }
    priceLabel.snp.makeConstraints { make in
      make.top.equalTo(addressLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(userNameLabel)
      make.trailing.equalTo(userNameLabel)
    }
    stopTimeLabel.snp.makeConstraints { make in
      make.top.equalTo(priceLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(userNameLabel)
      make.trailing.equalTo(userNameLabel)
    }
    paidLabel.snp.makeConstraints { make in
      make.top.equalTo(stopTimeLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(userNameLabel)
      make.trailing.equalTo(userNameLabel)
      make.bottom.equalToSuperview().offset(-Constants.Spacing.big)
    }
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  public func setup(with stopInfo: Stop) {
    userNameLabel.text = stopInfo.userName
    addressLabel.text = stopInfo.address
    priceLabel.text = String(stopInfo.price)
    stopTimeLabel.text = stopInfo.stopTime
    paidLabel.text = stopInfo.paid == true ? "Paid" : "Unpaid"
  }
}
