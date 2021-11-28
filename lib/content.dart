import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          "https://www.google.com/search?q=covid&rlz=1C1CHBF_viVN959VN959&sxsrf=ALeKk03kHH10LOgM6PGesykgOC6gtbIjOA:1626162904667&source=lnms&tbm=nws&sa=X&ved=2ahUKEwiF4J3yyN_xAhXUXisKHdEeDZYQ_AUoAXoECAEQAw",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController wc) {
        controller = wc;
        wc.goBack();
      },
    );
  }
}
