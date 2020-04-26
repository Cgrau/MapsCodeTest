import UIKit

final class TripViewCell: TableViewCell {
  private var driverNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    return label
  }()
  
  private var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var startTimeLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var endTimeLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var status: TripStatus? {
    didSet {
      guard let status = status else { return }
      statusLabel.text = status.rawValue.capitalized
      switch status {
      case .ongoing:
        statusLabel.backgroundColor = .green
      case .scheduled:
        statusLabel.backgroundColor = .purple
      case .finalized:
        statusLabel.backgroundColor = .gray
      case .cancelled:
        statusLabel.backgroundColor = .red
      case .none:
        statusLabel.backgroundColor = .clear
      }
    }
  }
  
  private var statusLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  override func setupView() {
    addSubview(driverNameLabel)
    addSubview(descriptionLabel)
    addSubview(startTimeLabel)
    addSubview(endTimeLabel)
    addSubview(statusLabel)
  }
  
  override func setupConstraints() {
    driverNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(8)
      make.leading.equalToSuperview().offset(8)
      make.trailing.equalToSuperview().offset(-8)
    }
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(driverNameLabel.snp.bottom).offset(4)
      make.leading.equalTo(driverNameLabel)
      make.trailing.equalTo(driverNameLabel)
    }
    startTimeLabel.snp.makeConstraints { make in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
      make.leading.equalTo(descriptionLabel)
      make.trailing.equalTo(descriptionLabel)
    }
    endTimeLabel.snp.makeConstraints { make in
      make.top.equalTo(startTimeLabel.snp.bottom).offset(4)
      make.leading.equalTo(descriptionLabel)
      make.trailing.equalTo(descriptionLabel)
    }
    statusLabel.snp.makeConstraints { make in
      make.top.equalTo(endTimeLabel.snp.bottom).offset(4)
      make.leading.equalTo(descriptionLabel)
      make.trailing.equalTo(descriptionLabel)
      make.bottom.equalToSuperview().offset(-8)
    }
  }
}

extension TripViewCell {
  func configure(with driverName: String?,
                 descriptionText: String?,
                 startTime: String?,
                 endTime: String?,
                 status: TripStatus?) {
    accessoryType = .none
    driverNameLabel.text = driverName
    descriptionLabel.text = descriptionText
    startTimeLabel.text = startTime
    endTimeLabel.text = endTime
    self.status = status
  }
}
