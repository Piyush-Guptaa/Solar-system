import "package:flutter/material.dart";

class LandingPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LandingPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, '/home');
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
       Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/sky.jpg"),fit: BoxFit.cover,)
          )
       ),
        Center(
          child: Material(
            // textStyle: Colors.white,
            color: Colors.transparent,
            // color: context.canvasColor,
            
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                        "Welcome $name",
                        
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,                    
                        ),
                      ), 
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Column(
                        children: [
                          TextFormField(
                        
                          style: TextStyle(color: Colors.white),
                        
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                ),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border:
                                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              hintText: "Enter username",
                              hintStyle: TextStyle(
                                color: Colors.white,
                               ),
                              labelText: "Username",
                              labelStyle: TextStyle(
                              color: Colors.white
                                )
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username cannot be empty";
                              }

                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                          ),
                          SizedBox(height: 25.0,),
                          TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                ),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border:
                                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                               ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                              color: Colors.white
                                )
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 6) {
                                return "Password length should be atleast 6";
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Material(
                            shadowColor: Colors.white,
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () => moveToHome(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: changeButton ? 50 : 150,
                                height: 50,
                                alignment: Alignment.center,
                                child: changeButton
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
