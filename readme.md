# Questões em forma de classe JSON.


```typescript
class QuestãoFactory {

}

class QuestãoMultiplaEscolha { 
	titulo: string; 
	alternativas: Array;
	verificaQuestão();
	tipo: TipoQuestão;
}

{ 
	"title": "Qual é a equação balanceada correta para a reação de combustão do metano (CH₄)?", 
	"options": [ "CH₄ + 2O₂ -> CO₂ + H₂O", "CH₄ + O₂ -> CO₂ + H₂O", "CH₄ + 3O₂ -> 2CO₂ + 3H₂O", "CH₄ -> CO₂ + H₂O" ], 
	"correctAwnser": 0 
}

class QuestãoPreencheValores { 
	titulo: string; 
	alternativas: Array;
	verificaQuestão();
	tipo: TipoQuestão;
}

{ 
	"title": "Preencha com os valores para realizar o balanceamento.", 
	"options": ["?C","?O₂","->","?CO₂"], 
	"correctAwnser": [1, 1, 1] 
}

class QuestãoOrdenaValores {
	titulo: string;
	alternativas: Array;
	verificaQuestão();
	tipo: TipoQuestão;
}
```

- para adicionar um item.

```
print('Preenche valores.');
ListItem.hide();
$VBoxContainer/HBoxContainer.add_child(LineEdit.new());
var label = Label.new();
label.text = 'brincando';
$VBoxContainer/HBoxContainer.add_child(label);
```
