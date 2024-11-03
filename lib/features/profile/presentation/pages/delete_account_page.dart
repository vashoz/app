import '../../../../core/shared/shared.dart';

class DeleteAccountPage extends StatefulWidget {
  static const path = "/delete_account_page";
  static const name = "Delete_account_page";

  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage>
    with TickerProviderStateMixin {
  String selection = "";
  List<String> reasons = [
    "Found a better alternative",
    "App not user friendly",
    "Too many notification",
    "Privacy concerns",
    "Frequent technical issues",
    "Limited products options",
    "Other"
  ];
  TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () => context.pop(),
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: theme.negative)),
            backgroundColor: theme.backgroundPrimary,
            iconTheme: IconThemeData(color: theme.negative),
            title: Text(
              "Delete Account",
              style: TextStyles.title(context: context, color: theme.negative),
            ),
          ),
          backgroundColor: theme.backgroundPrimary,
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Icon(Icons.delete_forever,
                              color: theme.negative, size: 128),
                        ),
                        SizedBox(height: Dimension.padding.vertical.small),
                        Text(
                          "Do you want to delete your account permanently? All your data will be deleted.",
                          style: TextStyles.body(
                              context: context, color: theme.negative),
                        ),
                        SizedBox(height: Dimension.padding.vertical.small),
                        Text(
                          "ⓘ We will delete your account and all your order history data as well as your addresses and profile information",
                          style: TextStyles.caption(
                              context: context, color: theme.textPrimary),
                        ),
                        SizedBox(height: Dimension.padding.vertical.small),
                        Chip(
                          backgroundColor: theme.negative,
                          label: Text(
                            "Why do you want to delete this account?",
                            style: TextStyles.caption(
                                context: context,
                                color: theme.backgroundPrimary),
                          ),
                        ),
                        SizedBox(height: Dimension.padding.vertical.small),
                        ListView.builder(
                          itemCount: reasons.length,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            final String reasonsData = reasons[index];
                            return CheckboxListTile(
                              dense: false,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              selectedTileColor: theme.negative,
                              checkColor: theme.backgroundPrimary,
                              activeColor: theme.negative,
                              title: Text(reasonsData,
                                  style: TextStyles.caption(
                                      context: context,
                                      color: theme.textPrimary)),
                              onChanged: (value) {
                                setState(() {
                                  selection = reasonsData;
                                });
                              },
                              value: reasonsData == selection,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimension.padding.vertical.small),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Visibility(
                      visible: selection.toLowerCase() == "Other".toLowerCase(),
                      child: TextFormField(
                        controller: otherController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        cursorColor: theme.textPrimary,
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: theme.backgroundPrimary,
                          hintText: "Other reason",
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.padding.vertical.small),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.negative,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius.sixteen),
                          ),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 48),
                        ),
                        onPressed: () {},
                        child: Text("Delete Account".toUpperCase(),
                            style: TextStyles.title(
                                context: context, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
