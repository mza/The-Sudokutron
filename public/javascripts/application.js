function prepare_focus() {
	$('command').focus();
}

function swap() {
	if ($('solve_link').innerHTML == "solve") {
		$('solve_link').innerHTML = "hide";
	} else {
		$('solve_link').innerHTML = "solve";		
	}
	$('solution').toggle();
	$('puzzle').toggle();
}

function submit() {
	possible = 0;
	correct = 0;
	incorrect = 0;
	for (row=0; row<=8; row++) {
		for (col=0; col<=8; col++) {
			value = $(row + "_" + col).value
			if (value != null) {
				possible = possible + 1;
				if (value != "") {
					sol = $("solution_" + row + "_" + col).innerHTML;
					if (value == sol) {
						correct = correct + 1;
					} else {
						incorrect = incorrect + 1;
					}
				}
			}
		}
	}
	
	if (possible > 0) {
		alert('Correct: ' + correct + ' of ' + possible + "\nIncorrect: " + incorrect);
	}
	
}