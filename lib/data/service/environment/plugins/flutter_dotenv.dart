// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../env.dart';

class PluginFlutterDotEnv extends EnvironmentStrategy {
  void _validateVar(String name, String? value) {
    if (value == null || value.isEmpty) {
      throw Exception('Missing or invalid .env asset for variable: $name');
    }
  }

  @override
  Future<void> validate() async {
    await dotenv.load();
    _validateVar(envNamePrivacyPolicyUrl, dotenv.env[envNamePrivacyPolicyUrl]);
    _validateVar(envNameTermsOfUseUrl, dotenv.env[envNameTermsOfUseUrl]);
    _validateVar(
      envNameLocalPrefEncryptionKey,
      dotenv.env[envNameLocalPrefEncryptionKey],
    );
    _validateVar(envNewsApiUrl, dotenv.env[envNewsApiUrl]);
    _validateVar(envNewsApiKey, dotenv.env[envNewsApiKey]);
    _validateVar(
      envNewsConfigEncryptionKey,
      dotenv.env[envNewsConfigEncryptionKey],
    );
  }

  @override
  String get privacyPolicyUrl => dotenv.env[envNamePrivacyPolicyUrl]!;
  @override
  String get termsOfUseUrl => dotenv.env[envNameTermsOfUseUrl]!;
  @override
  String get localPrefEncryptionKey =>
      dotenv.env[envNameLocalPrefEncryptionKey]!;
  @override
  String get newsApiUrl => dotenv.env[envNewsApiUrl]!;
  @override
  String get newsApiKey => dotenv.env[envNewsApiKey]!;
  @override
  String get newsConfigEncryptionKey => dotenv.env[envNewsConfigEncryptionKey]!;
}
