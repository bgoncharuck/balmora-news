import 'package:balmoranews/core/interface/hive_module.dart';

const _hivePrivacyPolicyAcceptedKey = 'privacyPolicyAccepted';
const _hiveTermsAcceptedKey = 'termsAccepted';

class LocalPref extends IHiveModule {
  LocalPref() : super('local_pref');

  Future<void> setAcceptanceOfTerms({required bool value}) async =>
      hiveBox.put(_hiveTermsAcceptedKey, value);

  Future<void> setAcceptanceOfPrivacyPolicy({required bool value}) async =>
      hiveBox.put(_hivePrivacyPolicyAcceptedKey, value);

  bool get acceptanceOfTerms {
    final value = hiveBox.get(_hiveTermsAcceptedKey);
    if (value == null) {
      return false;
    } else {
      return value as bool;
    }
  }

  bool get acceptanceOfPrivacyPolicy {
    final value = hiveBox.get(_hivePrivacyPolicyAcceptedKey);
    if (value == null) {
      return false;
    } else {
      return value as bool;
    }
  }
}
