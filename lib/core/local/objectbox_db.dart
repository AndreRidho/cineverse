import 'package:cineverse/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxDatabase {
  static ObjectBoxDatabase? _instance;
  late final Store store;

  ObjectBoxDatabase._create(this.store);

  static Future<ObjectBoxDatabase> getInstance() async {
    if (_instance == null) {
      final dir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: dir.path);
      _instance = ObjectBoxDatabase._create(store);
    }
    return _instance!;
  }
}
