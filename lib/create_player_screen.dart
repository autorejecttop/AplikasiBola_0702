import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_02/create_player_confirm_screen.dart';
import 'package:task_02/register_screen.dart';

class CreatePlayerScreen extends StatefulWidget {
  const CreatePlayerScreen({super.key});

  @override
  State<CreatePlayerScreen> createState() => _CreatePlayerScreenState();
}

class _CreatePlayerScreenState extends State<CreatePlayerScreen> {
  final _formKey = GlobalKey<FormState>();

  final _playerNameEditingController = TextEditingController();
  final _playerPositionEditingController = TextEditingController();
  final _playerNumberEditingController = TextEditingController();
  final _playerNationalityEditingController = TextEditingController();
  final _playerAgeEditingController = TextEditingController();
  final _playerHeightEditingController = TextEditingController();
  Sex? _playerSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Pemain Baru'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Form untuk menambahkan pemain baru akan ditempatkan di sini.',
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _playerNameEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama pemain',
                        labelText: 'Nama Pemain',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama pemain tidak boleh kosong!';
                        }

                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _playerPositionEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Masukkan posisi pemain',
                        labelText: 'Posisi Pemain',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Posisi pemain tidak boleh kosong!';
                        }

                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _playerNumberEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Masukkan nomor punggung pemain',
                        labelText: 'Nomor Punggung',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor punggung tidak boleh kosong!';
                        }

                        var temp = int.tryParse(value);
                        if (temp == null || temp <= 0) {
                          return "Masukkan nomor punggung yang valid!";
                        }

                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _playerNationalityEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Masukkan kewarganegaraan pemain',
                        labelText: 'Kewarganegaraan',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kewarganegaraan tidak boleh kosong!';
                        }

                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _playerAgeEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Masukkan usia pemain',
                        labelText: 'Usia Pemain',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Usia pemain tidak boleh kosong!';
                        }

                        var temp = int.tryParse(value);
                        if (temp == null || temp <= 0) {
                          return "Masukkan usia pemain yang valid!";
                        }

                        return null;
                      },
                    ),

                    TextFormField(
                      controller: _playerHeightEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukkan tinggi pemain (cm)',
                        labelText: 'Tinggi Pemain (cm)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tinggi pemain (cm) tidak boleh kosong!';
                        }

                        var temp = double.tryParse(value);
                        if (temp == null || temp <= 0) {
                          return "Masukkan tinggi pemain (cm) yang valid!";
                        }

                        return null;
                      },
                    ),

                    FormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) {
                          return 'Jenis kelamin tidak boleh kosong!';
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
                            groupValue: _playerSex,
                            onChanged: (value) {
                              field.didChange(value);
                              setState(() {
                                _playerSex = value;
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

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreatePlayerConfirmScreen(
                                  playerName: _playerNameEditingController.text,
                                  playerPosition:
                                      _playerPositionEditingController.text,
                                  playerNumber: int.parse(
                                    _playerNumberEditingController.text,
                                  ),
                                  playerNationality:
                                      _playerNationalityEditingController.text,
                                  playerAge: int.parse(
                                    _playerAgeEditingController.text,
                                  ),
                                  playerHeightInCm: double.parse(
                                    _playerHeightEditingController.text,
                                  ),
                                  playerSex: _playerSex!,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'Tambah Pemain',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
