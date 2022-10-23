abstract class DataBaseRequest {
  /// Таблица Роли
  ///
  /// Поля таблицы: Название роли
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: Логин, Пароль, Роль
  static const String tableUsers = 'Users';
  static const String tableBody = 'Body';
  static const String tableTransmission = 'Transmission';
  static const String tableColor = 'Color';
  static const String tableOwner = 'Owner';
  static const String tableFavorite = 'Favorite';
  static const String tableUserInfo = 'UserInfo';
  static const String tableCar = 'Car';
  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableBody,
    tableTransmission,
    tableColor,
    tableOwner,
    tableCar,
    tableFavorite,
    tableUserInfo,
  ];
  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableBody,
    _createTableTransmission,
    _createTableColor,
    _createTableOwner,
    _createTableCar,
    _createTableFavorite,
    _createTableUserInfo,
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL,"id_role" INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") on delete cascade,PRIMARY KEY("id"))';

  static const String _createTableBody =
      'CREATE TABLE "$tableBody" ("id" INTEGER,"body_name" TEXT NOT NULL UNIQUE,"number_of_doors" TEXT NOT NULL,PRIMARY KEY("id"))';

  static const String _createTableTransmission =
      'CREATE TABLE "$tableTransmission" ("id" INTEGER,"transmission_name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';

  static const String _createTableColor =
      'CREATE TABLE "$tableColor" ("id" INTEGER, "color_name" TEXT NOT NULL ,PRIMARY KEY("id"))';

  static const String _createTableOwner =
      'CREATE TABLE "$tableOwner" ("id" INTEGER,"surname" TEXT NOT NULL ,"name" TEXT NOT NULL ,"patronymic" TEXT NOT NULL ,"date_of_registartion" TEXT NOT NULL ,"date_of_de_registartion" TEXT NOT NULL ,PRIMARY KEY("id"))';
  static const String _createTableFavorite =
      'CREATE TABLE "$tableFavorite" ("id" INTEGER, INTEGER,"id_user" INTEGER,"id_car" INTEGER,FOREIGN KEY("id_car") REFERENCES "Car"("id") on delete cascade,FOREIGN KEY("id_user") REFERENCES "Users"("id") on delete cascade,PRIMARY KEY("id"))';

  static const String _createTableUserInfo =
      'CREATE TABLE "$tableUserInfo" ("id" INTEGER,"surname" TEXT NOT NULL ,"name" TEXT NOT NULL ,"patronymic" TEXT NULL ,"date_of_birth" TEXT NOT NULL,FOREIGN KEY("id") REFERENCES "Users"("id") on delete cascade,PRIMARY KEY ("id"))';

  static const String _createTableCar =
      'CREATE TABLE "$tableCar" ("id" INTEGER NOT NULL UNIQUE,"engine_number" TEXT NOT NULL UNIQUE,"release_date_of_car" TEXT NOT NULL ,"price" INTEGER NOT NULL ,"id_car_body" INTEGER,"id_owner" INTEGER,"id_transmission" INTEGER,"id_color" INTEGER,FOREIGN KEY("id_car_body") REFERENCES "Body"("id") on delete cascade,FOREIGN KEY("id_owner") REFERENCES "Owner"("id") on delete cascade,FOREIGN KEY("id_color") REFERENCES "Color"("id") on delete cascade,FOREIGN KEY("id_transmission") REFERENCES "Transmission"("id") on delete cascade,PRIMARY KEY("id"))';

  static String deleteTable(String table) => 'DROP TABLE $table';
}
