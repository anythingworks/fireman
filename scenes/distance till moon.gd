extends RichTextLabel
var distance = 1500

func _process(delta):
	set_text(str(distance) + 'KM')
	
func _on_Timer4distancce_timeout():
	distance += -1
