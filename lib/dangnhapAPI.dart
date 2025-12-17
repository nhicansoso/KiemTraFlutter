import 'package:flutter/material.dart';
import 'package:kiemtragiuaky/model/user.dart';
import 'package:kiemtragiuaky/api/api_user.dart';
import 'package:kiemtragiuaky/show_user.dart';

class LoginAPIPage extends StatefulWidget {
  const LoginAPIPage({super.key});

  @override
  State<LoginAPIPage> createState() => _LoginAPIPageState();
}

class _LoginAPIPageState extends State<LoginAPIPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _showPassword = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Đăng nhập"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //ten nguoi dung
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "Tên người dùng",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập tên người dùng";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              //mat khau
              TextFormField(
                controller: _passController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu";
                  }
                  if (value.length < 5) {
                    return "Mật khẩu phải lớn hơn hoặc bằng 5 ký tự";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              //nut dang nhap
              ElevatedButton.icon(
                onPressed: _isLoading ? null : _login,
                icon: const Icon(Icons.login),
                label: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Đăng nhập"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //phuong thuc dang nhap
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      String username = _userController.text.trim();
      String password = _passController.text.trim();

      // 1. LOGIN
      String? token = await apiUser.login(username, password);

      if (token == null) {
        _showError("Sai tên đăng nhập hoặc mật khẩu");
        setState(() => _isLoading = false);
        return;
      }

      // 2. LẤY THÔNG TIN NGƯỜI DÙNG
      MyUser? user = await apiUser.getUserInfo(token);

      setState(() => _isLoading = false);

      if (user == null) {
        _showError("Không lấy được thông tin người dùng");
        return;
      }

      // 3. HIỂN THỊ THÔNG TIN NGƯỜI DÙNG
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => ShowUser(user: user)));
    }
  }

  //hiển thị lỗi
  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }
}
