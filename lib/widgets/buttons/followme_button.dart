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
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: outlineColor),
        ),
        child: isFollowed
            ? TextButton(
                onPressed: onPressed,
                child: Text(
                  'Diikuti',
                  style: Utils.textStyle(color: outlineColor),
                ),
              )
            : TextButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.add,
                  size: 14,
                  color: outlineColor,
                ),
                label: Text(
                  'Ikuti',
                  style: Utils.textStyle(color: outlineColor),
                ),
              ),
      ),
    );
  }
}
