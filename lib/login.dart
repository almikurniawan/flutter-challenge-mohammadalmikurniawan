import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userId = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  doLogin(){
    if(userId.text=="" || password.text==""){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Error"),
              content: Text("Tolong Lengkapi Form Login"),
              actions: <Widget>[
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("OK"))
              ],
            );
          }
      );
    }
    else{
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Success"),
              content: Text("Login Berhasil"),
              actions: <Widget>[
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("OK"))
              ],
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image(
              image: AssetImage('assets/header-login.png'),
              width: MediaQuery.of(context).size.width * 0.33,
            ),
            Image(
              image: AssetImage('assets/logo.png'),
              width: MediaQuery.of(context).size.width * 0.33,
            ),
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 20),
                Text("Please sign in to continuou."),
                SizedBox(height: 20),
                TextField(
                  controller: userId,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "User ID",
                      hintText: "User ID",
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Password",
                      hintText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      doLogin();
                    },
                    child: Text("LOGIN"),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor, // Background color
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.subtitle2!.merge(
                      TextStyle(color: Colors.red)
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
