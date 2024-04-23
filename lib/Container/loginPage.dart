import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertest/Container/homePage.dart';
import 'package:fluttertest/Logic/Authentication.dart';
import 'package:fluttertest/Service/http.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String text = '';
  void getDataUser()async{
    HttpRequest instance =  HttpRequest();
    await instance.getData();
    setState(() {
      text = instance.name;
    });
  }
  @override
  void initState(){
    super.initState();
    getDataUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              ),
              Text(text,style: TextStyle(fontSize: 50),),
              Padding(
                padding: EdgeInsets.fromLTRB(50,0,50,10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                    hintText: 'Enter Username',
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please input value';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50,0,50,10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12)
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                    hintText: 'Enter Password',
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please input value';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        }
                      },
                      child: Text('Submit')
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        bool auth = await Auth.authentication();
                        print('Authentication now');
                        if(auth){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        }
                      },
                      child: Text('Biomatic Login')
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
