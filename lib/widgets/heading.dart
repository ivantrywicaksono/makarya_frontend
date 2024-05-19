part of widgets;

class Heading extends StatelessWidget {
  final String heading;
  final String paragraph;
  const Heading({
    super.key,
    required this.heading,
    required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
          ),
          Text(
            paragraph,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
