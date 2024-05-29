part of widgets;

class FollowMeButton extends StatelessWidget {
  final bool isFollowed;
  final VoidCallback onPressed;

  const FollowMeButton(
      {super.key, this.isFollowed = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color fillColor = isFollowed ? Colors.white : Utils.primaryColor;
    Color outlineColor = isFollowed ? Utils.primaryColor : Colors.white;
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: AnimatedContainer(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
          // width: MediaQuery.of(context).size.width/2,
          height: 50.0,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: outlineColor),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isFollowed
                    ? Text(
                        'Diikuti',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: outlineColor,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    : TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('Ikuti'),
                      )
                // Row(
                //     children: [
                //       Icon(Icons.add, size: 12, color: outlineColor),
                //       const SizedBox(width: 4),
                //       Text(
                //         'Ikuti',
                //         style: GoogleFonts.poppins(
                //           textStyle: TextStyle(
                //             color: outlineColor,
                //             fontSize: 12.0,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
