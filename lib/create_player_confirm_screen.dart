import 'package:flutter/material.dart';
import 'package:task_02/home_screen.dart';
import 'package:task_02/register_screen.dart';

class CreatePlayerConfirmScreen extends StatelessWidget {
  final String playerName;
  final String playerPosition;
  final int playerNumber;
  final String playerNationality;
  final int playerAge;
  final double playerHeightInCm;
  final Sex playerSex;

  const CreatePlayerConfirmScreen({
    super.key,
    required this.playerName,
    required this.playerPosition,
    required this.playerNumber,
    required this.playerNationality,
    required this.playerAge,
    required this.playerHeightInCm,
    required this.playerSex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pemain'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: $playerName',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Posisi: $playerPosition',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Nomor: $playerNumber',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Kebangsaan: $playerNationality',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Usia: $playerAge',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Tinggi: ${(playerHeightInCm / 100).toStringAsFixed(2)} m',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Jenis Kelamin: ${playerSex == Sex.man ? 'Laki-laki' : 'Perempuan'}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
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
    );
  }
}
