import 'package:faker/faker.dart';
import 'package:roomies/core/auth/models/user.dart';
import 'package:uuid/uuid.dart';

class UserBuilder {
  String? id;
  String? email;
  String? firstName;
  String? lastName;

  UserBuilder withId(String id) {
    this.id = id;
    return this;
  }

  UserBuilder withEmail(String email) {
    this.email = email;
    return this;
  }

  UserBuilder withFirtName(String firstName) {
    this.firstName = firstName;
    return this;
  }

  UserBuilder withLastName(String lastName) {
    this.lastName = lastName;
    return this;
  }

  User build() {
    return User(
      id: id ?? const Uuid().v4(),
      email: email ?? faker.internet.email(),
      firstName: firstName ?? faker.person.firstName(),
      lastName: lastName ?? faker.person.lastName(),
    );
  }
}
