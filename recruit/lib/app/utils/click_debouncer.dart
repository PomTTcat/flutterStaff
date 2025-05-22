/// クリックに対する防止連打管理クラス
class ClickDebouncer {
  // 各タブの最終クリック時刻を保存するマップ
  static final Map<String, DateTime> _clickTimestamps = {};

  /// 指定されたタブが再リフレッシュ可能かどうかを判定する
  /// [tabKey] - タブ識別用キー（通常は title など）
  /// [debounceDuration] - 最小間隔（デフォルト：1秒）
  static bool canRefresh(String tabKey,
      {Duration debounceDuration = const Duration(seconds: 1)}) {
    final now = DateTime.now();
    final last = _clickTimestamps[tabKey];

    // 前回クリックから一定時間経っていれば許可
    if (last == null || now.difference(last) > debounceDuration) {
      _clickTimestamps[tabKey] = now;
      return true;
    }

    // 連打なので無視
    return false;
  }
}
