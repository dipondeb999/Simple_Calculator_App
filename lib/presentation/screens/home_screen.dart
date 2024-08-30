import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // app name
              const Text(
                'Calculator',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              // forms
              _buildForms(),
              const SizedBox(height: 30),
              // buttonBar
              _buildButtonBar(),
              const SizedBox(height: 30),
              // result
              Text(
                'Result : ${_result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // forms
  Widget _buildForms() {
    return Column(
      children: [
        TextFormField(
          controller: _firstNumTEController,
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Enter a value';
            }
            return null;
          },
          decoration: const InputDecoration(
            label: Text(
              'First Number:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            hintText: 'Enter your first number',
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _secondNumTEController,
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value?.isEmpty ?? true) {
              return 'Enter a value';
            }
            return null;
          },
          decoration: const InputDecoration(
            label: Text(
              'Second Number:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            hintText: 'Enter your second number',
          ),
        ),
      ],
    );
  }
  // build buttonBar
  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: _onTapAdditionButton,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: _onTapSubtractButton,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: _onTapMultiplyButton,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  '*',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: _onTapDivideButton,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Text(
                  '/',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  // mathematics function
  // addition
  void _onTapAdditionButton() {
    if (_formKey.currentState!.validate()) {
      double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNumber + secondNumber;
      setState(() {});
    }
  }
  // subtract
  void _onTapSubtractButton() {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNumber - secondNumber;
    setState(() {});
  }
  // multiply
  void _onTapMultiplyButton() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNumber * secondNumber;
    setState(() {});
  }
  // divide
  void _onTapDivideButton() {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    double firstNumber = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNumber / secondNumber;
    setState(() {});
  }
  // validate text fields
  bool _validateTextFields() {
    if (_firstNumTEController.text.isEmpty){
      return false;
    }
    if (_secondNumTEController.text.isEmpty){
      return false;
    }
    return true;
  }
  @override
  void dispose() {
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }
}
