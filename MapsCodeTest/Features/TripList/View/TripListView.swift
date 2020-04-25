import SnapKit

protocol TripListViewDelegate: class {
  func didTapButton()
}

private enum Constants {
  static let mapBottomInset = CGFloat(6.0)
  static let horizontalSpacing: CGFloat = 8
  static let tableDivider = 3
}

class TripListView: View {
  
  private var mapProvider: MapProvider?
  private var routeDrawable: RouteDrawable?
  
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
  
  // MARK: View Functions
  override func setupView() {
    addSubview(tableView)
    tableView.register(TripViewCell.self)
    tableView.dataSource = self
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
                      routeDrawable: RouteDrawable) {
    self.mapProvider = mapProvider
    self.routeDrawable = routeDrawable
    setupMap()
  }
  
  private func setupMap() {
    guard let mapView = mapView else { return }
    addSubview(mapView)
    sendSubviewToBack(mapView)
    mapView.layoutMargins = UIEdgeInsets(top: .zero,
                                         left: Constants.horizontalSpacing,
                                         bottom: -Constants.mapBottomInset,
                                         right: Constants.horizontalSpacing)
    mapView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(tableView.snp.top)
    }
    mapView.backgroundColor = .blue
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
