import SnapKit

protocol TripListViewDelegate: class {
  func didTapOn(trip: Trip)
}

private enum Constants {
  static let mapBottomInset = CGFloat(6.0)
  enum Spacing {
    static let vertical: CGFloat = 32
    static let horizontal: CGFloat = 8
    static let small: CGFloat = 4
  }
  static let cornerRadius: CGFloat = 10
  static let borderWidth: CGFloat = 1
  static let tableDivider = 3
}

class TripListView: View {
  
  private var mapProvider: MapProvider?
  private var routeDrawable: RouteDrawable?
  private var annotationDrawable: AnnotationDrawable?
  
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
  
  // MARK: View Functions
  override func setupView() {
    addSubview(tableView)
    tableView.register(TripViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.bottom.equalTo(safeAreaLayoutGuide)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.height.equalToSuperview().dividedBy(Constants.tableDivider)
    }
  }
  
  // MARK: MapSetup
  func setupProviders(mapProvider: MapProvider,
                      routeDrawable: RouteDrawable,
                      annotationDrawable: AnnotationDrawable) {
    self.mapProvider = mapProvider
    self.routeDrawable = routeDrawable
    self.annotationDrawable = annotationDrawable
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
  
  private func setupMap() {
    guard let mapView = mapView else { return }
    addSubview(mapView)
    addInfoView(into: mapView)
    sendSubviewToBack(mapView)
    mapView.layoutMargins = UIEdgeInsets(top: .zero,
                                         left: Constants.Spacing.horizontal,
                                         bottom: -Constants.mapBottomInset,
                                         right: Constants.Spacing.horizontal)
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
      make.top.equalTo(view).offset(Constants.Spacing.vertical)
      make.leading.equalTo(view).offset(Constants.Spacing.horizontal)
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
