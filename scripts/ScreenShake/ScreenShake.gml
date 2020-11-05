// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @desc ScreenShake(magnitude, frames)
/// @param {int} magnitude sets the strength of the shake
/// @param {int} frames Sets the length of the shake in frames
function ScreenShake(magnitude, frames){
	with (oCamera) {
		if (magnitude> shake_remain) {
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}