import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:vashoz/features/orders/domain/entities/status.dart';
import 'package:vashoz/features/orders/orders.dart';

import '../../../../core/shared/shared.dart';
import '../bloc/find_all_bloc.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrdersPage extends StatelessWidget {
  static const name = 'Orders';
  static const path = '/orders';

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined, color: theme.textPrimary),
              onPressed: () {
                context.pop();
              },
            ),
            centerTitle: true,
            title: Text(
              'My Orders',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.tune,
                  color: theme.textPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: BlocBuilder<FindAllBloc, FindAllState>(
            builder: (context, state) {
              if (state is FindAllDone) {
                final orders = state.orders;
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => OrderCard(order: orders[index]),
                    itemCount: orders.length);
              } else if (state is FindAllError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else if (state is FindAllLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
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
          margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
            child: ExpandablePanel(
              header: Row(
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundColor: theme.positive.withOpacity(.1),
                      child: const Icon(Icons.inventory_2_outlined, color: Colors.green)),
                  const SizedBox(width: 8),
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
                    ],
                  ),
                ],
              ),
              collapsed: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 0),
                child: Text('Items: ${order.itemsCount}   Items total: $taka${order.totalPrice}',
                    style: context.textStyle12Regular(color: theme.textPrimary)),
              ),
              expanded: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: OrderTimelineTile(status: order.status),
              ),
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
