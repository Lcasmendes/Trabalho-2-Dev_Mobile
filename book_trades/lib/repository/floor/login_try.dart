import 'package:floor/floor.dart';

@entity
class SavedLogin {
  @PrimaryKey()
  final String id;
  final String email;

  SavedLogin({required this.id, required this.email});
}
