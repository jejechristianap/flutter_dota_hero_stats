import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/home_mvvm/app_button.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/home_mvvm/home_page_state.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/home_mvvm/home_view_model.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/view.dart';

class HomeTestPage extends View<HomePageViewModel> {
  HomeTestPage({Key? key}) : super.model(HomePageViewModel(), key: key);

  @override
  State<HomeTestPage> createState() => _HomeTestPageState(viewModel);
}

class _HomeTestPageState extends ViewState<HomeTestPage, HomePageViewModel> {
  _HomeTestPageState(HomePageViewModel viewModel) : super(viewModel);

  @override
  Widget build(BuildContext context) {
    // StreamBuilder will automatically update the UI when the
    // stream emits a new value
    return StreamBuilder<HomePageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final state = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      const SizedBox(height: 32),
                      Text(
                        '${state.count}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: AppButton(
                              isEnabled: state.isMinusEnabled,
                              onTap: viewModel.minusButtonTapped,
                              child: Center(
                                child: Text(
                                  '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: AppButton(
                              isEnabled: state.isPlusEnabled,
                              onTap: viewModel.plusButtonTapped,
                              child: Center(
                                child: Text(
                                  '+',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
