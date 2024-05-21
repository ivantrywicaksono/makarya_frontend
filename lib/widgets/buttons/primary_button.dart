part of widgets;

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton.filled(
        borderRadius: BorderRadius.circular(12),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
