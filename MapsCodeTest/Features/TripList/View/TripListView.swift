import SnapKit

protocol TripListViewDelegate: class {
  func didTapOn(trip: Trip)
  func didTapOnContactButton()
}

private enum Constants {
  static let mapBottomInset = CGFloat(6.0)
  enum Spacing {
    static let huge: CGFloat = 32
    static let big: CGFloat = 8
    static let small: CGFloat = 4
  }
  static let cornerRadius: CGFloat = 10
  static let borderWidth: CGFloat = 1
  static let tableDivider = 3
  static let buttonHeight = 50
}

class TripListView: View {
  
  private var mapProvider: MapProvider?
  private var routeDrawable: RouteDrawable?
  private var annotationDrawable: AnnotationDrawable?
  private var alertProvider: StopInfoAlertProvider?
  
  weak var delegate: TripListViewDelegate?
  
  var trips: [Trip] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  private var mapView: UIView? {
    return mapProvider?.mapView
  }
  
  private var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  private var infoView: UIView = {
    let view = UIView()
    view.layer.cornerRadius = Constants.cornerRadius
    view.layer.borderColor = UIColor.blue.cgColor
    view.layer.borderWidth = Constants.borderWidth
    view.backgroundColor = .white
    return view
  }()
  
  private var driverNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var routeNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.font = UIFont.systemFont(ofSize: FontSize.small)
    return label
  }()
  
  private var contactButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .blue
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Contact", for: .normal)
    return button
  }()
  
  // MARK: View Functions
  override func setupView() {
    addSubview(contactButton)
    addSubview(tableView)
    tableView.register(TripViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    contactButton.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
  }
  
  override func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.height.equalToSuperview().dividedBy(Constants.tableDivider)
      make.bottom.equalTo(contactButton.snp.top).offset(-Constants.Spacing.big)
    }
    contactButton.snp.makeConstraints { make in
      make.bottom.equalTo(safeAreaLayoutGuide)
      make.leading.equalToSuperview().offset(Constants.Spacing.big)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.big)
      make.height.equalTo(Constants.buttonHeight)
    }
  }
  
  @objc private func contactButtonAction() {
    delegate?.didTapOnContactButton()
  }
  
  // MARK: MapSetup
  func setupProviders(mapProvider: MapProvider,
                      routeDrawable: RouteDrawable,
                      annotationDrawable: AnnotationDrawable,
                      alertProvider: StopInfoAlertProvider) {
    self.mapProvider = mapProvider
    self.routeDrawable = routeDrawable
    self.annotationDrawable = annotationDrawable
    self.alertProvider = alertProvider
    setupMap()
  }
  
  func draw(selectedRoute: String) {
    routeDrawable?.draw(route: selectedRoute)
  }
  
  func add(annotations: [Annotation]) {
    annotationDrawable?.add(annotations: annotations)
  }
  
  func display(driverName: String, description: String) {
    infoView.alpha = 1
    driverNameLabel.text = driverName
    routeNameLabel.text = description
  }
  
  func showAlert(userName: String,
                 address: String,
                 price: Double,
                 stopTime: String,
                 paid: Bool) {
    alertProvider?.showAlert(userName: userName,
                             address: address,
                             price: price,
                             stopTime: stopTime,
                             paid: paid)
  }
  
  func removeAlert() {
    alertProvider?.removeStopInfo()
  }
  
  private func setupMap() {
    guard let mapView = mapView else { return }
    addSubview(mapView)
    addInfoView(into: mapView)
    sendSubviewToBack(mapView)
    mapView.layoutMargins = UIEdgeInsets(top: .zero,
                                         left: Constants.Spacing.big,
                                         bottom: -Constants.mapBottomInset,
                                         right: Constants.Spacing.big)
    mapView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(tableView.snp.top)
    }
    mapView.backgroundColor = .blue
  }
  
  private func addInfoView(into view: UIView) {
    infoView.addSubview(driverNameLabel)
    infoView.addSubview(routeNameLabel)
    view.addSubview(infoView)
    infoView.alpha = .zero
    driverNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(Constants.Spacing.small)
      make.leading.equalTo(infoView).offset(Constants.Spacing.small)
      make.trailing.equalTo(infoView).offset(-Constants.Spacing.small)
    }
    routeNameLabel.snp.makeConstraints { make in
      make.top.equalTo(driverNameLabel.snp.bottom)
      make.leading.equalTo(driverNameLabel)
      make.trailing.equalTo(driverNameLabel)
      make.bottom.equalToSuperview().offset(-Constants.Spacing.small)
    }
    infoView.snp.makeConstraints { make in
      make.top.equalTo(view).offset(Constants.Spacing.huge)
      make.leading.equalTo(view).offset(Constants.Spacing.big)
    }
  }
}

// MARK: - UITableViewDataSource
extension TripListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return trips.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let trip = trips[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TripViewCell.cellIdentifier) as? TripViewCell else {
      return UITableViewCell()
    }
    
    cell.configure(with: trip.driverName,
                   descriptionText: trip.description,
                   startTime: trip.startTime,
                   endTime: trip.endTime,
                   status: trip.status)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

extension TripListView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedTrip = trips[indexPath.row]
    delegate?.didTapOn(trip: selectedTrip)
  }
}
