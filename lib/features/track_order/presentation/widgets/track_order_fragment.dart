import 'package:intl/intl.dart';
import 'package:vashoz/features/orders/domain/entities/status.dart';

import '../../../../core/shared/shared.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../track_order.dart';
import '../bloc/track_order_bloc.dart';

class TrackOrderFragment extends StatefulWidget {
  const TrackOrderFragment({super.key});

  @override
  State<TrackOrderFragment> createState() => _TrackOrderFragmentState();
}

class _TrackOrderFragmentState extends State<TrackOrderFragment> {
  TextEditingController orderIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined, color: theme.textPrimary),
              onPressed: () {},
            ),
            title: Text("Track Order", style: context.textStyle15SemiBold(color: theme.textPrimary)),
            centerTitle: true,
            backgroundColor: theme.backgroundSecondary,
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: Dimension.padding.vertical.max),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.padding.horizontal.max,
                ),
                child: TextField(
                  style: context.textStyle12Regular(color: theme.textPrimary),
                  decoration: InputDecoration(
                    labelText: 'order id',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: theme.textLight,
                    ),
                    labelStyle: context.textStyle10Regular(color: theme.textLight),
                    filled: true,
                    fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimension.padding.vertical.medium),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.padding.horizontal.max,
                ),
                child: TextField(
                  style: context.textStyle12Regular(color: theme.textPrimary),
                  decoration: InputDecoration(
                    labelText: 'billing email',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: theme.textLight,
                    ),
                    labelStyle: context.textStyle10Regular(color: theme.textLight),
                    filled: true,
                    fillColor: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(Dimension.radius.eight)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimension.padding.vertical.max),
              BlocBuilder<TrackOrderBloc, TrackOrderState>(
                builder: (context, state) {
                  if (state is TrackOrderLoading) {
                    return Center(child: CircularProgressIndicator(color: theme.primary));
                  } else if (state is TrackOrderDone) {
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CustomButton(
                          text: "Track",
                          onTap: () {
                            BlocProvider.of<TrackOrderBloc>(context).add(
                              TrackOrder(
                                orderIdController.text,
                                emailController.text,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: Dimension.padding.vertical.max),
                        OrderCard(order: state.item),
                      ],
                    );
                  } else if (state is TrackOrderError) {
                    return Center(child: Text(state.failure.message));
                  } else {
                    return CustomButton(
                      text: "Track",
                      onTap: () {
                        BlocProvider.of<TrackOrderBloc>(context).add(
                          TrackOrder(
                            orderIdController.text,
                            emailController.text,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final TrackOrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Card(
          color: theme.cardColor,
          margin: EdgeInsets.only(
            bottom: Dimension.padding.vertical.max,
            left: Dimension.padding.vertical.max,
            right: Dimension.padding.vertical.max,
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: Dimension.radius.twentyFour,
                        backgroundColor: theme.positive.withOpacity(.1),
                        child: const Icon(Icons.inventory_2_outlined, color: Colors.green)),
                    SizedBox(width: Dimension.padding.vertical.max),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.orderId}',
                          style: context.textStyle15SemiBold(color: theme.textPrimary),
                        ),
                        Text(
                          'Placed on ${DateFormat("dd MMMM, yyyy").format(DateTime.parse(order.orderDate))}',
                          style: context.textStyle12Regular(color: theme.textLight),
                        ),
                        Text('Items: ${order.itemsCount}   Items total: $taka${order.totalPrice}',
                            style: context.textStyle12Regular(color: theme.textPrimary)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Dimension.padding.vertical.max),
                  child: OrderTimelineTile(status: order.status),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OrderTimelineTile extends StatelessWidget {
  final List<OrderStatus> status;

  const OrderTimelineTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return FixedTimeline.tileBuilder(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.antiAlias,
          theme: TimelineThemeData(
            nodePosition: 0,
            direction: Axis.vertical,
            nodeItemOverlap: false,
            color: const Color(0xff989898),
            indicatorTheme: const IndicatorThemeData(
              position: 20,
              size: 16.0,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            oppositeContentsBuilder: (_, index) => const SizedBox(),
            connectionDirection: ConnectionDirection.before,
            contentsAlign: ContentsAlign.basic,
            itemCount: status.length,
            contentsBuilder: (_, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: Dimension.padding.vertical.max),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(status[index].stage,
                        textAlign: TextAlign.end, style: context.textStyle13Regular(color: theme.textPrimary)),
                    Text(status[index].date,
                        textAlign: TextAlign.end, style: context.textStyle12Regular(color: theme.textLight)),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (status[index].completed) {
                return DotIndicator(
                  color: theme.positive,
                  position: 0.5,
                  child: Icon(
                    Icons.check,
                    color: theme.backgroundPrimary,
                    size: 10,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2,
                  position: 0.5,
                  color: theme.textLight,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SizedBox(
              height: 20.0,
              child: SolidLineConnector(
                space: 16.0,
                direction: Axis.vertical,
                color: status[index].completed ? const Color(0xff66c97f) : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
