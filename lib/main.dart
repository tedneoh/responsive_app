import 'package:flutter/material.dart';
import 'package:responsive_app/src/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Responsive App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: LayoutBuilder(builder: ((context, constraints) {
          if (constraints.maxWidth > 500) {
            return WideLayout();
          } else {
            return NarrowLayout();
          }
        })));
  }
}

class UsersList extends StatelessWidget {
  void Function(User) onUserTap;

  UsersList({Key? key, required this.onUserTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = AdaptiveSize().getWidth(context, true);
    double paddingSize = AdaptiveSize().getWidth(context, false);

    return ListView(
      children: <Widget>[
        for (var user in users)
          Padding(
            padding: EdgeInsets.all(paddingSize),
            child: ListTile(
              title: Text(user.name, style: TextStyle(fontSize: textSize),),
              onTap: () => onUserTap(user),
            ),
          )
      ],
    );
  }
}

class UserDetail extends StatelessWidget {
  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = AdaptiveSize().getWidth(context, true);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.name, style: TextStyle(fontSize: textSize),),
          Text(user.phone, style: TextStyle(fontSize: textSize),),
          Text(user.gender, style: TextStyle(fontSize: textSize),),
          Text(user.company, style: TextStyle(fontSize: textSize),),
          Text(user.email, style: TextStyle(fontSize: textSize),),
        ],
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UsersList(
        onUserTap: (user) => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: UserDetail(
                    user: user,
                  ),
                ))));
  }
}

class WideLayout extends StatefulWidget {

  const WideLayout({Key? key}) : super(key: key);

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  User? _user;

  @override
  Widget build(BuildContext context) {
    double textSize = AdaptiveSize().getWidth(context, true);

    return Row(
      children: [
        Expanded(
          child: UsersList(
              onUserTap: (user) => setState(() {
                    _user = user;
                  })),
          flex: 2,
        ),
        Expanded(
          child: _user == null
              ? Center(
                  child: Text('No data selected', style: TextStyle(fontSize: textSize),)
                )
              : UserDetail(user: _user!),
          flex: 3,
        )
      ],
    );
  }
}

class AdaptiveSize {

      AdaptiveSize();

      late final double _textSize;
      late final double _padding;

      getWidth(BuildContext context, bool textSize) {
        if (MediaQuery.of(context).size.width > 500) {
          if (MediaQuery.of(context).size.width < 800) {
            _textSize = 12; //foldable
            _padding = 5;
          }else if (MediaQuery.of(context).size.width < 1100){
            _textSize = 18; //tablet
            _padding = 10;
          }else {
            _textSize = 20; //dekstop
            _padding = 16;
          }
        }else {
          _textSize = 16; //mobile
          _padding = 5;
        }

        if (textSize) {
          print(_textSize);
          return _textSize;
        }else {
          print(_padding);
          return _padding;
        }
      }

      // getadaptiveTextSize(BuildContext context) {
      //   if (MediaQuery.of(context).size.width < 1100) {
      //     if (MediaQuery.of(context).size.width < 1000) {
      //       size = 12; //foldable
      //       return size;
      //     }else if (MediaQuery.of(context).size.width < 1100){
      //       size = 18; //tablet
      //       return size;
      //     }else {
      //       size = 20; //dekstop
      //       return size;
      //     }
      //   }else {
      //     size = 16; //mobile
      //     return size;
      //   }
      // }

    // getadaptivePaddingSize(BuildContext context) {
    //     if (MediaQuery.of(context).size.width  > 500) {
    //       if (MediaQuery.of(context).size.width < 1000) {
    //         size = 5; //foldable
    //         return size;
    //       }else if (MediaQuery.of(context).size.width < 1100){
    //         size = 10; //tablet
    //         return size;
    //       }else {
    //         size = 16; //dekstop
    //         return size;
    //       }
    //     }else {
    //       size = 5; //mobile
    //       return size;
    //     }
    // }
}

class AdaptivePaddingSize {
      AdaptivePaddingSize();

      late final double size;

      getadaptivePaddingSize(BuildContext context) {
        if (MediaQuery.of(context).size.width  > 500) {
          if (MediaQuery.of(context).size.width < 1000) {
            size = 5; //foldable
            return size;
          }else if (MediaQuery.of(context).size.width < 1100){
            size = 10; //tablet
            return size;
          }else {
            size = 16; //dekstop
            return size;
          }
        }else {
          size = 5; //mobile
          return size;
        }
      }
}