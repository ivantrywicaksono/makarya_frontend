part of screens;

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();
  String _tipeAkunValue = 'Artist'; // Value untuk DropdownButtonFormField
  final _nomorTeleponController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  @override
  void dispose() {
    _nomorTeleponController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _konfirmasiPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    User newUser = User(
      id: 0,
      name: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      role: _tipeAkunValue,
    );

    context.read<UserProvider>().register(newUser, _nomorTeleponController.text).then(
      (_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registrasi berhasil")));
        context.go('/login');
      },
    ).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registrasi gagal: $error")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              "Daftar",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
              )),
            ),
            SizedBox(height: 18),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tipe Akun',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 4.0),
                      DropdownButtonFormField<String>(
                        isDense: true,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        value: _tipeAkunValue,
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Artist',
                            child: Text(
                              'Pengguna',
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Community',
                            child: Text(
                              'Komunitas',
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _tipeAkunValue = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  LabelInput(
                    label: 'Username',
                    placeholder: 'Masukkan username Anda',
                    controller: _usernameController,
                    type: TextInputType.name,
                  ),
                  LabelInput(
                    label: 'Nomor Telepon',
                    placeholder: '628xxxxxxxxxx',
                    controller: _nomorTeleponController,
                    type: TextInputType.phone,
                  ),
                  LabelInput(
                    label: 'Email',
                    placeholder: 'user@example.com',
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                  ),
                  LabelInput(
                    label: 'Kata Sandi',
                    placeholder: 'Masukkan kata sandi',
                    controller: _passwordController,
                    type: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  LabelInput(
                    label: 'Konfirmasi Kata Sandi',
                    placeholder: 'Ketik ulang kata sandi Anda',
                    controller: _konfirmasiPasswordController,
                    type: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  SizedBox(height: 18),
                  PrimaryButton(
                    text: 'Daftar',
                    onPressed: _submitForm,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun?',
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () => context.go('/login'),
                        child: Text(
                          'Masuk',
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
          ],
        ),
      ),
    );
  }
}
