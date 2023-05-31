
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista/models/user.dart';
import 'package:lista/provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user){
      _formData['id'] = user.id ?? '';
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
  }

  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User? ?? const User(id: '', name: '', email: '', avatarUrl: '');

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    email: _formData['email'] ?? '',
                    avatarUrl: _formData['avatarUrl'] ?? '',
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length <= 3) {
                    return 'Nome pequeno. Mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  // Adicione seu validador de e-mail aqui
                  return null; // ou retorne uma mensagem de erro, se necessário
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                validator: (value) {
                  // Adicione seu validador de URL aqui
                  return null; // ou retorne uma mensagem de erro, se necessário
                },
                onSaved: (value) => _formData['urlAvatar'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
