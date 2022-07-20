import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/view_model.dart';
import 'package:logger/logger.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

abstract class View<VM extends ViewModel> extends StatefulWidget {
  final VM viewModel;

  const View.model(this.viewModel, {Key? key}) : super(key: key);
}

abstract class ViewState<V extends View, VM extends ViewModel> extends State<V>
    with RouteAware {
  late final VM _viewModel;
  late final Logger logger;

  VM get viewModel => _viewModel;

  String get _sanitisedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  @mustCallSuper
  ViewState(this._viewModel) {
    logger = Logger();
    logger.v('Created $runtimeType.');
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // subscribe for the change of route
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @mustCallSuper
  @override
  void didPopNext() {
    logger.v('🚚 $_sanitisedRoutePageName didPopNext');
    viewModel.routingDidPopNext();
  }

  /// Called when the current route has been pushed.
  @mustCallSuper
  @override
  void didPush() {
    logger.v('🚚 $_sanitisedRoutePageName didPush');
    viewModel.routingDidPush();
  }

  /// Called when the current route has been popped off.
  @mustCallSuper
  @override
  void didPop() {
    logger.v('🚚 $_sanitisedRoutePageName didPop');
    viewModel.routingDidPop();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @mustCallSuper
  @override
  void didPushNext() {
    logger.v('🚚 $_sanitisedRoutePageName didPushNext');
    viewModel.routingDidPushNext();
  }

  @mustCallSuper
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    logger.v('Disposing $runtimeType.');
    viewModel.dispose();
    super.dispose();
  }
}
