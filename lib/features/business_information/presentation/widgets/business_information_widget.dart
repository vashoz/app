import '../../../../core/shared/shared.dart';
import '../bloc/fetch_information_bloc.dart';

class BusinessInformationsWidget extends StatelessWidget {
  const BusinessInformationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<FetchInformationBloc, FetchInformationState>(
          builder: (context, state) {
            if (state is FetchInformationDone) {
              final information = state.businessInformation;
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max),
                decoration: BoxDecoration(
                  color: theme.positive,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Follow Us",
                      style: context.textStyle15SemiBold(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/icons/facebook.png"),
                        Image.asset("assets/icons/instagram.png"),
                        Image.asset("assets/icons/linkedin.png"),
                      ],
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text(
                      "Address",
                      style: context.textStyle15SemiBold(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.small),
                    Text(
                      information.address,
                      textAlign: TextAlign.center,
                      style: context.textStyle10Regular(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text(
                      "Contact",
                      style: context.textStyle15SemiBold(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.small),
                    Text(
                      information.phone,
                      style: context.textStyle10Regular(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                    Text(
                      "Email",
                      style: context.textStyle15SemiBold(
                          color: theme.backgroundPrimary),
                    ),
                    SizedBox(height: Dimension.padding.vertical.small),
                    Text(
                      information.email,
                      style: context.textStyle10Regular(
                          color: theme.backgroundPrimary),
                    ),
                  ],
                ),
              );
            } else if (state is FetchInformationError) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max),
                decoration: BoxDecoration(
                  color: theme.negative,
                ),
              );
            } else if (state is FetchInformationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
