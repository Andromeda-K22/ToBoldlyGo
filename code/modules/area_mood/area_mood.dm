#define AREA_MOOD_ADJUST_TIME 5 MINUTES

//Nonmodular because I can't give a shit about modularizing.

/area/
	var/mood = "No mood set."//The mood of the area.
	var/mood_last_adjusted = 0
	var/can_set_mood = FALSE

/mob/living/verb/check_area_mood()
	set name = "Check Area Mood"
	set desc = "Check the narrative mood of the area you're in."
	set category = "IC"
	var/turf/T = get_turf(src)
	var/area/A = T.loc

	to_chat(src, SPAN_NOTICE("The current narrative mood for this area is:"))
	to_chat(src, SPAN_SUBTLE("[A.mood]"))

/mob/living/verb/set_area_mood()
	set name = "Set Area Mood"
	set desc = "Set the narrative mood of the area you're in."
	set category = "IC"

	var/turf/T = get_turf(src)
	var/area/A = T.loc
	var/message

	if(QDELETED(src) || src.incapacitated() )
		return

	if(!A.can_set_mood)
		to_chat(src, SPAN_DANGER("The mood for this area cannot be set."))
		return
	if((A.mood_last_adjusted+AREA_MOOD_ADJUST_TIME > world.time) && A.mood_last_adjusted != 0)
		to_chat(src, SPAN_WARNING("The mood for this area has been adjusted too recently. You can adjust it in [time2text(((A.mood_last_adjusted+AREA_MOOD_ADJUST_TIME) - world.time),"mm")] minutes."))
		return
	message = input(usr, "Type a message to set the area's mood. Under 2048 characters.","Area Mood") as message
	message = sanitize_text(message)
	if(!message)
		return
	if(length(message) > 2048)
		to_chat(src, SPAN_WARNING("The mood you have entered is too long by [length(message)-2048] characters."))
		to_chat(src, SPAN_WARNING("[message]"))
		return

	if(QDELETED(src) || src.incapacitated() )
		return

	A.mood = message
	A.mood_last_adjusted = world.time
	log_admin("[key] has set the mood of [A] to [message].")
	for(var/mob/living/M in A)
		to_chat(A, SPAN_NOTICE("A new mood for this area has been set by \the [src]."))
		to_chat(src, SPAN_SUBTLE("[A.mood]"))

#undef AREA_MOOD_ADJUST_TIME