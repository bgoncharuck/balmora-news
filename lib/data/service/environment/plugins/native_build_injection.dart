import '../env.dart';

class NativeBuildInjectionEnvironment extends EnvironmentStrategy {
  @override
  Future<void> validate() async {
    if (!const bool.hasEnvironment(envNamePrivacyPolicyUrl)) {
      throw Exception(
        '$envNamePrivacyPolicyUrl was not injected during the build',
      );
    }
    if (!const bool.hasEnvironment(envNameTermsOfUseUrl)) {
      throw Exception(
        '$envNameTermsOfUseUrl was not injected during the build',
      );
    }
    if (!const bool.hasEnvironment(envNameLocalPrefEncryptionKey)) {
      throw Exception(
        '$envNameLocalPrefEncryptionKey was not injected during the build',
      );
    }
    if (!const bool.hasEnvironment(envNewsApiUrl)) {
      throw Exception(
        '$envNewsApiUrl was not injected during the build',
      );
    }
    if (!const bool.hasEnvironment(envNewsApiKey)) {
      throw Exception(
        '$envNewsApiKey was not injected during the build',
      );
    }
    if (!const bool.hasEnvironment(envNewsConfigEncryptionKey)) {
      throw Exception(
        '$envNewsConfigEncryptionKey was not injected during the build',
      );
    }
  }

  @override
  String get privacyPolicyUrl =>
      const String.fromEnvironment(envNamePrivacyPolicyUrl);
  @override
  String get termsOfUseUrl =>
      const String.fromEnvironment(envNameTermsOfUseUrl);
  @override
  String get localPrefEncryptionKey =>
      const String.fromEnvironment(envNameLocalPrefEncryptionKey);
  @override
  String get newsApiUrl => const String.fromEnvironment(envNewsApiUrl);
  @override
  String get newsApiKey => const String.fromEnvironment(envNewsApiKey);
  @override
  String get newsConfigEncryptionKey =>
      const String.fromEnvironment(envNewsConfigEncryptionKey);
}
