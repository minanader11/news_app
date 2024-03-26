import 'package:flutter/material.dart';
import 'package:news_app/core/app_config_provider.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  static int settingsView = 0;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<AppConfigProvider>(context);
    List<String> dropdownLanguage = [
     'English','Arabic'
    ];
    String selectedLanguage = configProvider.language == 'en'
        ? 'English'
        : 'Arabic';
    // TODO: implement build
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(backgroundColor: Colors.transparent,drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            'Settings',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: MyTheme.whiteColor),
          ),
          centerTitle: true,

        ),
          body: Column(children: [Container(margin:EdgeInsets.all(20) ,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primaryColor),
                color:
                     MyTheme.whiteColor
                   ),
            child: DropdownButton(
              dropdownColor:
                   MyTheme.whiteColor,

              underline: const SizedBox(),
              isExpanded: true,
              value: selectedLanguage,
              items: dropdownLanguage.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? value) {
                selectedLanguage = value!;
                if (selectedLanguage ==
                   'English') {
                  configProvider.changeLanguage('en');

                } else {
                  configProvider.changeLanguage('ar');
                }
                //setState(() {});
              },
              style:
                   Theme.of(context).textTheme.bodyMedium,

              itemHeight: 50,
            ),
          ),]),
      ),]
    );
  }
}
