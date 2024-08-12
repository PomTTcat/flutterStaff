class ProgressModel {
  final String title;
  final List<ProgressItem> items;
  final int sum;

  ProgressModel({
    required this.title,
    required this.items,
    required this.sum,
  });
}

class ProgressItem {
  final int type;
  final int value;

  ProgressItem({
    required this.type,
    required this.value,
  });
}
