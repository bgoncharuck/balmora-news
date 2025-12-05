import 'package:balmoranews/core/interface/hive_module.dart';

const _hiveNewsLangKey = 'newsLang';
const _hiveNewsPageSizeKey = 'newsPageSize';
const _hiveNewsSearchKey = 'newsSearch';

class NewsConfigStorage extends IHiveModule {
  NewsConfigStorage() : super('newsConfig');

  String get lang {
    final value = hiveBox.get(_hiveNewsLangKey);
    if (value == null) {
      return 'en';
    } else {
      return value as String;
    }
  }

  int get pageSize {
    final value = hiveBox.get(_hiveNewsPageSizeKey);
    if (value == null) {
      return 20;
    } else {
      return value as int;
    }
  }

  String get search {
    final value = hiveBox.get(_hiveNewsSearchKey);
    if (value == null) {
      return 'Morrowind OR Skyrim';
    } else {
      return value as String;
    }
  }

  Future<void> setLang(String lang) async =>
      hiveBox.put(_hiveNewsLangKey, lang);

  Future<void> setPageSize(int pageSize) async =>
      hiveBox.put(_hiveNewsPageSizeKey, pageSize);

  Future<void> setSearch(String search) async =>
      hiveBox.put(_hiveNewsSearchKey, search);
}
