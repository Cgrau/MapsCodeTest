import UIKit

protocol FormViewDelegate: class {
  func didTapCloseButton()
  func didTapSaveButton(fullName: String?,
                        email: String?,
                        phoneNumber: String?,
                        date: String?,
                        time: String?)
}

private enum Constants {
  static let buttonSize = CGSize(width: 30, height: 30)
  enum Spacing {
    static let big = 8
    static let small = 4
  }
  enum Titles {
    static let title = "Contact Form"
    static let name = "Name and Surname:"
    static let email = "Email:"
    static let phone = "Phone Number:"
    static let date = "Date:"
    static let time = "Time:"
    static let save = "Save"
  }
  static let cornerRadius: CGFloat = 10
  static let buttonHeight = 50
  static let textFieldHeight = 40
}

class FormView: View {
    
  weak var delegate: FormViewDelegate?
  
  private var closeButton: UIButton = {
    let button = UIButton()
    button.setImage(Image.closeButton, for: .normal)
    return button
  }()
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.title
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    return label
  }()
  
  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    scrollView.keyboardDismissMode = .onDrag
    scrollView.backgroundColor = .white
    return scrollView
  }()
  
  // MARK: Name
  private var nameLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.name
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var nameTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .lightGray
    textField.autocorrectionType = .no
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  // MARK: Email
  private var emailLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.email
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var emailTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .lightGray
    textField.keyboardType = .emailAddress
    textField.autocorrectionType = .no
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  // MARK: Phone Number
  private var phoneNumberLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.phone
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var phoneNumberTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .lightGray
    textField.keyboardType = .phonePad
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  // MARK: Date
  private var dateLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.date
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var dateTextField: UITextField = {
    let textField = UITextField()
    textField.isEnabled = false
    textField.backgroundColor = .lightGray
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  // MARK: Time
  private var timeLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.time
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var timeTextField: UITextField = {
    let textField = UITextField()
    textField.isEnabled = false
    textField.backgroundColor = .lightGray
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  private var saveButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .blue
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle(Constants.Titles.save, for: .normal)
    return button
  }()
  
  override func setupView() {
    addSubview(closeButton)
    addSubview(titleLabel)
    scrollView.addSubview(nameLabel)
    scrollView.addSubview(nameTextField)
    scrollView.addSubview(emailLabel)
    scrollView.addSubview(emailTextField)
    scrollView.addSubview(phoneNumberLabel)
    scrollView.addSubview(phoneNumberTextField)
    scrollView.addSubview(dateLabel)
    scrollView.addSubview(dateTextField)
    scrollView.addSubview(timeLabel)
    scrollView.addSubview(timeTextField)
    addSubview(scrollView)
    addSubview(saveButton)
    setupKeyboardBehaviour(to: scrollView)
    closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
  }
  
  @objc private func closeButtonAction() {
    delegate?.didTapCloseButton()
  }
  
  @objc private func saveButtonAction() {
    delegate?.didTapSaveButton(fullName: nameTextField.text,
                               email: emailTextField.text,
                               phoneNumber: phoneNumberTextField.text,
                               date: dateTextField.text,
                               time: timeTextField.text)
  }
  
  override func setupConstraints() {
    addConstraintsTo(label: nameLabel, textField: nameTextField)
    addConstraintsTo(label: emailLabel, textField: emailTextField, previousView: nameTextField)
    addConstraintsTo(label: phoneNumberLabel, textField: phoneNumberTextField, previousView: emailTextField)
    addConstraintsTo(label: dateLabel, textField: dateTextField, previousView: phoneNumberTextField)
    addConstraintsTo(label: timeLabel, textField: timeTextField, previousView: dateTextField, isLastView: true)
    closeButton.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(Constants.Spacing.big)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.big)
      make.size.equalTo(Constants.buttonSize)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(closeButton.snp.bottom)
      make.leading.equalToSuperview().offset(Constants.Spacing.small)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.small)
    }
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Spacing.big)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    saveButton.snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.bottom).offset(Constants.Spacing.big)
      make.leading.equalToSuperview().offset(Constants.Spacing.big)
      make.trailing.equalToSuperview().offset(-Constants.Spacing.big)
      make.bottom.equalTo(safeAreaLayoutGuide)
      make.height.equalTo(Constants.buttonHeight)
    }
  }
  
  private func addConstraintsTo(label: UILabel,
                                textField: UITextField,
                                previousView: UIView? = nil,
                                isLastView: Bool = false) {
    label.snp.makeConstraints { make in
      if let previousView = previousView {
        make.top.equalTo(previousView.snp.bottom).offset(Constants.Spacing.big)
      } else {
        make.top.equalToSuperview().offset(Constants.Spacing.big)
      }
      make.leading.equalTo(self).offset(Constants.Spacing.big)
      make.trailing.equalTo(self).offset(-Constants.Spacing.big)
    }
    textField.snp.makeConstraints { make in
      make.top.equalTo(label.snp.bottom)
      make.leading.equalTo(self).offset(Constants.Spacing.big)
      make.trailing.equalTo(self).offset(-Constants.Spacing.big)
      if isLastView {
        make.bottom.equalToSuperview()
      }
      make.height.equalTo(Constants.textFieldHeight)
    }
  }
  
  func display(time: String, date: String) {
    timeTextField.text = time
    dateTextField.text = date
  }
}
