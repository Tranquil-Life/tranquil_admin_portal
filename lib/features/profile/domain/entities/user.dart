part 'user.g.dart';

class User {
  int? id;
  String? email;
  String? authToken;
  String? name;
  int? adminLevel;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.email,
    this.authToken,
    this.name,
    this.adminLevel,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> userToJson() => _$UserToJson(this);

}