import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
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
  double maxQuota;

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    maxQuota = context.bloc<PoliticExpensesAnalysisBloc>().maxQuotaForState;
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
    final containerSize = 400.0;
    return widget.despesasPorMes.map(
      (despesa) {
        final ratio = despesa.valor / maxQuota;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          child: Stack(
            children: <Widget>[
              Container(
                height: 35,
                width: containerSize,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (_, __) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        despesa.valor.toString().formatCurrency(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
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
