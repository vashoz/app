import '../../../../core/shared/shared.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.positive.withOpacity(.2),
                  theme.positive.withOpacity(.5),
                  theme.positive.withOpacity(.7),
                  theme.positive.withOpacity(.8),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.positive.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/mastercard.png',
                        height: 48.h,
                      ),
                      Image.asset(
                        'assets/icons/chip.png',
                        height: 48.h,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text('**** **** **** 1234', style: context.textStyle10Regular(color: theme.white)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card holder',
                            style: context.textStyle10Regular(color: theme.white),
                          ),
                          Text(
                            'John Doe',
                            style: context.textStyle10Regular(color: theme.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Expires',
                            style: context.textStyle10Regular(color: theme.white),
                          ),
                          Text('06/28', style: context.textStyle10Regular(color: theme.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
