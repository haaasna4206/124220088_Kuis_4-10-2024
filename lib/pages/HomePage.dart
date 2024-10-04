import 'package:flutter/material.dart';
import 'dummy.dart';
import 'help_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String? nickname;

  HomePage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Barang"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 136, 174),
              const Color.fromARGB(255, 11, 57, 79)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _welcomeText(),
            Expanded(
              child: _buildItemList(context),  
            ),
            _logoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome, $username!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (nickname != null)
            Text(
              "Also Known as $nickname",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          SizedBox(height: 8),
          Text(
            "Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    return ListView.builder(
      itemCount: supermarketItemList.length + 1,  
      itemBuilder: (context, index) {
        if (index == 0) {
          // Tambahkan menu Bantuan di index 0
          return ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text("Panduan dan Dukungan"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman bantuan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage()),
              );
            },
          );
        } else {
          // Daftar item supermarket dimulai dari index 1
          final supermarketItem = supermarketItemList[index - 1];
          return SupermarketItemCard(supermarketItem: supermarketItem);
        }
      },
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 192, 0, 58),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Logout"),
      ),
    );
  }
}

class SupermarketItemCard extends StatelessWidget {
  final SupermarketItem supermarketItem;

  SupermarketItemCard({required this.supermarketItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                supermarketItem.imageUrls[0],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes!)
                          : null,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              supermarketItem.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 106, 0, 19),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Price: ${supermarketItem.price}',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 214, 132, 175),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Stock: ${supermarketItem.stock}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
