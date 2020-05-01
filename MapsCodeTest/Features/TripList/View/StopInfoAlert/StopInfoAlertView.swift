import UIKit

private enum Constants {
  enum Titles {
    static let name = "Name: "
    static let address = "Address: "
    static let price = "Price: "
    static let stopTime = "Stop Time: "
    static let status = "Status: "
    static let currency = "€"
    enum PaymentStatus {
      static let unpaid = "Paid"
      static let paid = "Paid"
    }
  }
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
  
  public func setup(userName: String,
                    address: String,
                    price: Double,
                    stopTime: String,
                    paid: Bool) {
    userNameLabel.text = Constants.Titles.name + userName
    addressLabel.text = Constants.Titles.address + address
    priceLabel.text = Constants.Titles.price + String(price) + Constants.Titles.currency
    stopTimeLabel.text = Constants.Titles.stopTime + stopTime
    paidLabel.text = paymentString(paid: paid)
  }
  
  private func paymentString(paid: Bool) -> String {
    var returnString = Constants.Titles.status
    if paid {
      returnString += Constants.Titles.PaymentStatus.paid
    } else {
      returnString += Constants.Titles.PaymentStatus.unpaid
    }
    return returnString
  }
}
