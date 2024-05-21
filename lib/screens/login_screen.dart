part of screens;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(48),
        child: Column(
          children: [
            Text(
              "Masuk",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                )),
              ),
            // LabelInput(
            //     label: 'Username',
            //     placeholder: 'Masukkan username Anda tanpa menggunakan spasi'),
            // LabelInput(
            //     label: 'Kata Sandi', placeholder: 'Masukkan kata sandi akun Anda'),
            // TextButton(onPressed: () => context.go('/'), child: Text("Masuk"))
            // Align(child: TextButton(),)
          ],
        ),
      ),
    );
  }
}
