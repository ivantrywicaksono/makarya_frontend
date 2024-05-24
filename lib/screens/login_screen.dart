part of screens;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(48),
        child: Column(
          children: [
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "Masuk",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            LabelInput(
              type: TextInputType.name,
              controller: _usernameController,
              label: 'Username',
              placeholder: 'Masukkan username Anda',
            ),
            LabelInput(
              type: TextInputType.visiblePassword,
              isObscured: true,
              controller: _passwordController,
              label: 'Kata Sandi',
              placeholder: 'Masukkan kata sandi akun Anda',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                // onPressed: () => context.go('/forget-password'),
                onPressed: () {},
                child: Text(
                  'Lupa kata sandi?',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: PrimaryButton(
                text: 'Masuk',
                onPressed: () => context.go('/'),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum memiliki akun?',
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  onPressed: () => context.go('/register'),
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
