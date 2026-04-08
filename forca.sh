#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
GRAY="\033[90m"
BOLD="\033[1m"
RESET="\033[0m"

objetos=("cadeira" "geladeira" "televisao" "teclado" "mouse" "relogio" "lampada" "mochila" "tesoura" "garrafa" "caderno" "impressora" "microfone" "calculadora" "headphone" "ventilador" "cafeteira" "bicicleta" "caneta" "aspirador")

# Banco de países
paises=("brasil" "argentina" "franca" "alemanha" "japao" "canada" "australia" "mexico" "italia" "portugal" "china" "russia" "egito" "india" "chile" "colombia" "noruega" "suecia" "turquia" "grecia")

# Banco de animais
animais=("elefante" "girafa" "crocodilo" "pinguim" "camelo" "leopardo" "gorila" "tartaruga" "rinoceronte" "flamingo" "ornitorrinco" "chimpanze" "anaconda" "tubarao" "albatrozes" "canguru" "hiena" "javali" "polvos" "falcao")

# Banco de filmes
filmes=("avatar" "matrix" "titanic" "interstellar" "gladiador" "parasita" "inception" "joker" "gravity" "spotlight" "braveheart" "platoon" "amadeus" "fargo" "chinatown" "casablanca" "metropolis" "psycho" "vertigo" "moonlight")

# placar que fica salvo enquanto o programa tá aberto
perdas=0
ganhos=0

# essa função recebe uma letra e revela ela em todas as posições que aparece na palavra
revelarLetra(){
for ((i=0; i<tam; i++)); do
    if [ "${palavra:$i:1}" == "$1" ]; then
        palavra_oculta[$i]="$1"
        ((count_acertos++))
    fi
done
    
echo
 
}

# desenha a forca e o boneco de acordo com quantos erros o jogador cometeu
# recebe a dificuldade como argumento pra saber qual boneco mostrar
forca(){
    case $1 in     
        1)  echo -e "${YELLOW}Erros: $erros/8${RESET}"
            echo -e "${RED}Letras erradas:${RESET} ${letras_erradas%-}"
            echo
            case $erros in
                 0) echo -e " ______\n |\n |\n |\n |\n |  \n=====" ;;
                 1) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |\n | \n |  \n=====" ;;
                 2) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |    ${RED}|${RESET} \n |\n |  \n====="  ;;
                 3) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|${RESET} \n |\n |  \n====="  ;;
                 4) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |\n |  \n=====" ;;
                 5) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/${RESET}  \n |  \n=====" ;;
                 6) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/ \ ${RESET}  \n |  \n=====" ;;
                 7) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/ \ ${RESET}  \n |  ${RED}º  ${RESET}  \n=====" ;;
                 8) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/ \ ${RESET}  \n |  ${RED}º   º ${RESET}  \n=====" ;;
            esac
            ;;

        2)  echo -e "${YELLOW}Erros: $erros/6${RESET}"
            echo -e "${RED}Letras erradas:${RESET} ${letras_erradas%-}"
            echo

            case $erros in
                0) echo -e " ______\n |\n |\n |\n |\n=====" ;;
                1) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |\n | \n=====" ;;
                2) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |    ${RED}|${RESET} \n |\n=====" ;;
                3) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|${RESET} \n |\n=====" ;;
                4) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\  ${RESET} \n |\n=====" ;;
                5) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\  ${RESET} \n |   ${RED}/${RESET}  \n=====" ;;
                6) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/ \  ${RESET}  \n=====" ;;
            esac
            ;;

        3)  echo -e "${YELLOW}Erros: $erros/4${RESET}"
            echo -e "${RED}Letras erradas:${RESET} ${letras_erradas%-}"
            echo

            case $erros in
                0) echo -e " ______\n |\n |\n |\n |\n=====" ;;
                1) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |\n | \n=====" ;;
                2) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |    ${RED}|${RESET} \n |\n=====" ;;
                3) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\  ${RESET} \n |\n=====" ;;
                4) echo -e " ______\n |    |\n |    ${RED}O${RESET}\n |   ${RED}/|\ ${RESET} \n |   ${RED}/ \  ${RESET}  \n=====" ;;
            esac  
            ;;
    esac
    
     # mostra a dica se o jogador já pediu, senão só avisa que pode pedir
    if [ "$dica_flag" == "1" ]; then
        echo
        echo -e "Dica: A palavra é um ${YELLOW}${dica}${RESET}"
    else 
        echo
        echo -e "${GRAY}Digte [1] se desejar um dica${RESET}"
    fi
    
    echo -e "${GRAY}Digte [2] para adivinhar a palavra!${RESET}"
    echo
    echo -e "${GREEN}Palavra:${RESET} ${palavra_oculta[@]}"
    echo

}


# menu principal, fica em loop até o jogador sair
menu(){
    while true; do
        clear
        echo -e "${CYAN}${BOLD}"
        echo "=================================="
        echo "         JOGO DA FORCA"
        echo "=================================="
        echo -e "${RESET}"
         # mostra quantas partidas ganhou e perdeu na sessão
        echo -e "${YELLOW}Partidas vencidas: $ganhos ${RESET} ${RED}Perdidas: $perdas ${RESET}"
        echo -e "==============================="
        echo "1 - Jogar"
        echo "2 - Instruções"
        echo "0 - Sair"
        echo
        echo -ne "${YELLOW}Escolha uma opção: ${RESET}"
        read opcao

        case $opcao in
            1) 
                jogo
                ;;
            2)
                instrucoes
                ;;
            0)
                echo "Saindo..."
                sleep 1
                exit
                ;;
            *)
                echo "Opção inválida!"
                sleep 1
                ;;
        esac
    done
}



# sorteia a categoria e depois uma palavra dentro dela
# também define a dica pra caso o jogador precise
sortearPalavra(){
    categoria=$((RANDOM % 4 + 1))
    
    case $categoria in
        1)  indice=$((RANDOM % ${#objetos[@]}))
            palavra=${objetos[$indice]}
            dica="Objeto"
            ;;
        2)  indice=$((RANDOM % ${#paises[@]}))
            palavra=${paises[$indice]}
            dica="País"
            ;;
        3)  indice=$((RANDOM % ${#animais[@]}))
            palavra=${animais[$indice]}
            dica="Animal"
            ;;
        4)  indice=$((RANDOM % ${#filmes[@]}))
            palavra=${filmes[$indice]}
            dica="Filme"
            ;;
        *)  indice=$((RANDOM % ${#objetos[@]}))
            palavra=${objetos[$indice]}
            dica="Objeto"
            ;;
    esac
}
 
# função principal que roda uma partida inteira
jogo(){
    # zera tudo antes de começar
    dica_flag=0
    dica=""
    erros=0
     
    letras_digitadas=""
    letras_erradas=" "
     
    count_acertos=0
    
    sortearPalavra 
     
    tam=${#palavra} # guarda o tamanho da palavra pra usar nos loops
     
    palavra_oculta=()
    
    # pergunta a dificuldade antes de mostrar a palavra
    clear
    echo -e "${CYAN}${BOLD}ESCOLHA A DIFICULDADE ${RESET}"
    echo -e "${GREEN}1 - Fácil (8 erros)${RESET}"
    echo -e "${YELLOW}2 - Médio (6 erros)${RESET}"
    echo -e "${RED}3 - Difícil (4 erros)${RESET}"
    echo
    echo -ne "${YELLOW}Escolha uma opção: ${RESET}"
    read op_dif

    case $op_dif in
        1) max_erros=8 ;;
        2) max_erros=6 ;;
        3) max_erros=4 ;;
        *)
            echo "Opção inválida! Usando dificuldade Médio."
            sleep 1
            max_erros=6
            ;;
            
    esac
    
    clear
    echo "Descubra a palavra: "
    printf '%.0s_ ' $(seq 1 $tam)
     
    #preparando a palavra que vai ser descoberta:
    # cria o array com underscores, um pra cada letra da palavra
    for ((i=0; i<tam; i++)); do 
        palavra_oculta+=("_")
    done

    # loop do jogo: continua enquanto não errou demais e ainda tem letra pra descobrir
    for ((i=0; erros<max_erros && count_acertos<tam; i++)); do
        clear
        forca "$op_dif"
     
        # fica pedindo entrada até receber algo válido
        while true; do
            read -p "Digite uma letra: " letra

            if [[ "$letra" == "1" ]]; then 
                # jogador pediu dica
                dica_flag=1
                clear
                forca "$op_dif"
            elif [[ "$letra" == "2" ]]; then
                # jogador vai tentar adivinhar a palavra inteira
                #echo $palavra
                read -p "Digite a palavra: " resposta
                if  [[ "$resposta" == "$palavra" ]]; then
                    count_acertos="$tam"; # força a vitória saindo do loop
                    break
                else # errou a palavra, conta como um erro
                    ((erros++))
                    echo 
                    echo -e "${RED}${BOLD}ERROU!${RESET}"
                    sleep 1.5
                    clear      
                    forca "$op_dif"

                fi
            elif [[ "$letra" =~ ^[a-zA-Z]$ ]]; then
                # entrada válida, converte pra minúsculo e sai do while
                letra=$(echo "$letra" | tr 'A-Z' 'a-z')
                break
            else
                echo -e "Digite apenas uma letra válida!"
            fi
        done
     
         # verifica a letra digitada (o if evita processar quando veio do adivinhar a palavra)
        if [[ "$letra" =~ ^[a-zA-Z]$ ]]; then
            if [[ "$letras_digitadas" == *"$letra"* ]]; then
                echo "Esta letra ja foi utilizada, digite outra!"
                sleep 1
            else
                if [[ "$palavra" == *"$letra"* ]]; then
                    revelarLetra "$letra"
                else
                    ((erros++))
                    letras_erradas+="$letra-"
                fi
                letras_digitadas+="$letra"
            fi
        fi
    done  
    
    # mostra o resultado final
    clear
    forca "$op_dif"

    if [ $count_acertos -eq $tam ]; then
        echo -e "${GREEN}${BOLD} VOCÊ GANHOU! ${RESET}"
        echo -e "A palavra era: ${YELLOW}$palavra${RESET}"
        ((ganhos++))
    else
        echo -e "${RED}${BOLD} VOCÊ PERDEU! ${RESET}"
        echo -e "A palavra era: ${YELLOW}$palavra${RESET}"
        ((perdas++))
    fi

    echo
    echo -e "${YELLOW}Pressione ENTER para voltar ao menu...${RESET}"
    echo -e "${YELLOW}... Ou digite [1] se deseja jogar novamente${RESET}"
    read op

    if [ "$op" = "1" ]; then 
        clear
        echo -e "${GREEN} Iniciando nova partida... ${RESET}"
        sleep 2
        jogo
    fi
    
    
   
}

# inicia o programa pelo menu
menu
