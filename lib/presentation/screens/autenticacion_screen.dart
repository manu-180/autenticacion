import 'package:autenticacion/presentation/widgets/widgets_barril.dart';
import 'package:flutter/material.dart';

class AutenticacionScreen extends StatelessWidget {
  const AutenticacionScreen({super.key});

  static const name = "autenticacion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autenticacion"),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterLogo(size: 200,),
            SizedBox(height: 25,),
          
            _RegisterForm()
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  String? username;
  String? email;
  String? password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre completo", 
            hintText: "nombre y apellido",
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return "El nombre no puede estar vacio";
              if (value.length < 6) return "El nombre debe tener al menos 6 caracteres";
              return null;
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            label: "Mail", 
            hintText: "correo electronico",
            onChanged: (value) => email = value,
            validator: (value) {
              if(value == null || value.isEmpty) return "El email no puede estar vacio";
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', );
              if  (!emailRegExp.hasMatch(value) ) return "formato invalido";
              return null;
              
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            obscureText: true, 
            label: "Contraseña", 
            hintText: "ingrese contraseña",
            onChanged: (value) => password = value,
            validator: (value) {
              if(value == null || value.isEmpty) return "El nombre no puede estar vacio";
              if  (value.length < 6) return "El nombre debe tener al menos 6 caracteres";
              return null;
            },
          ),
          const SizedBox(height: 25),
          FilledButton.tonalIcon(
            onPressed: (){
              final isValue = _formKey.currentState!.validate();
              if (isValue) return;

              print("Los valores son : Nombre:$username, email: $email, contraseña:$password");
            }, 
            icon: const Icon(Icons.save), 
            label: const Text("Crear usuario")
            )
      
        ],
      ),
    );
  }
}