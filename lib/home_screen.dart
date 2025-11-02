import 'package:flutter/material.dart';
import 'package:task_02/create_player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: 24),
          child: Image(
            image: AssetImage('assets/images/logo_psm.png'),
            // fit: BoxFit.fill,
            height: 64,
            width: 64,
          ),
        ),
        title: Text(
          'PSM App',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 24),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Pertandingan PSM Makassar',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PSM Makassar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'VS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Madura United',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Text('Tanggal: 02 November 2025'),
                    Text('Waktu: 15:30 WIB'),
                    Text('Lokasi: Stadion B.J. Habibie'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            Text(
              'Menu',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePlayerScreen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                        size: 36,
                      ),
                      Text('Player'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).colorScheme.primary,
                        size: 36,
                      ),
                      Text('Jadwal'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.leaderboard,
                        color: Theme.of(context).colorScheme.primary,
                        size: 36,
                      ),
                      Text('Klasemen'),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.store,
                        color: Theme.of(context).colorScheme.primary,
                        size: 36,
                      ),
                      Text('Merchandise'),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            Text(
              'Berita Terbaru PSM Makassar',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'PSM Makassar Resmi Rekrut Pemain Baru',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'PSM Makassar telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'PSM Makassar Resmi Rekrut Pemain Baru',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'PSM Makassar telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'PSM Makassar Resmi Rekrut Pemain Baru',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'PSM Makassar telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 24),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'PSM Makassar Resmi Rekrut Pemain Baru',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'PSM Makassar telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
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
    );
  }
}
