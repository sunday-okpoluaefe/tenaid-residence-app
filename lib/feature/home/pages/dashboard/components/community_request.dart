import 'package:flutter/material.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../../assets/assets.gen.dart';

class CommunityRequest extends StatelessWidget {
  final AccountCommunityDomain accountCommunity;

  const CommunityRequest({super.key, required this.accountCommunity});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Spacing.extraSmall, bottom: Spacing.extraSmall),
            decoration: BoxDecoration(
              color: context.color.surfaceBright.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(Spacing.small),
              child: Row(
                children: [
                  Flexible(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      accountCommunity.isAdmin == true
                          ? Assets.createCommunity.svg()
                          : Assets.joinCommunity.svg(),
                      SizedBox(
                        width: Spacing.small,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            accountCommunity.community?.name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.titleMedium,
                          ),
                          SizedBox(
                            height: Spacing.extraExtraSmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              accountCommunity.address,
                              maxLines: 2,
                              style: context.text.bodySmall?.copyWith(
                                  color: context.color.surfaceContainerHighest),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                  Icon(Icons.chevron_right_outlined)
                ],
              ),
            ),
          ),
          Positioned(
              top: Spacing.extraSmall,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(Spacing.extraExtraSmall),
                height: Spacing.medium,
                decoration: BoxDecoration(
                    color: (accountCommunity.status != null &&
                            accountCommunity.status == 'pending')
                        ? context.color.secondaryFixed
                        : context.color.primaryFixed,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                child: Text(
                  accountCommunity.status != null &&
                          accountCommunity.status == 'pending'
                      ? 'In review'
                      : 'Active',
                  style: context.text.labelMedium
                      ?.copyWith(color: context.color.surface),
                ),
              ))
        ],
      );
}
