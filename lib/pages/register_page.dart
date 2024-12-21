import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapbill/models/company_model.dart';
import 'package:zapbill/pages/home_page.dart';
import 'package:zapbill/services/navigation_service.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/custom_text_input.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  late DeviceSize _deviceSize;
  late NavigationService _navigation;

  @override
  Widget build(BuildContext context) {
    _navigation = GetIt.instance.get<NavigationService>();
    _deviceSize = DeviceSize(context: context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/intro1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _stackTopContainer()
        ],
      ),
    );
  }

  // stack top Container
  Widget _stackTopContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _topContainer(),
        _bottomContainer(),
      ],
    );
  }
  // _topContainer ;

  Widget _topContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: _deviceSize.deviceHeight * 0.02,
          horizontal: _deviceSize.deviceWidth * 0.05),
      height: _deviceSize.deviceHeight * 0.3,
      width: _deviceSize.deviceWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Color.fromRGBO(18, 12, 12, 0.2),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign in to your Account",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w900),
          ),
          Text(
            "ZapBill helps you track customer interactions and streamline your workflows with ease.",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          )
        ],
      ),
    );
  }

  // Bottom containrt hldin login details
  Widget _bottomContainer() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: _deviceSize.deviceHeight * 0.02,
            horizontal: _deviceSize.deviceWidth * 0.05),
        height: _deviceSize.deviceHeight * 0.7,
        width: _deviceSize.deviceWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginContainer(),
            _googleLogin(),
            _registerSection(),
          ],
        ),
      ),
    );
  }

  // login button with inputContainer
  Widget _loginContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          child: Column(
            children: [
              CustomTextInput(
                  hintText: "Name",
                  regEx: r"",
                  obscureText: false,
                  onSaved: (value) {}),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.03,
              ),
              CustomTextInput(
                  hintText: "User name",
                  regEx: r"",
                  obscureText: true,
                  onSaved: (value) {}),
              SizedBox(
                height: _deviceSize.deviceHeight * 0.03,
              ),
              CustomTextInput(
                  hintText: "Password",
                  regEx: r"",
                  obscureText: true,
                  onSaved: (value) {})
            ],
          ),
        ),
        SizedBox(
          height: _deviceSize.deviceHeight * 0.03,
        ),
        RoundedButton(
            height: _deviceSize.deviceHeight * 0.07,
            width: _deviceSize.deviceWidth,
            name: "Login",
            onPressed: () {}),
      ],
    );
  }

  // or login with goolge button  container
  Widget _googleLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _deviceSize.deviceWidth * 0.3,
              height: 2,
              child: Divider(
                color: Colors.black26,
                thickness: 2,
              ),
            ),
            Text("Or Sign with"),
            Container(
              width: _deviceSize.deviceWidth * 0.3,
              height: 2,
              child: Divider(
                color: Colors.black26,
                thickness: 2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _deviceSize.deviceHeight * 0.02,
        ),
        RoundedImageTextButton(
            height: _deviceSize.deviceHeight * 0.06,
            width: _deviceSize.deviceWidth,
            name: "Google",
            onPressed: () {},
            imagePath: "assets/images/glogo.png")
      ],
    );
  }

  // regiser button section
  Widget _registerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("have an account ?"),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            CompanyModel company = CompanyModel(
                userName: "hansaka",
                email: "hansaka@gmail.com",
                companyName: "Ravishan's Holdings",
                companyEmail: "companyEmail",
                companyMobile: "companyMobile");
            _navigation.navigationToPage(HomePage(company: company));
          },
          child: Text(
            "Login here",
            style: TextStyle(color: Color.fromRGBO(18, 82, 2, 1)),
          ),
        )
      ],
    );
  }
}
