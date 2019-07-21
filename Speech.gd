extends Node2D

var pizza_phrases = ["Pizza is a savoury dish of \nItalian origin", 
"The word pizza first appeared \nin a Latin text from the central \nItalian town of Gaeta", 
"Pizza can be high in salt, fat \nand calories",
"The outer edge of pizza is sometimes \nreferred to as the cornicione",
"13% of the United States population \nconsumes pizza on any given day",
"The world's largest pizza measured \n1,261 square meters",
"In 2017, the world pizza market \nwas $128 billion"]

var normal_phrases = ["Clyde Zoia was an American football guard \nwho played four seasons with the \nChicago Cardinals", 
"Canal de San Juan is a station \nalong Line A of the Mexico City Metro",
"The Korg DSS-1 is a 12-bit polyphonic \nsampling synthesizer released \nin September 1986",
"Yggdrasil is an immense mythical \ntree that plays a central role in \nNorse cosmology",
"A disappearing gun is an obsolete \ntype of artillery which enabled a \ngun to hide from direct fire and \nobservation",
"Klisinko is a village in the administrative \ndistrict of Gmina Głubczyce in south-western \nPoland",
"Mlombo v Fourie is an important and \ncontentious case in South African \nproperty law",
"Kathryn Busby is an American film \nexecutive who is currently senior vice \npresident of development at Sony Pictures Television",
"Qarqe'an is a semiannual celebration \nobserved in Eastern Arabia"]
var type = "pizza"


# Called when the node enters the scene tree for the first time.
func _ready():
    if type == "pizza":
       $Label.text = "Pizza!"
    elif type == "pizzafact":
        $Label.text = pizza_phrases[randi() % len(pizza_phrases)]
    elif type == "fact":
        $Label.text = normal_phrases[randi() % len(normal_phrases)]
    
    $Timer.start()
    yield($Timer, "timeout")
    queue_free()