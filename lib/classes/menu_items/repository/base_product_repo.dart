import 'package:tmp_online/classes/menu_items/menu_item_model.dart';

abstract class BaseProductRepo {
  Stream<List<Products>> getAllProducts();
}
