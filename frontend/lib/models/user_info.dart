final class UserInfo {
  final bool isAuthenticated;
  final String? name;
  final String? emailAddress;
  final Map<String, String>? addtionalClaims;

  new({
    required this.isAuthenticated,
    required this.name,
    required this.emailAddress,
    required this.addtionalClaims,
  });

  UserInfo.fromMap(Map<String, dynamic> map)
    : this(
        isAuthenticated: map['isAuthenticated'],
        name: map['name'],
        emailAddress: map['emailAddress'],
        addtionalClaims: map['addtionalClaims'],
      );
}
