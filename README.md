# Jogo-Forca-em-Bash
==================================================
             JOGO DA FORCA - README
==================================================

Um jogo da forca totalmente desenvolvido em Shell 
Script (Bash), executado diretamente no terminal, 
com suporte a cores, múltiplas categorias e níveis 
de dificuldade.

Este projeto tem como objetivo praticar conceitos de:

Lógica de programação
Estruturas de controle (if, case, loops)
Manipulação de strings
Arrays em Bash
Interação com o usuário via terminal

O jogo sorteia uma palavra aleatória e o jogador deve 
descobri-la antes de atingir o limite de erros.

--------------------------------------------------
REQUISITOS
--------------------------------------------------
- Sistema operacional: Ubuntu/Debian (Linux)
- Bash versão 4 ou superior

Para verificar a versão do Bash instalada:
  $ bash --version

--------------------------------------------------
COMO EXECUTAR
--------------------------------------------------
1. Instale ou crie um arquivo com o código, com o
nome forca.sh

2. Abra o terminal na pasta onde o arquivo está

3. Dê permissão de execução ao script (apenas na
   primeira vez):
     $ chmod +x forca.sh

4. Execute o jogo:
     $ ./forca.sh

--------------------------------------------------
COMO JOGAR
--------------------------------------------------
- No menu principal, escolha uma opção:
    1 - Jogar
    2 - Instruções
    0 - Sair

- Ao iniciar uma partida, escolha a dificuldade:
    1 - Fácil   (8 tentativas)
    2 - Médio   (6 tentativas)
    3 - Difícil (4 tentativas)

- Durante o jogo você pode:
    - Digitar uma letra para tentar adivinhar
    - Digitar [1] para revelar a categoria da palavra
    - Digitar [2] para tentar adivinhar a palavra inteira
      (atenção: errar conta como um erro!)

- O jogo termina quando:
    - Você descobre todas as letras (VITÓRIA!)
    - Você esgota as tentativas (DERROTA!)

- Ao final de cada partida, pressione ENTER para
  voltar ao menu ou digite [1] para jogar novamente

--------------------------------------------------
MELHORIAS IMPLEMENTADAS
--------------------------------------------------

1. TRÊS NÍVEIS DE DIFICULDADE
   Fácil (8 erros), Médio (6 erros) e Difícil
   (4 erros), cada um com sua própria arte ASCII
   da forca com estágios adaptados. 

2.  PLACAR DE VITÓRIAS E DERROTAS
    O menu principal exibe o total de partidas
    vencidas e perdidas desde que o programa foi
    aberto.

3. QUATRO CATEGORIAS DE PALAVRAS
   O jogo sorteia aleatoriamente uma categoria a
   cada partida entre: Objetos, Países, Animais e
   Filmes. Cada categoria tem 20 palavras no banco.

4. SISTEMA DE DICA
   O jogador pode digitar [1] a qualquer momento
   para revelar a qual categoria a palavra pertence
   (ex: "Animal", "País", etc.).

5. ADIVINHAR A PALAVRA INTEIRA
   Digitando [2], o jogador pode tentar adivinhar
   a palavra completa. Se errar, perde uma tentativa.

==================================================
