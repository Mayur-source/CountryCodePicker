import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Code picker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Country Name & Code : '),
                CountryCodePicker(
                  onChanged: print,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  favorite: ['+91', 'IN'],
                  showFlag: true,
                  showFlagDialog: true,
                  onInit: (code) =>
                      print("on init ${code.name} ${code.dialCode}"),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Selected Country Code : '),
              CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                showFlag: false,
                countryFilter: ['IT', 'FR'],
                showFlagDialog: true,
                comparator: (a, b) => b.name.compareTo(a.name),
                //Get the country information relevant to the initial selection
                onInit: (code) =>
                    print("on init ${code.name} ${code.dialCode}"),
              ),
            ],
          ),

          SizedBox(
            width: 400,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('All Countries Name : '),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: print,
                    initialSelection: 'TF',
                    hideSearch: true,
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    alignLeft: true,
                    builder: (countryCode) {
                      return Text('${countryCode.code}');
                    },
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Country Flags & Name  : '),
              CountryCodePicker(
                onChanged: (e) => print(e.toLongString()),
                initialSelection: 'IT',
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                favorite: ['+39', 'FR'],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Country Flags & Name Initial Selected : '),
                CountryCodePicker(
                  enabled: false,
                  onChanged: (c) => c.name,
                  initialSelection: 'TF',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: ['+39', 'FR'],
                ),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}
