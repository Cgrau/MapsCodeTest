import UIKit

protocol FormViewDelegate: class, AutoMockable {
  func didTapCloseButton()
  func didTapSaveButton(data: FormInfo)
}

private enum Constants {
  static let buttonSize = CGSize(width: 30, height: 30)
  enum Spacing {
    static let big = 8
    static let small = 4
  }
  enum Titles {
    static let title = "Contact Form - Report Issue"
    static let name = "Name and Surname: *"
    static let email = "Email: *"
    static let phone = "Phone Number:"
    static let date = "Date: *"
    static let time = "Time: *"
    static let comment = "Report Description: *"
    static let save = "Save"
  }
  static let cornerRadius: CGFloat = 10
  static let buttonHeight = 50
  static let textFieldHeight = 40
  static let textViewHeight = 100
  static let maxTextViewCharacters = 200
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
  
  private var nameTextField: TextField = {
    let textField = TextField()
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
  
  private var emailTextField: TextField = {
    let textField = TextField()
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
  
  private var phoneNumberTextField: TextField = {
    let textField = TextField()
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
  
  private var dateTextField: TextField = {
    let textField = TextField()
    textField.isEnabled = false
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
  
  private var timeTextField: TextField = {
    let textField = TextField()
    textField.isEnabled = false
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textField
  }()
  
  // MARK: Comment
  
  private var commentLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.comment
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    return label
  }()
  
  private var commentTextView: TextView = {
    let textView = TextView()
    textView.font = UIFont.systemFont(ofSize: FontSize.regular)
    return textView
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
    scrollView.addSubview(commentLabel)
    scrollView.addSubview(commentTextView)
    commentTextView.delegate = self
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
    let data = FormInfo(fullName: nameTextField.text,
                        email: emailTextField.text,
                        phoneNumber: phoneNumberTextField.text,
                        date: dateTextField.text,
                        time: timeTextField.text,
                        comment: commentTextView.text)
    delegate?.didTapSaveButton(data: data)
  }
  
  override func setupConstraints() {
    addConstraintsTo(label: nameLabel, textField: nameTextField)
    addConstraintsTo(label: emailLabel, textField: emailTextField, previousView: nameTextField)
    addConstraintsTo(label: phoneNumberLabel, textField: phoneNumberTextField, previousView: emailTextField)
    addConstraintsTo(label: dateLabel, textField: dateTextField, previousView: phoneNumberTextField)
    addConstraintsTo(label: timeLabel, textField: timeTextField, previousView: dateTextField)
    commentLabel.snp.makeConstraints { make in
      make.top.equalTo(timeTextField.snp.bottom).offset(Constants.Spacing.big)
      make.leading.equalTo(self).offset(Constants.Spacing.big)
      make.trailing.equalTo(self).offset(-Constants.Spacing.big)
    }
    commentTextView.snp.makeConstraints { make in
      make.top.equalTo(commentLabel.snp.bottom).offset(Constants.Spacing.big)
      make.leading.equalTo(commentLabel)
      make.trailing.equalTo(commentLabel)
      make.height.equalTo(Constants.textViewHeight)
      make.bottom.equalToSuperview()
    }
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
                                previousView: UIView? = nil) {
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
      make.leading.equalTo(label)
      make.trailing.equalTo(label)
      make.height.equalTo(Constants.textFieldHeight)
    }
  }
  
  func display(time: String, date: String) {
    timeTextField.text = time
    dateTextField.text = date
  }
}

extension FormView: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
    let numberOfChars = newText.count
    return numberOfChars < Constants.maxTextViewCharacters
  }
}
