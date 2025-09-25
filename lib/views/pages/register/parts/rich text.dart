import '../../verification/routes/routes.dart';

class richText extends StatelessWidget {
  const richText({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'By Signing to this Account You are accepting our ',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: secondaryColor,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
