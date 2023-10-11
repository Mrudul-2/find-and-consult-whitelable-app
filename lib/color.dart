import 'dart:ui';

extension HexColor on Color {

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}


class FCColors {
  static Color black = HexColor.fromHex("#3C3C3C");
  static Color tonedRed = HexColor.fromHex("#FF5757");
  static Color brightRed = HexColor.fromHex("#F22C15");
  static Color bgWhite = HexColor.fromHex("#F8FCFF");
  static Color textBlack = HexColor.fromHex("#0F172A");
  static Color textGrey = HexColor.fromHex("#64748B");
  static Color greyCool = HexColor.fromHex("#5D6B98");
  static Color lightBlack = HexColor.fromHex("#191D31");
}
