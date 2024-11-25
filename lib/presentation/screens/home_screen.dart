import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autenticacion"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 180,
            height: 50,
          child: FloatingActionButton(
            onPressed: () {
              context.push("/autenticacion");
              }, 
            child:  const Text("Crear usuario")
            ),
        )]
      ),
    );
  }
}

