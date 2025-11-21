import 'dart:convert';
import 'package:balmoranews/core/di.dart';
import 'package:balmoranews/core/interface/hive_module.dart';
import 'package:balmoranews/data/service/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';

Future<void> encryptHives() async {
  final hiveModules = <EncryptedHiveModule>[
    EncryptedHiveModule(
      module: localPref,
      publicEncryptionKey: env.localPrefEncryptionKey,
    ),
    EncryptedHiveModule(
      module: newsConfigStorage,
      publicEncryptionKey: env.newsConfigEncryptionKey,
    ),
  ];

  for (final encrypted in hiveModules) {
    final localPrefKey = await _readKey(
      encrypted.publicEncryptionKey,
      hiveBoxNameOnError: encrypted.module.hiveBoxName,
    );

    await encrypted.module.init(localPrefKey);
  }
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
