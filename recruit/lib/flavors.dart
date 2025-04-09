enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'GAMER dev';
      case Flavor.stg:
        return 'GAMER stg';
      case Flavor.prod:
        return 'GAMER';
    }
  }

}
