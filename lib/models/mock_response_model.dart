class MockResponseModel {
  String authorisationStatus;
  MockResponseModel(this.authorisationStatus);

  static MockResponseModel fromMap(Map<String, dynamic> map) {
    return MockResponseModel(map['AuthorisationStatus']);
  }
}
