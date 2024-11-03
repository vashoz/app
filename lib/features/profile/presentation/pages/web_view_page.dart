import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/shared/shared.dart';

class WebViewPage extends StatelessWidget {
  static const String path = '/web_view_page';
  static const String name = 'web_view_page';
  final String headerText;
  final String link;
  const WebViewPage({
    super.key,
    required this.headerText,
    required this.link,
  });
  Future<String> get _url async {
    await Future.delayed(const Duration(seconds: 1));
    return link;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            automaticallyImplyLeading: true,
            centerTitle: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            title: Text(
              headerText,
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
          ),
          body: FutureBuilder(
            future: _url,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..loadRequest(
                      Uri.parse(link),
                    ),
                );
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}
