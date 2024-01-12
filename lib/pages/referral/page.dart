import 'package:course_view/core/constants/images.dart';
import 'package:course_view/pages/referral/widgets.dart';
import 'package:course_view/widgets/button.dart';
import 'package:flutter/material.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        title: const Text(
          'Refer and win big!',
          // style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Existing users can refer their friends and family here and take amazing bonuses including slashes on prices.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    PageContainer(
                      children: <Widget>[
                        Text(
                          'INVITE AND GET AWESOME REWARDS',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          'Share your link',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'https://excelacademy.com/invite/potns?ruukjd',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  minimumSize: const MaterialStatePropertyAll(
                                    Size.zero,
                                  ),
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 4.0,
                                    ),
                                  ),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                    Colors.white,
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: const Text('Copy'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SocialMediaButton(
                                image: AssetImages.facebook,
                                text: 'Facebook',
                              ),
                              SocialMediaButton(
                                image: AssetImages.instagram,
                                text: 'Instagram',
                              ),
                              SocialMediaButton(
                                image: AssetImages.messenger,
                                text: 'Inbox',
                              ),
                              SocialMediaButton(
                                image: AssetImages.link,
                                text: 'Share link',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    PageContainer(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'Users from your shared link gets fee-free '
                                        'transfer into courses and cash up to ',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                      height: 1.4,
                                    ),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: '20,000NGN.',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AssetImages.gift,
                          ],
                        )
                      ],
                    ),
                    PageContainer(
                      children: <Widget>[
                        Text(
                          'ENTER A REFERRAL LINK ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          'Existing users can refer their friends '
                          'and family here and take amazing '
                          'bonuses including slashes on prices.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'Enter an invite link',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        const LinkTextField(),
                        const SizedBox(height: 7.0),
                        SubmitButton(
                          onPressed: () {},
                          text: 'Submit',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
