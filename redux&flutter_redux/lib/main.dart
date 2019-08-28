import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_in_flutter/redux/app_state.dart';
import 'package:redux_in_flutter/redux/count/count_state.dart';
import 'package:redux_in_flutter/redux/store.dart';

import 'redux/count/count_action.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = createStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, CountState>(
              converter: (store) {
                return store.state.countState;
              },
              builder: (context, state) {
                return Text(
                  '${state.num}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () {
                      int num = store.state.countState.num +
                          int.parse(_textEditingController.text);
                      store.dispatch(MultiChangeAction(num: num));
                    };
                  },
                  builder: (context, callback) {
                    return IconButton(
                        icon: Icon(Icons.add), onPressed: callback);
                  },
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () {
                      int num = store.state.countState.num -
                          int.parse(_textEditingController.text);
                      store.dispatch(MultiChangeAction(num: num));
                    };
                  },
                  builder: (context, callback) {
                    return IconButton(
                        icon: Icon(Icons.remove), onPressed: callback);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
