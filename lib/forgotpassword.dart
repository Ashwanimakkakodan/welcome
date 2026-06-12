import 'package:flutter/material.dart';
import 'package:welcome/login_screen.dart';
import 'package:welcome/service.dart';

class Forgotpassword extends StatelessWidget {
  TextEditingController emailc = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Forgotpassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: emailc,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!(value.contains("@") && value.contains("."))) {
                      return "Enter valid email";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    forgot(emailc.text, context);
                  },
                  child: Text("Recovery Link"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("back to login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
