import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista/data/jsonUser.dart';
import 'package:lista/models/user.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...JSON_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(user == null){
      return;
    }

    //alterar
    if(user.id.trim().isNotEmpty && _items.containsKey(user.id)){
      _items.update(user.id, 
        (value) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl 
        )
      );

    }else{
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, 
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        )
      );
    }

    notifyListeners();
  }

  void remove(User user){
    _items.remove(user.id);
    notifyListeners();
  }

}