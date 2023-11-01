import 'package:cargo/logic/user/model/role_model.dart';

List<RoleModel> myPermissions = [
  const RoleModel(
    systemId: "users",
    systemName: "Users",
    action: [
      'user_view',
      'user_create',
      'user_delete',
      'user_restore',
      'user_force_delete'
    ],
    allowRole: ['admin'],
  ),
  const RoleModel(systemId: 'employees', systemName: 'کارمندان', action: [
    'employee_view',
    'employee_create',
    'employee_delete',
    'employee_restore',
    'employee_force_delete'
  ], allowRole: [
    'admin'
  ]),
  const RoleModel(
    systemId: 'salaries',
    systemName: 'معاشات',
    action: [
      'salary_view',
      'salary_create',
      'salary_delete',
      'salary_restore',
      'salary_force_delete'
    ],
    allowRole: ['admin', 'finance_manager'],
  ),
  const RoleModel(
    systemId: 'exchanges',
    systemName: 'حواله',
    action: [
      'exchange_view',
      'exchange_create',
      'exchange_delete',
      'exchange_restore',
      'exchange_force_delete'
    ],
    allowRole: ['admin', 'finance_manager', 'bank_manager'],
  ),
  const RoleModel(
    systemId: 'orders',
    systemName: 'سفارشات',
    action: [
      'order_view',
      'order_create',
      'order_delete',
      'order_restore',
      'order_force_delete'
    ],
    allowRole: ['admin', 'finance_manager'],
  ),
  const RoleModel(
    systemId: 'cars',
    systemName: 'موتر ها',
    action: [
      'car_view',
      'car_create',
      'car_delete',
      'car_restore',
      'car_force_delete'
    ],
    allowRole: ['admin', 'finance_manager'],
  ),
  const RoleModel(
    systemId: 'incomes',
    systemName: 'رفت و آمد',
    action: [
      'income_view',
      'income_create',
      'income_delete',
      'income_restore',
      'income_force_delete'
    ],
    allowRole: ['admin', 'finance_manager'],
  )
];
