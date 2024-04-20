import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spisok_polzovatelei.dart';
import 'skelet.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // ignore: prefer_final_fields
  TextEditingController _usernameController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Проверка введенного логина и пароля
    for (var user in users) {
      if (user["username"] == username && user["password"] == password) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuyContainers(user: user)),
        );
        return;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка'),
        content: const Text('Неверный логин или пароль'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.color4,
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            color: CustomColor.color3,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'NEWEST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Логин',
                    labelStyle: const TextStyle(
                        color: Colors.white), // Цвет текста метки
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.white), // Цвет обводки при фокусе
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Цвет обводки при отсутствии фокуса
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    labelStyle: const TextStyle(
                        color: Colors.white), // Цвет текста метки
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors.white), // Цвет обводки при фокусе
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Цвет обводки при отсутствии фокуса
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.color1,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                  ),
                  onPressed: _login,
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
