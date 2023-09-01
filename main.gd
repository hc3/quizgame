extends Control;

@onready var DisplayText = $VBoxContainer/DisplayText;
@onready var ListItem = $VBoxContainer/ItemList;
@onready var RestartButton = $VBoxContainer/Button;

var questions = readJson();

var item: Dictionary;
var indexItem: int = 0;
var correctAnwsers: float = 0;

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
	ListItem.show();
	RestartButton.hide();
	ListItem.clear();
	item = questions[indexItem];
	DisplayText.text = item.title;
	var options = item.options
	for option in options:
		ListItem.add_item(option);


func onAnwserIsSelected(index):
	if ( index == item.correctAwnserIndex):
		correctAnwsers += 1;
	indexItem += 1;
	refreshScene();


func onClickResetButton():
	correctAnwsers = 0;
	indexItem = 0;
	refreshScene();
