import UIKit
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
  }
}
