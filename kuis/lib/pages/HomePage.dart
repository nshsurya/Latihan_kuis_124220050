
import 'package:flutter/material.dart';
import 'dummy_menu.dart'; // 

class HomePage extends StatelessWidget {
  final String username;


  HomePage({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu",
         style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 10, 124, 218),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
            Text(
              'Selamat Datang,  $username!',
              style: TextStyle(color:Colors.blue[900], fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          //Text("Selamat datang ! $username"),
         // Text("Ini adalah halaman Home"),
      Expanded(
      child : ListView.builder(
        itemCount: foodMenuList.length,
        itemBuilder: (context, index) {
          final food = foodMenuList[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                food.imageAsset,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(food.name),
              subtitle: Text('${food.category} - ${food.price}'),
              trailing: IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  _showFoodDetails(context, food);
                },
              ),
            ),
          );
        },
      ),
      ),
      Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the login page or previous page
                },
                style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue[900]),
              foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),

                child: Text('Logout'),
              ),
            ),
          ),
        ]
    ),
      
    );
    
  }

  void _showFoodDetails(BuildContext context, FoodMenu food) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(food.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Category: ${food.category}'),
              Text('Description: ${food.description}'),
              Text('Ingredients: ${food.ingredients}'),
              Text('Cooking Time: ${food.cookingTime}'),
              Text('Price: ${food.price}'),
              SizedBox(height: 10),
              Image.asset(food.imageAsset, fit: BoxFit.cover),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}