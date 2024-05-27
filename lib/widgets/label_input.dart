part of widgets;

class LabelInput extends StatelessWidget {
  final String label, placeholder;

  final TextEditingController controller;
  final TextInputType type;
  final bool isObscured;

  const LabelInput({
    super.key,
    required this.label,
    this.placeholder = '',
    required this.controller,
    required this.type,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          CupertinoTextField(
            obscureText: isObscured,
            keyboardType: type,
            controller: controller,
            placeholder: placeholder,
            style: GoogleFonts.poppins(),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Utils.getPrimaryColor(context)),
            ),
          ),
        ],
      ),
    );
  }
}
