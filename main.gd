extends Control;

@onready var DisplayText = $VBoxContainer/DisplayText;
@onready var ListItem = $VBoxContainer/ItemList;
@onready var RestartButton = $VBoxContainer/Button;

var questions = readJson();

var item: Dictionary;
var indexItem: int = 0;
var correctAnwsers: float = 0;
var inputsToValid = [];

func readJson():
	var json_as_text = FileAccess.get_file_as_string("res://questions.json")
	return JSON.parse_string(json_as_text)
	

func _ready():
	refreshScene();
	
func refreshScene():
	if ( indexItem >= questions.size()):
		showResult();
	else:
		showQuestions();

func showResult():
	ListItem.hide();
	RestartButton.show();
	var score = round(correctAnwsers / questions.size() * 100);
	var greet;
	if ( score >= 60 ):
		greet = 'Parabéns';
	else:
		greet = 'Ops'
	DisplayText.text = "%s : sua pontuação total é %s" % [greet, score];
	
func showQuestions():
	item = questions[indexItem];
	DisplayText.text = item.title;
	if(item.tipo == 'MULTIPLE_CHOICE_QUESTION'):
		print('Multipla Escolha.');
		ListItem.show();
		RestartButton.hide();
		ListItem.clear();
		for option in item.options:
			ListItem.add_item(option);
	
	if(item.tipo == 'QUESTION_FILL_VALUES'):
		ListItem.hide();
		for option in item.options:
			if(option.begins_with('?')):
				option = option.replace('?','');
				createLineEdit();
				createLabel(option);
			else:
				createLabel(option);
		var button = Button.new();
		button.text = 'Verificar';
		button.pressed.connect(onButtonPressed)
		$VBoxContainer/HBoxContainerButton.add_child(button);
		
	if(item.tipo == 'QUESTION_SORT_VALUES'):
		print('Ordena valores.');


func onAnwserIsSelected(index):
	if ( index == item.correctAwnser):
		correctAnwsers += 1;
	indexItem += 1;
	refreshScene();


func onClickResetButton():
	correctAnwsers = 0;
	indexItem = 0;
	refreshScene();

func createLineEdit():
	var input = SpinBox.new();
	$VBoxContainer/HBoxContainer.add_child(input);
	inputsToValid.push_back(input);
	
func onButtonPressed():
	var areEqual = true;
	for x in range(inputsToValid.size()):
		var valorDoPrimeiroArray = inputsToValid[x]['value'];
		var valorDoSegundoArray = item.correctAwnser[x];
		
		if valorDoPrimeiroArray != valorDoSegundoArray:
			areEqual = false;
			break;
			
	if areEqual:
		print('resposta certa.');
	else:
		print('resposta errada.');
	
func createLabel(option):
	var label = Label.new();
	label.text = option;
	$VBoxContainer/HBoxContainer.add_child(label);
