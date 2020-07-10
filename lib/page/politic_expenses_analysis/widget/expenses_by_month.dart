import 'package:flutter/material.dart';

import '../../../core/domain/dto/despesa_mensal.dart';
import '../../../core/extension/extensions.dart';

class ExpensesByMonth extends StatefulWidget {
  ExpensesByMonth({this.despesasPorMes});

  final List<DespesaMensal> despesasPorMes;

  @override
  _ExpensesByMonthState createState() => _ExpensesByMonthState();
}

class _ExpensesByMonthState extends State<ExpensesByMonth>
    with SingleTickerProviderStateMixin {
  //TODO: this should come from remote
  final double max = 80000;

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getMonthsWidgets(context),
    );
  }

  List<Widget> _getMonthsWidgets(BuildContext context) {
    final width = context.screenWidth;
    final containerSize = width - 20;
    return widget.despesasPorMes.map(
      (despesa) {
        final ratio = despesa.valor / max;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                height: 35,
                width: containerSize,
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (_, __) => Container(
                  color: Colors.yellow,
                  height: 35,
                  width: _animation.value * (ratio * containerSize),
                ),
              ),
              Container(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        despesa.nomeMes,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        despesa.valor.toString().formatCurrency(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).toList();
  }
}
