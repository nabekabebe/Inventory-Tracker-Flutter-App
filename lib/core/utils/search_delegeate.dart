// import 'package:flutter/material.dart';
//
// enum _SearchBody {
//   suggestions,
//   results,
// }
//
// Future<T?> showPlatformSearch<T>({
//   required BuildContext context,
//   required AbstractSearchDelegate<T> delegate,
//   String? query = '',
// }) {
//   delegate.query = query ?? delegate.query;
//   delegate._currentBody = _SearchBody.suggestions;
//   return Navigator.of(context).push(_SearchPageRoute<T>(
//     delegate: delegate,
//   ));
// }
//
// abstract class AbstractSearchDelegate<T> {
//   final String? searchFieldLabel;
//   final TextStyle? searchFieldStyle;
//   final TextInputType? keyboardType;
//
//   AbstractSearchDelegate({
//     this.searchFieldLabel,
//     this.searchFieldStyle,
//     this.keyboardType,
//   }) : assert(searchFieldStyle == null);
//
//   final TextEditingController queryTextController = TextEditingController();
//
//   final ProxyAnimation _proxyAnimation =
//       ProxyAnimation(kAlwaysDismissedAnimation);
//
//   final ValueNotifier<_SearchBody?> _currentBodyNotifier =
//       ValueNotifier<_SearchBody?>(null);
//
//   _SearchPageRoute<T>? _route;
//
//   Animation<double> get transitionAnimation => _proxyAnimation;
//   FocusNode? focusNode;
//
//   String get query => queryTextController.text;
//
//   set query(String value) {
//     queryTextController.text = value;
//   }
//
//   _SearchBody? get _currentBody => _currentBodyNotifier.value;
//
//   set _currentBody(_SearchBody? value) {
//     _currentBodyNotifier.value = value;
//   }
//
//   void showResults(BuildContext context) {
//     focusNode?.unfocus();
//     _currentBody = _SearchBody.results;
//   }
//
//   void showSuggestions(BuildContext context) {
//     assert(focusNode != null,
//         '_focusNode must be set by route before showSuggestions is called.');
//     focusNode!.requestFocus();
//     _currentBody = _SearchBody.suggestions;
//   }
//
//   void close(BuildContext context, T result) {
//     _currentBody = null;
//     focusNode?.unfocus();
//     Navigator.of(context)
//       ..popUntil((Route<dynamic> route) => route == _route)
//       ..pop(result);
//   }
//
//   Widget buildSuggestions(BuildContext context);
//
//   Widget buildResults(BuildContext context);
//
//   Widget buildScaffold(Widget? body, BuildContext context);
// }
//
// class _SearchPageRoute<T> extends PageRoute<T> {
//   _SearchPageRoute({
//     required this.delegate,
//   }) {
//     assert(
//       delegate._route == null,
//       'The ${delegate.runtimeType} instance is currently used by another active '
//       'search. Please close that search by calling close() on the PlatformSearchDelegate '
//       'before opening another search with the same delegate instance.',
//     );
//     delegate._route = this;
//   }
//
//   final AbstractSearchDelegate<T> delegate;
//
//   @override
//   Color? get barrierColor => null;
//
//   @override
//   String? get barrierLabel => null;
//
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 300);
//
//   @override
//   bool get maintainState => false;
//
//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return FadeTransition(
//       opacity: animation,
//       child: child,
//     );
//   }
//
//   @override
//   Animation<double> createAnimation() {
//     final Animation<double> animation = super.createAnimation();
//     delegate._proxyAnimation.parent = animation;
//     return animation;
//   }
//
//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     return PlatformSearchWidget<T>(
//       delegate: delegate,
//       animation: animation,
//     );
//   }
//
//   @override
//   void didComplete(T? result) {
//     super.didComplete(result);
//     assert(delegate._route == this);
//     delegate._route = null;
//     delegate._currentBody = null;
//   }
// }
//
// class PlatformSearchWidget<T> extends StatefulWidget {
//   const PlatformSearchWidget({
//     required this.delegate,
//     this.animation,
//   });
//
//   final AbstractSearchDelegate<T> delegate;
//   final Animation<double>? animation;
//
//   @override
//   State<StatefulWidget> createState() => _PlatformSearchWidgetState<T>();
// }
//
// class _PlatformSearchWidgetState<T> extends State<PlatformSearchWidget<T>> {
//   FocusNode focusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     widget.delegate.queryTextController.addListener(_onQueryChanged);
//     widget.animation?.addStatusListener(_onAnimationStatusChanged);
//     widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
//     focusNode.addListener(_onFocusChanged);
//     widget.delegate.focusNode = focusNode;
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     widget.delegate.queryTextController.removeListener(_onQueryChanged);
//     widget.animation?.removeStatusListener(_onAnimationStatusChanged);
//     widget.delegate._currentBodyNotifier.removeListener(_onSearchBodyChanged);
//     widget.delegate.focusNode = null;
//     focusNode.dispose();
//   }
//
//   void _onAnimationStatusChanged(AnimationStatus status) {
//     if (status != AnimationStatus.completed) {
//       return;
//     }
//     widget.animation?.removeStatusListener(_onAnimationStatusChanged);
//     if (widget.delegate._currentBody == _SearchBody.suggestions) {
//       focusNode.requestFocus();
//     }
//   }
//
//   @override
//   void didUpdateWidget(PlatformSearchWidget<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.delegate != oldWidget.delegate) {
//       oldWidget.delegate.queryTextController.removeListener(_onQueryChanged);
//       widget.delegate.queryTextController.addListener(_onQueryChanged);
//       oldWidget.delegate._currentBodyNotifier
//           .removeListener(_onSearchBodyChanged);
//       widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
//       oldWidget.delegate.focusNode = null;
//       widget.delegate.focusNode = focusNode;
//     }
//   }
//
//   void _onFocusChanged() {
//     if (focusNode.hasFocus &&
//         widget.delegate._currentBody != _SearchBody.suggestions) {
//       widget.delegate.showSuggestions(context);
//     }
//   }
//
//   void _onQueryChanged() {
//     setState(() {});
//   }
//
//   void _onSearchBodyChanged() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget? body;
//     switch (widget.delegate._currentBody) {
//       case _SearchBody.suggestions:
//         body = KeyedSubtree(
//           key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
//           child: widget.delegate.buildSuggestions(context),
//         );
//         break;
//       case _SearchBody.results:
//         body = KeyedSubtree(
//           key: const ValueKey<_SearchBody>(_SearchBody.results),
//           child: widget.delegate.buildResults(context),
//         );
//         break;
//       case null:
//         break;
//     }
//
//     return widget.delegate.buildScaffold(body, context);
//   }
// }
//
// class PlatformItem {
//   final String name;
//
//   const PlatformItem(this.name);
// }
//
// class PlatformItemsWidget extends StatelessWidget {
//   final List<String> items;
//
//   const PlatformItemsWidget(this.items, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         var item = items[index];
//         return PlatformItemWidget(item);
//       },
//     );
//   }
// }
//
// class PlatformItemWidget extends StatelessWidget {
//   final String item;
//   final bool small;
//
//   const PlatformItemWidget(this.item, {super.key, this.small = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return small
//         ? Container(
//             color: Colors.white,
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//               child: Text(
//                 item,
//               ),
//             ),
//           )
//         : Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                       child: Text(
//                         item,
//                       ),
//                     ),
//                   ],
//                 ),
//               ]),
//             ),
//           );
//   }
// }
//
// class MaterialSearchDelegate extends AbstractSearchDelegate {
//   final List<String> Function(String text) search;
//
//   MaterialSearchDelegate(this.search);
//
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   Widget buildResults(BuildContext context) {
//     final List<String> result = search(query);
//     return PlatformItemsWidget(result);
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List<String> result = search(query);
//     return PlatformItemsWidget(result);
//   }
//
//   @override
//   Widget buildScaffold(Widget? body, BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: buildLeading(context),
//         title: TextField(
//           controller: queryTextController,
//           focusNode: focusNode,
//           textInputAction: TextInputAction.search,
//           onSubmitted: (String _) {
//             showResults(context);
//           },
//           cursorColor: Colors.white,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: searchFieldLabel,
//             border: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             labelStyle: TextStyle(color: Colors.white),
//             focusColor: Colors.white,
//           ),
//         ),
//         actions: buildActions(context),
//       ),
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: body,
//       ),
//     );
//   }
// }
//
// final List<String> platforms = ['Android'];
//
// class MaterialSearch extends StatelessWidget {
//   final List<String> Function(String text) search;
//
//   MaterialSearch(this.search);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Search'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 showPlatformSearch(
//                   context: context,
//                   delegate: MaterialSearchDelegate(search),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: PlatformItemsWidget(platforms),
//       ),
//     );
//   }
// }

// List<String> search(String text) {
//   return ["hey"]
//       .where((element) =>
//       element.toLowerCase().contains(text.toLowerCase()))
//       .toList();
// }
