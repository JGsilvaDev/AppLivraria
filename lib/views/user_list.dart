import 'package:flutter/material.dart';
import 'package:lista/components/user_tile.dart';
import 'package:lista/provider/users.dart';
import 'package:lista/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget{
  const UserList({super.key});

  @override
  Widget build(BuildContext context){
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuario'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            }, 
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}