import 'package:flutter/material.dart';
import 'package:flutter_catalog/news_app/screens/news_screen.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var emailText = TextEditingController();
  var passText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          SizedBox(
              height: 300, child: Image.asset("assets/images/hey_img.png")),
          RichText(
            text: TextSpan(
              text: 'Login',
              style: const TextStyle(color: Colors.black, fontSize: 35),
              children: [
                TextSpan(
                  text: ' Here',
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 35),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: emailText,
                  decoration: InputDecoration(
                    labelText: 'Enter email address',
                    prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.deepPurpleAccent,
                      ),
                  ),
                  
                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: passText,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                     prefixIcon: Icon(
                        Icons.password,
                        color: Colors.deepPurpleAccent,
                      ),
                  ),
                  obscureText: true,
                ),

                SizedBox(
                  height: 20,
                ),
                
                PrettyCapsuleButton(
                  foregroundColor: Colors.black,
                  bgColor: Colors.deepPurpleAccent,
                  label: 'Login'.toUpperCase(),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
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
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
