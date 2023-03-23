class AuthToken {
  final String _token;
  final String _userId;
  final DateTime _expiryDate;
  final String _email;

  AuthToken({token, userId, expiryDate, email})
      : _token = token,
        _userId = userId,
      _email = email,
        _expiryDate = expiryDate;

  bool get isValid {
    print(token);
    return token != null;
  }

  String? get token {
    if (_expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  String get email {
    return _email;
  }

  DateTime get expiryDate {
    return _expiryDate;
  }

  Map<String, dynamic> toJson() {
    return {
      'authToken': _token,
      'userId': _userId,
      'email': _email,
      'expiryDate': _expiryDate.toIso8601String(),
    };
  }

  static AuthToken fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['authToken'],
      userId: json['userId'],
      email: json['email'],
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }
}
