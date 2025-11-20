/// no, you can't create a list or a map here
/// loops with variable won't work since Build Injection access is constant
const envNamePrivacyPolicyUrl = 'PRIVACY_POLICY_URL';
const envNameTermsOfUseUrl = 'TERMS_OF_USE_URL';
const envNameLocalPrefEncryptionKey = 'LOCAL_PREF_ENCRYPTION_KEY';

abstract class EnvironmentStrategy {
  Future<void> validate();

  String get privacyPolicyUrl;
  String get termsOfUseUrl;
  String get localPrefEncryptionKey;
}
