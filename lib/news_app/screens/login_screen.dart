import 'package:flutter/material.dart';
import 'package:flutter_catalog/news_app/screens/news_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailText = TextEditingController();
  var passText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 400,
          height: 350,
          child: Card(
            elevation: 18,
            shadowColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'LOGIN FORM',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailText,
                    decoration: InputDecoration(
                      labelText: 'Enter Email Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2)),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passText,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2)),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 229, 5, 5),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                      ),
                      onPressed: () {
                        String uEmail = emailText.text.toString();
                        String uPass = passText.text.toString();

                        // Hardcoded credentials for demonstration
                        const String correctEmail = "rudra@gmail.com";
                        const String correctPassword = "rudra";

                        if (uEmail == correctEmail &&
                            uPass == correctPassword) {
                          print('Login successful');
                          // Navigate to the next screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsScreen()),
                          );
                        } else {
                          print('Invalid credentials');
                          // Show an alert dialog for invalid login
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'Invalid Email or Password. Please try again.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }, child: Text('Login', style: const TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
