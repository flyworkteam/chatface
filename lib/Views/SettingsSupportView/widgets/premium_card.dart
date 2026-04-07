import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.5),
            Color(0xffA32AC9).withValues(alpha: 0.3),
          ],
        ),
        image: DecorationImage(
          image: AssetImage(AppIcons.premiumBackground),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Spacer(flex: 4),
          Text(
            context.t.settingsSupport.premiumTitle,
            style: AppTextStyles.body(
              16,
              color: Colors.white,
              weight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xffAD2CD5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),

                child: Text(
                  context.t.settingsSupport.getPremium,
                  style: AppTextStyles.body(
                    12,
                    weight: FontWeight.bold,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withValues(alpha: 0), Colors.black],
                      begin: Alignment(0.59, -0.00),
                      end: Alignment(0.41, 1.00),
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    context.t.settingsSupport.getPremium,
                    style: AppTextStyles.body(14, color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
