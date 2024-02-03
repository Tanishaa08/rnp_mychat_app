import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    setRotation(90);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void setRotation(int degrees) {
    final angle = degrees * 3.14 / 180;

    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: animation,
          child: Image.asset(
            'assets/images/RnP_image.png',
            width: 380,
            height: 600,
          ),
          builder: (context, child) => Transform.rotate(
            angle: animation.value,
            child: child,
          ),
        ),
        const SizedBox(
          height: 0.05,
        ),
        const Text(
          'Solution for your chat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
        const Text(
          'application system',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          '"Now it is very easy to find your people.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 05,
        ),
        const Text(
          'We have an app for your experience."',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 182, 149, 190),
              padding: const EdgeInsets.symmetric(
                  horizontal: 100 * 1.5, vertical: 18),
            ),
            onPressed: () {
              _ModalBottomSheet(context);
              setRotation(180);
              controller.forward(from: 0);
            },
            child: const Text('Get Started')),
      ],
    );
  }

  void _ModalBottomSheet(context) {
    final _formSignInKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (BuildContext) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formSignInKey,
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(right: 273, top: 20),
                          height: 50,
                          child: const Text(
                            "Username",
                            style: TextStyle(
                                fontFamily: 'Monteserrat',
                                color: Color.fromARGB(255, 7, 32, 94),
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: TextFormField(
                              style: const TextStyle(fontSize: 16),
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              decoration: const InputDecoration(
                                  filled: true,
                                  border: InputBorder.none,
                                  fillColor: Color.fromARGB(255, 244, 255, 255),
                                  hintText: "Type here",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 273, top: 8),
                          height: 50,
                          child: const Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: 'Monteserrat',
                                color: Color.fromARGB(255, 7, 32, 94),
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              autofocus: false,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color.fromARGB(255, 244, 255, 255),
                                  filled: true,
                                  hintText: "Type here",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password can't be empty";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 alphanumeric code";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          height: 166,
                        ),
                        Container(
                          padding:const EdgeInsets.only(top: 25),
                          height: 80,
                          width: 356,
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 182, 149, 190),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100 * 1.5, vertical: 18),
                              ),
                              onPressed: () {
                                
                              },
                              child: const Text('Login')),
                        )
                      ])))),
            ),
          );
        });
  }
}
