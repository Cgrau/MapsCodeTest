import UIKit

private enum Constants {
  enum Titles {
    static let name = "Driver Name: "
    static let description = "Description: "
    static let startTime = "Start Time: "
    static let endTime = "End Time: "
    static let status = "Status: "
  }
  enum Spacing {
    static let big = 8
    static let small = 4
  }
}

final class TripViewCell: TableViewCell {
  
  private var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    return label
  }()
  
  private var driverNameLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    label.numberOfLines = 0
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
      statusLabel.text = Constants.Titles.status + status.rawValue.capitalized
      switch status {
      case .ongoing:
        statusLabel.backgroundColor = .green
      case .scheduled:
        statusLabel.backgroundColor = .orange
      case .finalized:
        statusLabel.backgroundColor = .lightGray
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
    addSubview(descriptionLabel)
    addSubview(driverNameLabel)
    addSubview(startTimeLabel)
    addSubview(endTimeLabel)
    addSubview(statusLabel)
  }
  
  override func setupConstraints() {
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(Constants.Spacing.big)
      make.leading.equalToSuperview().offset(Constants.Spacing.big)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.big)
    }
    driverNameLabel.snp.makeConstraints { make in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(descriptionLabel)
      make.trailing.equalTo(descriptionLabel)
    }
    startTimeLabel.snp.makeConstraints { make in
      make.top.equalTo(driverNameLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(driverNameLabel)
      make.trailing.equalTo(driverNameLabel)
    }
    endTimeLabel.snp.makeConstraints { make in
      make.top.equalTo(startTimeLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(startTimeLabel)
      make.trailing.equalTo(startTimeLabel)
    }
    statusLabel.snp.makeConstraints { make in
      make.top.equalTo(endTimeLabel.snp.bottom).offset(Constants.Spacing.small)
      make.leading.equalTo(endTimeLabel)
      make.trailing.equalTo(endTimeLabel)
      make.bottom.equalToSuperview().offset(-Constants.Spacing.big)
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
    descriptionLabel.text = descriptionText ?? ""
    driverNameLabel.text = Constants.Titles.name + (driverName ?? "")
    startTimeLabel.text = Constants.Titles.startTime + (startTime ?? "")
    endTimeLabel.text = Constants.Titles.endTime + (endTime ?? "")
    self.status = status
  }
}
