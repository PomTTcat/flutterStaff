import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recruit/app/theme/ui/bar/tab_base_item.dart';

final keepCountProvider = StateProvider<int>((ref) => 0);

/// footer menu click refresh
final footerMenuClickProvider = StateProvider<TabBaseItem?>((ref) => null);
