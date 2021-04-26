class User {
  final int id;

  String email;
  String firstName;
  String lastName;
  String avatar;

  String get name => (this.firstName != null ? this.firstName + ' ' : '')
    + this.lastName ?? '';

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar
  }) : assert(id != null, 'Id should not be null!');

  User.listConstructor(Map<String, dynamic> data) :
    this.id = data['id'],
    this.email = data['email'],
    this.firstName = data['firstName'],
    this.lastName = data['lastName'],
    this.avatar = data['avatar'],
    assert(data['id'] != null, 'Id should not be null!');
}
