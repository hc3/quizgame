Primeiro cria um user interface que vai vir com o Control na raiz.


- cria uma TextureRect
    - coloca uma imagem no background do TextureRect. ( imagem no assets ).

- cria uma Label
    - insere um texto.
    - é possível editar o texto da label e formatar.

- cria um ItemList
    - é possível adicionar um tema para a ItemList

- criau ma Button.

para criar algo como uma div no layout podemos usar o VBoxContainer.item

questões em JSON.

[
    {
        "question": "Quem descobriu o Brasil Pedro Alvares Ca___?"
        "options": ['bral','brel','bril','brol'],
        "correctAwnserIndex: 0
    },
    {
        "question": "Quem é o pai da computação?"
        "options": ['Allan turring','Geoge Washington','Luva de pedreiro','Vovô Mafalfa'],
        "correctAwnserIndex: 0
    }
]



class QuestãoMultiplaEscolha {
    titulo: string;
    alternativas: Array<string>
    respostaCorretaBaseadaNoindex: number;
}

{
	"title": "Qual é a equação balanceada correta para a reação de combustão do metano (CH₄)?",
	"options": [
	  "CH₄ + 2O₂ -> CO₂ + H₂O",
	  "CH₄ + O₂ -> CO₂ + H₂O",
	  "CH₄ + 3O₂ -> 2CO₂ + 3H₂O",
	  "CH₄ -> CO₂ + H₂O"
	],
	"correctAwnserIndex": 0
  }

class QuestãoPreencheValores {
    titulo: string;
    alternativas: Array<string>
}

{
    "title": "Preencha com os valores para realizar o balanceamento.",
    "options": ["?C","?O₂","->","?CO₂"],
    "correctAwnser": [1, 1, 1]
}

