import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:task_02/login_screen.dart';

enum Sex { man, woman }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneNumberEditingController = TextEditingController();
  Sex? _sex;
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _passwordConfirmationEditingController = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isPasswordConfirmationObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Selamat Datang Penggemar PSM!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  'Silahkan daftar untuk melanjutkan ke aplikasi Penggemar PSM Makassar.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                SizedBox(height: 12),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameEditingController,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          hintText: 'Masukkan nama Anda',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: _addressEditingController,
                        keyboardType: TextInputType.streetAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                          hintText: 'Masukkan alamat Anda',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Alamat tidak boleh kosong!";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: _phoneNumberEditingController,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          hintText: 'Masukkan nomor telepon Anda',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nomor telepon tidak boleh kosong!";
                          }

                          try {
                            final parsed = PhoneNumber.parse(
                              value,
                              callerCountry: IsoCode.ID,
                            );

                            if (!parsed.isValid(type: PhoneNumberType.mobile)) {
                              return "Masukkan nomor telepon yang valid!";
                            }
                          } on PhoneNumberException {
                            return "Masukkan nomor telepon yang valid!";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 12),

                      FormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return "Jenis kelamin tidak boleh kosong!";
                          }

                          return null;
                        },
                        builder: (field) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Jenis Kelamin',
                              errorText: field.errorText,
                              border: InputBorder.none,
                            ),

                            child: RadioGroup(
                              groupValue: _sex,
                              onChanged: (value) {
                                field.didChange(value);
                                setState(() {
                                  _sex = value;
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                      value: Sex.man,
                                      title: Text(
                                        'Laki-laki',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimaryContainer,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      value: Sex.woman,
                                      title: Text(
                                        'Perempuan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimaryContainer,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: _emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Masukkan email Anda',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email tidak boleh kosong!";
                          }

                          if (!EmailValidator.validate(value)) {
                            return "Masukkan email yang valid!";
                          }

                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: _passwordEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password tidak boleh kosong!";
                          }

                          if (value.length < 6) {
                            return "Password minimal 6 karakter!";
                          }

                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Masukkan password Anda',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordObscure = !_isPasswordObscure;
                              });
                            },
                            icon: Icon(
                              _isPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: _isPasswordObscure,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        controller: _passwordConfirmationEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Konfirmasi password tidak boleh kosong!";
                          }

                          if (value != _passwordEditingController.text) {
                            return "Password tidak sama!";
                          }

                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          hintText: 'Masukkan ulang password Anda',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordConfirmationObscure =
                                    !_isPasswordConfirmationObscure;
                              });
                            },
                            icon: Icon(
                              _isPasswordConfirmationObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: _isPasswordConfirmationObscure,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),

                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                                (route) => false,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.all(
                                Radius.circular(8),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Daftar',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sudah punya akun? '),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                      child: Text('Masuk disini!'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
