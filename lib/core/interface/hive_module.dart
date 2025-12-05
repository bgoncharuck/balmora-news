import 'package:balmoranews/core/di.dart';
import 'package:hive_ce/hive.dart';

class EncryptedHiveModule {
  EncryptedHiveModule({
    required this.publicEncryptionKey,
    required this.module,
  });
  final String publicEncryptionKey;
  final IHiveModule module;
}

class IHiveModule {
  IHiveModule(this.hiveBoxName);
  final String hiveBoxName;
  late Box<dynamic> hiveBox;

  Future<void> init(List<int> encryptionKey) async {
    try {
      hiveBox = await Hive.openBox(
        hiveBoxName,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    } catch (e, t) {
      /// Encryption mismatch
      await logger.exception(e, t);
      if (Hive.isBoxOpen(hiveBoxName)) {
        try {
          await hiveBox.close();
        } catch (e) {
          // ignore
        }
      }
      await Hive.deleteBoxFromDisk(hiveBoxName);

      hiveBox = await Hive.openBox(
        hiveBoxName,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    }
  }
}
