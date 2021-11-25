#include <stdio.h>
#include <stdlib.h>

extern void ordena(int *vetor, int tamanho);
 
int main(){
    int* vetor = NULL;
    int tam = 0;
    vetor = (int *) malloc(sizeof (int));
    printf("Digite o numero que deseja salvar ou -1 para parar \n");
    scanf("%d", &vetor[tam]);
    while (vetor[tam]!=-1){ 
        tam ++;
        vetor = (int *) realloc(vetor,(tam+1) * sizeof (int));
        printf("Digite o numero que deseja salvar ou -1 para parar \n");
        scanf("%d", &vetor[tam]);
    }
    ordena(vetor, tam);
    for (int i=0;i<tam;i++){
        printf ("%d ", vetor[i]);
    }
    return 0;
}