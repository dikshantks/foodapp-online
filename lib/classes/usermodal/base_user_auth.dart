import 'package:tmp_online/classes/usermodal/user_modal.dart';

abstract class BaseUserRepo {
  Stream<User> getUser(String id);

  Future<void> createUser(User user);

  Future<void> updateUser(User user);
}
