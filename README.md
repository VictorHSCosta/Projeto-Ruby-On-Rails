# 📝 To-Do List App

Bem-vindo ao **To-Do List App**, um site simples e eficiente para gerenciar tarefas e listas. Este projeto foi desenvolvido com foco em funcionalidades básicas e produtividade.

## 🚀 Funcionalidades Principais

1. **Criar novas listas**: Organize suas tarefas em listas separadas.
2. **Adicionar itens às listas**: Cada lista pode ter vários itens.
3. **Excluir listas e seus itens dependentes**: Simples e prático.
4. **Excluir itens individualmente**: Remova tarefas específicas.
5. **Barra de busca dinâmica**: Filtre itens dentro de uma lista.
6. **Sistema de autenticação**: Faça login para gerenciar suas listas.  
   ⚠️ **Nota:** O site não faz verificação de e-mail.

---

## 🛠️ Tecnologias Utilizadas

- **Ruby on Rails**: Framework principal para o backend e frontend.
- **Tailwind CSS**: Estilização rápida e responsiva.
- **JavaScript**: Para modais e menu hamburguer interativo.
- **PostgreSQL**: Banco de dados para armazenamento de listas e itens.

---

## 📖 Como Usar

![image](https://github.com/user-attachments/assets/8344609f-ed7f-41d3-995b-d5a85b626e99)


1. **Faça login** ou crie uma conta.  
   ⚠️ **Nota:** Não há verificação de e-mail, então use qualquer endereço válido.

2. **Crie uma nova lista**:
   - Após o login, clique no botão "Nova Lista".
   - Insira o nome da lista e salve.

3. **Adicione itens à lista**:
   - Abra uma lista e clique em "Adicionar Novo Item".
       ![image](https://github.com/user-attachments/assets/961f359a-9ead-43f5-aef6-ae7cd1731399)
   - Preencha com o nome da lista.
       ![image](https://github.com/user-attachments/assets/69f87181-13a3-4522-b638-bdcfebd2374d)


4. **Gerencie suas tarefas**:
   - Abra na lista que voce acabou de criar.
     ![image](https://github.com/user-attachments/assets/221f8404-8a98-45ae-884c-94f062d08538)

   - Use a barra de busca para encontrar itens específicos.
   - Exclua itens ou listas conforme necessário.

---

## 🖥️ Requisitos para Rodar o Projeto

Certifique-se de ter as ferramentas abaixo instaladas:

- **Ruby**: Versão 3.2.2 ou superior.  
  Para verificar todas as versões do Ruby: [Ruby Releases](https://www.ruby-lang.org/en/downloads/releases/).

- **Rails**: Versão 7.0 ou superior.
- **PostgreSQL**: Versão 12 ou superior.

---

## ⚙️ Configuração do Projeto

Siga os passos abaixo para configurar o projeto localmente:

1. **Clone este repositório**:
   ```bash
   git clone https://github.com/seu-usuario/todo-list-app.git
   cd todo-list-app
   rails db:create                                                             ─╯
   rails db:migrate
   ./bin/dev 
   
