import 'package:flutter/material.dart';
import 'package:tenaid_mobile/assets/assets.gen.dart';
import 'package:tenaid_mobile/ds/component/horizontal_line.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../home/components/profile_image.dart';

class JoinRequestItem extends StatelessWidget {
  final JoinRequestDomain request;
  final Function(JoinRequestDomain) onTap;

  const JoinRequestItem(
      {super.key, required this.request, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(request),
        child: Padding(
          padding: EdgeInsets.all(Spacing.small),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _profile(context, request.account),
              SizedBox(
                height: Spacing.small,
              ),
              HorizontalLine(),
              SizedBox(
                height: Spacing.extraSmall,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Spacing.extraExtraSmall),
                    child: Assets.routeSquare.svg(height: 18),
                  ),
                  SizedBox(
                    width: Spacing.extraSmall,
                  ),
                  Flexible(
                      child: Text(
                    '${request.address}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleMedium?.fade(context),
                  ))
                ],
              )
            ],
          ),
        ),
      );

  Widget _profile(BuildContext context, AccountDomain? account) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileImage(
                  path: account?.photo ?? '', size: IconSize.extraLarge),
              SizedBox(
                width: Spacing.small,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${account?.firstName} ${account?.lastName}',
                    style: context.text.bodyLarge,
                  ),
                  Text(
                    '${account?.email?.value}',
                    style: context.text.bodyMedium?.fade(context),
                  )
                ],
              )
            ],
          ),
          Icon(Icons.chevron_right_rounded)
        ],
      );
}
