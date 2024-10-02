import 'package:flutter/material.dart';
import 'package:prak3/pages/HomePage.dart';
//import 'dummy_menu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _Username="";
  String _Password="";
  bool isLoginSuccess = false;
  _navigateToHome () async{
    await Future.delayed(Duration(seconds: 3), () {});
    setState(() {
    });
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => HomePage(
      username: _Username,
      )) 
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      appBar: AppBar(
        title: const Text("Login Page",
        style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 10, 124, 218),
      ),
      body: Container(
          // Set background color for the whole page
          constraints: BoxConstraints.expand(),
          color: const Color.fromARGB(255, 209, 234, 250),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  child: const Text('Halaman Login',
                  style: TextStyle(color:Color.fromARGB(255, 20, 31, 83), fontSize: 18, fontWeight: FontWeight.bold),
            ),),
                
                _usernameField(),
                _passwordField(),
                _loginbutton(context),
              ],
            ),
          ),
        )
    ),
    );
    
     
    
  
  }

Widget _usernameField(){
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          _Username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.blue ),
          )
        ),
      ),
    ),
  );
}

Widget _passwordField(){
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value){
          _Password = value;
        },
        decoration: const InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.blue),
        ),
            enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.blue ),
          )
      ),
    ),
  );
}

Widget _loginbutton(BuildContext context){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
    child: ElevatedButton(
      style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),
      onPressed: (){
        if(_Username=="Suryaningsih"&&_Password=="123"){
          _navigateToHome();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Berhasil")),
          );
          
        }
      },
      child: const Text('Login'),
      ),
  );
}
}

