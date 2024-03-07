import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';

import '../../data/department_model.dart';

class DeptGridItem extends StatelessWidget {
  const DeptGridItem({
    super.key,
    required this.department,
    required this.onSelectDept,

  });

  final void Function() onSelectDept;
  final Department department;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectDept ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              department.color.withOpacity(0.55),
              department.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          department.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
