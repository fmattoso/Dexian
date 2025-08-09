# Projeto Dexian MVC
## Ferramentas Utilizadas
- Delphi 12 Architect
- SQL Server 2016
- FireDAC
- Fast Report
## Padrões de Nomenclatura e Estruturação
### Estrutura do Projeto
Foi utilizado o padrão típico MVC (Model, View e Controll) com os aquivos fontes de cada camada em uma pasta separada
### Nomenclatura dos arquivos
Para a nomenclatura dos arquivos foi utilizada a notação [Camada].[Descrição da Classe].pas.
### Nomemclatura das Variáveis
De acordo com os padrões da linguagem Delphi. Primeiro caracter em maiúsculo e demais palavras em "camel case". Com até 3 palavras para exprimir o seu significado.
### Nomenclatura dos Componentes
Prefixo com o nome original do componente, sem as vogais, seguido do mesmo padrão das variáveis.

## Banco de Dados
O script para o banco de dados encontra-se na pasta "Scripts".
- Nome do servidor utilizado: DESKTOP-D7HQNVE\SQLEXPRESS
- Database: DexianDB
- Usuário: dexian_usr
- Senha: Dexian123!

## Requisitos
### Ferramentas:
• Delphi 10 Seattle ou superior.
• SQL Server 2014 ou superior.
### Componente de conexão a banco de dados:
• FireDac.
### Componente de relatório:
• Fast Report.
### Descrição da aplicação:
• A aplicação deve possuir uma tela principal com 3 botões ("Cadastro Pai", "Cadastro Filho" e "Relatório").
• O botão "Cadastro Pai" se refere a um tema de cadastro de livre escolha do candidato(a) de forma que atenda uma estrutura hierárquica, por exemplo, agências e contas bancárias, lojas e funcionários, venda e produtos vendidos e etc. O botão deve possuir o caption do tema selecionado, por exemplo, "Cadastro de Agências", "Cadastro de Lojas" e etc.
• O botão "Cadastro Filho" se refere ao tema escolhido na criação do cadastro do item anterior e deve seguir a mesma regra no caption do botão.
• O botão "Relatório" deve acionar a exibição em tela de todos os registros cadastrados seguindo a estrutura hierárquica utilizando o componente de relatório Fast Report.
• Nos formulários de cadastro de "pai e filho" incluir ao menos 3 campos para inclusão de dados de cadastro.
• Ao menos em um dos formulários de cadastro deve existir os seguintes tipos de componentes visuais para inclusão de dados: campo de texto simples, campo de texto multi linhas, campo de valor numérico e campo de data.
• A chamada dos botões de cadastro da tela principal deve ser direcionada para uma tela de consulta padrão seguindo o layout da imagem em anexo "Formulário de Consulta - Funções Básicas.png".
• Os botões das telas de consulta devem ter as seguintes funcionalidades:
o Botão Filtrar: Exibir a tela de manutenção com todos os campos disponíveis para realizar o filtro do registro cadastrado.
o Botão Todos: Executar uma consulta no banco de dados trazendo todos os registros cadastrados e exibir no grid da tela de consulta.
o Botão Incluir: Exibir a tela de manutenção com os campos necessários para realizar a inclusão de um novo registro.
o Botão Alterar: Exibir a tela de manutenção com os campos possíveis de alteração. Neste modo de exibição, o formulário deve exibir o botão "Restaurar" para possibilitar ao usuário desfazer as alterações feitas naquele momento desde que ainda não tenha confirmado estas.
o Botão Excluir: Exigir confirmação da ação para o usuário e efetuar a exclusão do registro selecionado na grid da tela de consulta.
o Botão Consultar: Exibir a tela de manutenção com a barra de navegação de registros cadastrados.
• O layout da tela de manutenção de dados deve seguir o padrão definido na imagem em anexo "Formulário de Manutenção - Funções Básicas.png". Regra de exibição dos botões:
o Barra de navegação: Apenas em modo de consulta.
o Botão restaurar: Apenas em modo de alteração.
o Botão OK e Sair: Em todos os modos possíveis de exibição da tela.
• Não é necessário uma tela de logon para utilizar a aplicação descrita.
Pontos a serem avaliados:
• Aplicação do conceito de orientação a objetos com o padrão MVC.
• Organização do código seguindo os padrões definidos pela própria linguagem para nomear métodos, variáveis e objetos visuais. (Caso o candidato(a) utilize um padrão próprio, este deverá encaminhar anexo ao e-mail um documento descrevendo os padrões de nomenclatura e estruturação definidos)
• Clareza, simplicidade e objetividade do código desenvolvido.
• Qualidade da interface visual.
