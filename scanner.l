/*C lib for includes*/

trash	 [\n\t\0]
numero	 [0-9]
letra 	 [A-zçÇ_]
igual 	 ["="]
ponto 	 ["."]
alfaNum	 [0-9A-z]
pVirgula [";"]



%%

(INTEGER)			printf("(palavra reservada, int)");
(DECIMAL)			printf("(palavra reservada, float)");
(CATAPOBIO)			printf("(palavra reservada, função principal)");
(WHILE)				printf("(palavra reservada, while)");
(DO)				printf("(palavra reservada, ordem ");
(BEGIN)				printf("(palavra reservada, inicio de bloco)");
(END)				printf("(palavra reservada, fim de block)");
(IF)				printf("(palavra reservada, if)");
(THEN)				printf("(palavra reservada, then)");
(ELSE)				printf("(palavra reservada, else)");
(PRINT)				printf("(palavra reservada, print)");

{numero}+	     		printf("(integer)");
{numero}*{ponto}{numero}+ 	printf("(decimal)");
{igual}{2}			printf("(comparação)");
{letra}{alfaNum}*		printf("(identificador)");
{pVirgula}			printf("(ponto e virgula)");
{ponto}				printf("(ponto)");

!{igual}			printf("(diferente)");
:{igual}			printf("(atribuição)");
\"{letra}+{2}\"  		printf("(string)");
"//"[A-z0-9 ]*"\n"  		printf("(comentario)");
"\-"				printf("(operador, 'subtração')");
"\+"				printf("(operador, 'adição')");
"\/"				printf("(operado, 'divisão')");
"\*"				printf("(operador, 'multiplicação')");

%%

int main(int argc, char **argv){

	printf("==Flex iniciado==\n\n");

	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);

}
