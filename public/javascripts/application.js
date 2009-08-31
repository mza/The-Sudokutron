function prepare_focus() {
	$('command').focus();
}

function swap() {
	$('solution').toggle();
	$('puzzle').toggle();
}

function submit() {
	alert($("solution_0_0").innerHTML);
}