import 'package:balmoranews/core/di.dart';
import 'package:hive/hive.dart';

/// Public for Encryption
const localPrefHiveBoxName = 'local_pref';

const _hivePrivacyPolicyAcceptedKey = 'privacyPolicyAccepted';
const _hiveTermsAcceptedKey = 'termsAccepted';

class LocalPref {
  late Box<dynamic> _hiveBox;

  Future<void> init(List<int> encryptionKey) async {
    try {
      _hiveBox = await Hive.openBox(
        localPrefHiveBoxName,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    } catch (e, t) {
      /// Encryption mismatch
      await logger.exception(e, t);
      if (Hive.isBoxOpen(localPrefHiveBoxName)) {
        try {
          await _hiveBox.close();
        } catch (e) {
          // ignore
        }
      }
      await Hive.deleteBoxFromDisk(localPrefHiveBoxName);

      _hiveBox = await Hive.openBox(
        localPrefHiveBoxName,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
    }
  }

  Future<void> setAcceptanceOfTerms({required bool value}) async {
    await _hiveBox.put(_hiveTermsAcceptedKey, value);
  }

  Future<void> setAcceptanceOfPrivacyPolicy({required bool value}) async {
    await _hiveBox.put(_hivePrivacyPolicyAcceptedKey, value);
  }

  bool get acceptanceOfTerms {
    final value = _hiveBox.get(_hiveTermsAcceptedKey);
    if (value == null) {
      return false;
    } else {
      return value as bool;
    }
  }

  bool get acceptanceOfPrivacyPolicy {
    final value = _hiveBox.get(_hivePrivacyPolicyAcceptedKey);
    if (value == null) {
      return false;
    } else {
      return value as bool;
    }
  }
}
