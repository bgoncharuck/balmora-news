import 'dart:convert';
import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:balmoranews/data/service/local_pref/local_pref.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

Future<void> encryptHives() async {
  final localPrefEncryptionKey = env.localPrefEncryptionKey;

  final localPrefKey = await _readKey(
    localPrefEncryptionKey,
    hiveBoxNameOnError: localPrefHiveBoxName,
  );

  await localPref.init(localPrefKey);
}

Future<List<int>> _generateNewKey(String encryptionKey) async {
  final key = Hive.generateSecureKey();
  await di.get<FlutterSecureStorage>().write(
    key: encryptionKey,
    value: base64UrlEncode(key),
  );
  return key;
}

Future<List<int>> _readKey(
  String encryptionKey, {
  required String hiveBoxNameOnError,
}) async {
  late final List<int> localPrefKey;
  final localPrefKeyBase64 = await di.get<FlutterSecureStorage>().read(
    key: encryptionKey,
  );

  if (localPrefKeyBase64 != null) {
    try {
      localPrefKey = base64Url.decode(
        localPrefKeyBase64,
      );
    } catch (e, t) {
      await logger.exception(e, t);

      /// Delete HiveBox storage if key is lost
      /// Yes, intended and aware, a clean app start.
      /// Also, protection against reverse-engineering.
      await Hive.deleteBoxFromDisk(hiveBoxNameOnError);
      localPrefKey = await _generateNewKey(encryptionKey);
    }
  } else {
    localPrefKey = await _generateNewKey(encryptionKey);
  }

  return localPrefKey;
}
