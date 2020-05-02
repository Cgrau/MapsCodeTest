@testable import MapsCodeTest

extension FormInfo {
  static var mock_OK: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: "johndoe@hotmail.com",
                    phoneNumber: "555555555",
                    date: "1/4/2050",
                    time: "10:30",
                    comment: "eqweqwe")
  }
  
  static var mock_OK_phone_nil: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: "johndoe@hotmail.com",
                    phoneNumber: nil,
                    date: "13/11/1987",
                    time: "11:00",
                    comment: "eqweqwe")
  }
  
  static var mock_KO_all_nil: FormInfo {
    return FormInfo(fullName: nil,
                    email: nil,
                    phoneNumber: nil,
                    date: nil,
                    time: nil,
                    comment: nil)
  }
  
  static var mock_KO_invalidEmail: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: "eqeqwewq@com",
                    phoneNumber: "3123132132",
                    date: "1/4/2050",
                    time: "10:30",
                    comment: "eqweqwe")
  }
  
  static var mock_KO_nil_email: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: nil,
                    phoneNumber: "3123132132",
                    date: "1/4/2050",
                    time: "10:30",
                    comment: "eqweqwe")
  }
  
  static var mock_KO_empty_fields: FormInfo {
    return FormInfo(fullName: "",
                    email: "",
                    phoneNumber: "",
                    date: "1/4/2050",
                    time: "10:30",
                    comment: "eqweqwe")
  }
}
