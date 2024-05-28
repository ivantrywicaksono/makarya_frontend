part of widgets;

class RemindMeButton extends StatelessWidget {
  final bool isReminded;
  final VoidCallback onPressed;

  RemindMeButton({super.key, this.isReminded = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color fillColor = isReminded ? Colors.white : Utils.primaryColor;
    Color outlineColor = isReminded ? Utils.primaryColor : Colors.white;
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: outlineColor),
        ),
        child: Center(
          child: Text(
            isReminded ? 'Diingatkan' : 'Ingatkan Saya',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: outlineColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
