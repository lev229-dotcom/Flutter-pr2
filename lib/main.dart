import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';
import 'package:flutter_application_1/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/domain/cubit/role_auth_cubit.dart';
import 'package:flutter_application_1/domain/entity/role_entity.dart';
import 'package:flutter_application_1/domain/usercases/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'core/db/data_base_helper.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => RoleAuthCubit())],
      child: BlocBuilder<RoleAuthCubit, RoleAuthState>(
        builder: (context, state) {
          return MaterialApp(
              title: "Pr4Dop",
              onGenerateRoute: router.generateRouter,
              initialRoute: log,
              theme: context.read<RoleAuthCubit>().themeData);
        },
      ),
    );
    // return MaterialApp(
    //   onGenerateRoute: router.generateRouter,
    //   initialRoute: log,
    // );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: Column(children: [
            Text('SignIn'),
            TextFormField(
              maxLength: 25,
              controller: _loginController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Почта не должна быть пустым';
                }
                if (value.length < 5) {
                  return 'Почта должна быть не менее 5 символов';
                }
                if (value.contains(RegExp(r"[а-яА-Я]"), 0)) {
                  return 'Только английские символы ';
                }
              },
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              maxLength: 20,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пароль не должен быть пустым';
                }
                if (value.length < 5) {
                  return 'Пароль должен быть не менее 5 символов';
                }
                if (value.contains(RegExp(r"[а-яА-Я]"), 0)) {
                  return 'Только английские символы ';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Пароль',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    signIn();
                  } else {}
                },
                child: const Text(
                  "Вход",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, reg);
                  },
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void signIn() async {
    final AuthRepositoiriesImpl auth = AuthRepositoiriesImpl();
    var result = await Auth(auth).signIn(AuthParamsLogin(
        login: _loginController.text, password: _passwordController.text));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка. Некорректные данные")),
      );
    }, (r) {
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushReplacementNamed(context, adminpage);
            break;
          }
        case RoleEnum.user:
          {
            Navigator.pushReplacementNamed(context, userpage);
            break;
          }
      }
    });
  }
}

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();
  TextEditingController _dateofbirthController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),
                const Spacer(),

                TextFormField(
                  maxLength: 25,
                  controller: _loginController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Логин не должен быть пустым';
                    }
                    if (value.length < 5) {
                      return 'Логин должен быть не менее 5 символов';
                    }
                    if (value.contains(RegExp(r"[а-яА-Я]"), 0)) {
                      return 'Только английские символы ';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),

                TextFormField(
                  maxLength: 30,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пароль не должен быть пустым';
                    }
                    if (value.length < 5) {
                      return 'Пароль должен быть не менее 5 символов';
                    }
                    if (value.contains(RegExp(r"[а-яА-Я0]"), 0)) {
                      return 'Только английские символы ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Пароль',
                    border: OutlineInputBorder(),
                  ),
                ),
                //Фамилия
                TextFormField(
                  maxLength: 50,
                  controller: _surnameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Фамилия не должна быть пустым';
                    }
                    if (value.length < 2) {
                      return 'Фамилия должна быть не менее 2 символов';
                    }
                    if (value.contains(RegExp(r"[A-Za-z]"), 0)) {
                      return 'Только русские символы';
                    }
                    if (value.contains(RegExp(r'[0-9]'), 0)) {
                      return 'Цифры недопустимы';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Фамилия',
                    border: OutlineInputBorder(),
                  ),
                ),
                //Имя
                TextFormField(
                  maxLength: 50,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Имя не должно быть пустым';
                    }
                    if (value.length < 2) {
                      return 'Имя должно быть не менее 2 символов';
                    }
                    if (value.contains(RegExp(r"[A-Za-z]"), 0)) {
                      return 'Только русские символы';
                    }
                    if (value.contains(RegExp(r'[0-9]'), 0)) {
                      return 'Цифры недопустимы';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Имя',
                    border: OutlineInputBorder(),
                  ),
                ),
                //Отчество
                TextFormField(
                  maxLength: 50,
                  controller: _patronymicController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Отчество не должно быть пустым';
                    }
                    if (value.length < 6) {
                      return 'Отчество должно быть не менее 6 символов';
                    }
                    if (value.contains(RegExp(r"[A-Za-z]"), 0)) {
                      return 'Только русские символы';
                    }
                    if (value.contains(RegExp(r'[0-9]'), 0)) {
                      return 'Цифры недопустимы';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Отчество',
                    border: OutlineInputBorder(),
                  ),
                ),
                //Дата рождения
                TextField(
                  controller: _dateofbirthController,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: false,

                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);

                      _dateofbirthController.text = formattedDate;
                    } else {}
                  },
                ),

                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        signUp();
                      } else {}
                    },
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, log),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final AuthRepositoiriesImpl auth = AuthRepositoiriesImpl();

    var result = await Auth(auth).signUp(AuthParams(
        login: _loginController.text,
        password: _passwordController.text,
        date_of_birth: _dateofbirthController.text,
        name: _nameController.text,
        patronymic: _patronymicController.text,
        surname: _surnameController.text));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Ошибка"),
        ),
      );
    }, (r) {
      Navigator.pushNamed(context, log);
    });
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoleAuthCubit, RoleAuthState>(
        builder: (context, state) {
          if (state is RoleAuthState) {
            context.read<RoleAuthCubit>().changeTheme(1);
          }
          return Column(children: [
            Text('Экран админа'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, log);
                },
                child: Text('Обратно')),
          ]);
        },
      ),

      // body: Column(children: [
      //   Text('Это видит только админ'),
      //   ElevatedButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, log);
      //       },
      //       child: Text('Обратно'))
      // ]),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoleAuthCubit, RoleAuthState>(
        builder: (context, state) {
          if (state is RoleAuthState) {
            context.read<RoleAuthCubit>().changeTheme(2);
          }
          return Column(children: [
            Text('Это видит простой юзер'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, log);
                },
                child: Text('Обратно')),
          ]);
        },
      ),

      // body: Column(children: [
      //   Text('Это видит простой юзер'),
      //   ElevatedButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, log);
      //       },
      //       child: Text('Обратно')),
      // ]),
    );
  }
}
