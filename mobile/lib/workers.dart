import 'package:flutter/material.dart';
import 'package:mobile/models/worker.dart';
import 'package:mobile/views/worker_page.dart';

class Workers extends StatelessWidget {
  const Workers({super.key});
  final List<Worker> workers = const [
    Worker(
        name: "Albert Einstein",
        email: "albert.einstein@gmail.com",
        role: "CEO",
        salary: 12000.0,
        pixKey: "pix.albert"),
    Worker(
        name: "Claudio Oppenheimer",
        email: "claudio.oppenheimer@gmail.com",
        role: "Diretor de Eng.",
        salary: 9800.0,
        pixKey: "384723799200"),
    Worker(
        name: "Karen Ferro",
        email: "karen.ferro@gmail.com",
        role: "Coordenador M.",
        salary: 7200.0,
        pixKey: "karenferro"),
    Worker(
        name: "Cesar Barros",
        email: "cesar.barros@gmail.com",
        role: "Analista Financeiro",
        salary: 6300.0,
        pixKey: "barros123"),
    Worker(
        name: "Julio Balestrini",
        email: "julio.balestrini@gmail.com",
        role: "Caixa",
        salary: 3200.0,
        pixKey: "pixjulio"),
    Worker(
        name: "Marco Aurelio",
        email: "marco.aurelio@gmail.com",
        role: "CEO",
        salary: 15000.0,
        pixKey: "marcousine"),
    Worker(
        name: "Paulo Kogos",
        email: "paulo.kogos@gmail.com",
        role: "Motorista",
        salary: 2800.0,
        pixKey: "346263992005"),
    Worker(
        name: "Obama Bin Laden",
        email: "obamabinladen@gmail.com",
        role: "Conselheiro",
        salary: 6000.0,
        pixKey: "pix.obama"),
    Worker(
        name: "Kurt Godel",
        email: "kurt.godel@gmail.com",
        role: "Cientista de Dados",
        salary: 11000.0,
        pixKey: "logicpix"),
    Worker(
        name: "Ilda Newton",
        email: "ildanewton@gmail.com",
        role: "Gerente de Projetos",
        salary: 9000.0,
        pixKey: "ildaPix"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: workers.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkerPage(worker: workers[index]),
                ),
              );
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.amber,
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        workers[index].name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email),
                          Text(workers[index].email),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.badge),
                          Text(workers[index].role),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
          );
        });
  }
}
