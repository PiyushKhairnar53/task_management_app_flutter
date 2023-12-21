import '../../../imports.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextAlign align;
  final FontWeight fontWeight;

  const CustomText(this.text,
      {super.key, this.color = Colors.black,
        this.size = 14,
        this.align = TextAlign.left,
        this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          fontFamily: 'Lato-Medium'),
      textAlign: align,
    );
  }
}
