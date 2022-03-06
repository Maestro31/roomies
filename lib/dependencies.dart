import 'package:roomies/core/auth/auth_gateway.dart';

import 'auth/fake_auth_gateway.dart';

class Dependencies {
  static final AuthGateway authGateway = FakeAuthGateway();
}
