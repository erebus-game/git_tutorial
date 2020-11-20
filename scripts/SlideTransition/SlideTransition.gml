/// @function SlideTransition();
/// @param {Mode} mode sets transition mode between next, restart and goto
/// @param {Room} target sets target room when using the goto mode
function SlideTransition(){
	with (oTransition) {
		mode = argument[0];
		if (argument_count > 1) {
			target = argument[1];	
		}
	}
}