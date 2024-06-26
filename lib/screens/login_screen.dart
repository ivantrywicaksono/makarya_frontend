part of screens;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailController =
      TextEditingController(text: 'ivan@me.com');
  // TextEditingController(text: 'community@example.com');
  TextEditingController _passwordController =
      TextEditingController(text: 'password');
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
              controller: _emailController,
              label: 'Email',
              placeholder: 'Masukkan email Anda',
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
                onPressed: () {
                  User user = User(
                    id: 0,
                    name: '',
                    email: _emailController.text,
                    password: _passwordController.text,
                    role: '',
                  );
                  context.read<UserProvider>().login(user).then((_) {
                    String role = context.read<UserProvider>().user.role;

                    if (role == 'Artist')
                      context.go('/');
                    else if (role == 'Community') context.go('/home-komunitas');
                    // else if (role == 'Goverment') context.go('/pengajuan');
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login gagal: $error")));
                  });
                },
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
