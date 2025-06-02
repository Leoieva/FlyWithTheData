# FlyWithTheData

  Imagine um banco de dados de uma **companhia aérea real** (como LATAM, AZUL, GOL, etc) e se pergunte: 
  
  *"Com um grande volume de dados (o conhecido *"Big Data"*), o que podemos analisar e qual é o limite da nossa interpretação com essas informações?"*

  Logo, o projeto *"Fly With The Data"* utilizou da forma mais simples dois dos principais recursos da Análise Exploratória de Dados: o volume de dados e o método de análise e visualização.
  Para isso, a proposta completa foi:
  - Entender como funciona a criação e desenvolvimento de um banco de dados relacional a partir da simulação de uma empresa de grande porte,
  - Trabalhar com um volume pequeno de dados (de 50 a 300 registros na maioria das tabelas),
  - Obter conclusões, interpretações e tomada de decisões somente utilizando a query de PostgreSQL.

  E como resultado, a simples análise gerou 10 levantamentos que podem ser super importantes e interessantes para a busca por maior receita e por resolução de problemas quase invisíveis nessas companhias:

  ===========================================================================
  
  **1- Quantidade de voos por aeroporto (tanto origem quanto destino)**

  ![image](https://github.com/user-attachments/assets/55f1e657-89b1-4a2f-929c-0e5c3f326c14) 
  
  *Na prática: Para as cidades menos visitadas, a Cia Aérea pode investir em campanhas de marketing aumentar a taxa de visitas ou promover mais descontos no valor da viagem (tanto de ida quanto de volta) ou descontos em pontos e comércios turísticos da cidade na compra da passagem.*

  ===========================================================================

  **2- Distribuição de status de voo**

  ![image](https://github.com/user-attachments/assets/814a471c-8fc0-4bda-9764-d779104fe261)

  *Na prática: É um sinal positivo haver mais voos programados e concluídos do que cancelados e atrasados, porém, com a*

   ===========================================================================

  **3- Distribuição da faixa etária dos passageiros**

  ![image](https://github.com/user-attachments/assets/0497ecf5-265c-455f-8d0c-3c11291ab602)

  *Na prática: A falta ou o baixo do volume de clientes jovens e idosos pode preocupar, porque em muitos países podem ser a maior parte da população. Logo, campanhas de marketing especializadas para esses 2 tipos de públicos distintos pode aumentar a receita líquida e como consequência, aumentar a taxa de voos nas faixas etárias 21 a 30, 31 a 40 e 41 a 50 por necessitar acompanhar jovens ou idosos nas viajens.* 
  
   ===========================================================================
  
   **4- Quantidade de reservas feitas por mês**

   ![image](https://github.com/user-attachments/assets/4d8d2a2f-6143-402a-bb6a-aa54e6580b6c)

   *Na prática: Há uma taxa menor de reservas no mês de dezembro, logo, a Cia Aérea pode promover promoções de pacotes e descontos para o fim do ano com mais benefícios de milhas e em hotéis.*

   ===========================================================================

   **5- Quantidade de voos cancelados e concluídos por faixa etária**

   ![image](https://github.com/user-attachments/assets/8b037ff7-8fb7-45f3-9bb5-da495b5e9fae)

   *Na prática: Pessoas idosas e mais jovens tendem a viajar menos e faixas etárias com maior taxa de voos concluídos tendem a aumentar a sua taxa de cancelamento de voos. Portanto, o incentivo de promoções de intercâmbios e viagens a lugares com classificação social como "tranquilos" e a "vibe calma" podem atrair mais o público menos viajante.*

   ===========================================================================

  **6- Quantidade de passageiros sem programa fidelidade**

  ![image](https://github.com/user-attachments/assets/7ff6bae7-f850-4f4f-a2d3-f23e97d0544b)

  *Na prática: Se há mais clientes que não possuem a assinatura do programa fidelidade da companhia, causas como valores altos da mensalidade, poucos benefícios padrões ou exclusivos, pouca diversidade das categorias do programa para atender os diversos tipos de clientes que viajam ou pretendem viajar são muito frequentes no setor comercial aviário, porém, com um tratamento especializado em cada desafio, sem usar soluções generalizadas, podem aumentar a atração de clientes que já viajam a assinar o programa fidelidade ou possíveis clientes a começar a viajar já com o programa.*

===========================================================================

 **7- Categorias do programa fidelidade mais adquiridas**

 ![image](https://github.com/user-attachments/assets/b83ae143-bcec-450e-b8cb-0165362463d0)
 
*Na prática: a Cia Aérea pode oferecer a assinatura em categorias mais baixas, mais descontos e promoções aos clientes se quiserem subir para as categorias mais altas. Também é válido, avaliar sempre a distribuição de benefícios entre as categorias e a taxa de permanência dos clientes em cada categoria, assim a categoria "Ouro", por exemplo, pode aumentar a taxa de assinaturas influênciando o aumento das outras.*

===========================================================================

  **8- Três tripulantes com menos vôos atribuídos**

  ![image](https://github.com/user-attachments/assets/be9eab60-dbc9-4708-a53d-cf9c5d96ee27)

  *Na prática: Deve haver uma distribuição de trabalho melhor calculada para/com a equipe de tripulação, e esse desafio toda Cia Aérea enfrenta e deseja muito resolver para evitar a saída e o excesso de horas trabalhadas nos funcionários, mas pode ocorrer soluções genéricas ou mal estudadas se não for visualizado antes um dos dados mais básicos que é a quantidade de tripulantes com menor taxa de voos atribuídos.*

  ===========================================================================

  **9- Quantidade de tripulantes antigos e novos na companhia**
  
  ![image](https://github.com/user-attachments/assets/fa240643-0dc3-4a05-a54e-9f63a22ca854)

  *Na prática: Há mais funcionários novos do que antigos, o que pode indicar uma rotatividade alta e menor atração por trabalho na Cia Aérea. Contudo, a companhia contorna esse desafio analisando as suas ofertas de emprego, remuneração a curto e longo prazo, promoções, benefícios e a busca por melhor qualidade e segurança de vida.*

===========================================================================

  **10- Quantidade de voos concluídos e receita por aeronave**

![image](https://github.com/user-attachments/assets/46220625-154c-4e5c-86e9-ff528d68d6bd)

*Na prática: A Cia Aérea precisa sempre tentar buscar o equilíbrio na quantidade de voos por aeronave, pois deve-se pensar que o custo da manuntenção periódica e preventiva de um avião é menor do que o custo da manutenção corretiva, e também a má distribuição causa na desvalorização da aeronave para a companhia, onde a receita que podia ser gerada com o avião não paga o custo alto da sua fabricação.*

===========================================================================

Em conclusão, poucos dados são capazes de gerar os mesmos insights que muitos dados, e a entender o seu próprio mercado e seus números é sempre muito mais lucrativo, ainda mais sendo o quanto antes.

Além de todas essas informações acima, com esse projeto eu aprendi sobre:
- A criação de um banco de dados relacional, no modelo teórico, o diagrama DER, e no modelo prático, o desenvolvimento em PostgreSQL,
- A coerência na relação entre tabelas e colunas (chaves primárias e estrangerias),
- A efiência em analisar dados de forma simples,
- A organização em queries e em documentações.
