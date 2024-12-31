import 'package:flutter/material.dart';

class PageCalcImc extends StatefulWidget {
  const PageCalcImc({super.key});

  @override
  State<PageCalcImc> createState() => _PageCalcImcState();
}

class _PageCalcImcState extends State<PageCalcImc> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController controllerPeso = TextEditingController();
  final TextEditingController controllerAltura = TextEditingController();
  String resultImc = "Informe seus dados!";
  final GlobalKey <FormState> _formKey= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  controllerPeso.clear();
                  controllerAltura.clear();
                  resultImc = "Informe seus dados!";
                });
              },
              icon: const Icon(Icons.refresh,color: Colors.white,))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                color: Colors.green,
                size: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                resultImc,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira seu peso!";
                  }
                },
                controller: controllerPeso,
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                style: const TextStyle(color: Colors.green),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  labelText: "Peso(Kg)",
                  labelStyle: const TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira sua altura!";
                  }
                },
                controller: controllerAltura,
                cursorColor: Colors.green,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.green),
                decoration:const  InputDecoration(
                  enabledBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  labelText: "Altura(cm)",
                  labelStyle:  TextStyle(color: Colors.green),
                  focusColor: Colors.green,
                  fillColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      calcularImc();
                    },
                    child: const Text(
                      "Calcular seu IMC",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calcularImc() {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(controllerPeso.text);
      double height = double.parse(controllerAltura.text) / 100;

      double imc = weight / (height * height);

      setState(() {
        if (imc < 18.6) {
          resultImc = "Abaixo do peso (IMC=${imc.toStringAsPrecision(3)})";
        }  else if (imc >= 18.6 && imc < 24.9) {
          resultImc = "Peso ideal (IMC=${imc.toStringAsPrecision(3)})";
        } else if (imc >= 24.9 && imc < 29.9) {
          resultImc = "Levemente acima do peso (IMC=${imc.toStringAsPrecision(3)})";
        } else if (imc >= 29.9 && imc < 34.9) {
          resultImc = "Obesidade Grau I (IMC=${imc.toStringAsPrecision(3)})";
        } else if (imc >= 34.9 && imc < 39.9) {
          resultImc = "Obesidade Grau II (IMC=${imc.toStringAsPrecision(3)})";
        } else if (imc >= 40) {
          resultImc = "Obesidade Grau III (IMC=${imc.toStringAsPrecision(3)})";
        }
      });
    }
  }
}
