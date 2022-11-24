var/global/list/speech_toppings = list("|" = "i", "+" = "b", "_" = "u")

#define MAX_HUGE_MESSAGE_LEN 8192
#define POST_DELIMITER_STR "\<\>"
#define SPAN_NARRATE

/mob/verb/subtle(message as message)
	set name = "Subtle"
	set category = "IC"
	set desc = "Emote silently to people around you. Toggle 'Show Subtle Messages To Observers' to stop observers from seeing it."
	if(!filter_block_message(usr, message))
		usr.custom_emote_subtle(message = message)

/proc/log_subtle(text)
	if (config.log_say)
		game_log("SUBTLE", text)

/mob/proc/custom_emote_subtle(var/m_type=VISIBLE_MESSAGE, var/message = null) //This would normally go in emote.dm
	if(stat || !use_me && usr == src)
		to_chat(src, "You are unable to emote.")
		return

	var/muzzled = is_muzzled()
	if(m_type == 2 && muzzled) return

	var/input
	if(!message)
		input = sanitize_or_reflect(input(src,"Choose an emote to display.") as text|null, src)
	else
		input = message

	if(input)
		log_subtle(message)
		message = "<span class='emote_subtle'><B>[src]</B> <I>[input]</I></span>"
	else
		return

	if (message)
		var/undisplayed_message = "<span class='emote'><B>[src]</B> <I>does something too subtle for you to see.</I></span>"
		message = encode_html_emphasis(message)

		var/list/vis_mobs = list()
		var/list/vis_objs = list()
		get_mobs_and_objs_in_view_fast(get_turf(src),1,vis_mobs,vis_objs) //ok so the implementation on bay/neb directly mutates lists

		for(var/vismob in vis_mobs)
			var/mob/M = vismob
			if(isobserver(M) && (get_preference_value(/datum/client_preference/show_subtle) == PREF_HIDE) && !M.client?.holder)
				M.show_message(undisplayed_message, 2)
			else
				M.show_message(message, 2)

		for(var/visobj in vis_objs)
			var/obj/O = visobj
			O.see_emote(src, message, 2)

/proc/sanitize_or_reflect(message,user)
	//Way too long to send
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return

	message = sanitize(message, max_length = MAX_HUGE_MESSAGE_LEN)

	//Came back still too long to send
	if(length(message) > MAX_MESSAGE_LEN)
		fail_to_chat(user,message)
		return null
	else
		return message

// returns true if it failed
/proc/reflect_if_needed(message, user)
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return TRUE
	return FALSE

/proc/fail_to_chat(user,message)
	if(!message)
		to_chat(user, SPAN_DANGER("Your message was NOT SENT, either because it was FAR too long, or sanitized to nothing at all."))
		return

	var/length = length(message)
	var/posts = CEILING(length/MAX_MESSAGE_LEN)
	to_chat(user,message)
	to_chat(user, SPAN_DANGER("^ This message was NOT SENT ^ -- It was [length] characters, and the limit is [MAX_MESSAGE_LEN]. It would fit in [posts] separate messages."))

/proc/encode_html_emphasis(message)
	var/tagged_message = message
	for(var/delimiter in speech_toppings)
		var/regex/R = new("\\[delimiter](.+?)\\[delimiter]","g")
		var/tag = speech_toppings[delimiter]
		tagged_message = R.Replace(tagged_message,"<[tag]>$1</[tag]>")

	return tagged_message

/mob/living/verb/player_narrate(message as message)
	set category = "IC"
	set name = "Narrate (Player)"
	set desc = "Narrate an action or event! An alternative to emoting, for when your emote shouldn't start with your name!"

	if(src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return
	if(!message)
		message = input(usr, "Type a message to narrate.","Narrate") as message
	message = sanitize_or_reflect(message,src)
	if(!message)
		return
	if(stat == DEAD)
		return say_dead(message)
	if(stat)
		to_chat(src, "<span class= 'warning'>You need to be concious to narrate: [message]</span>")
		return
	message = "<span class='name'>([name])</span> <span class='italic'>[message]</span>"

	//Below here stolen from emotes
	var/turf/T = get_turf(src)

	if(!T) return

	var/list/in_range = list()
	var/list/objects = list()
	var/list/m_viewers = list()

	get_mobs_and_objs_in_view_fast(T,world.view,in_range, objects)

	m_viewers = in_range["mobs"]

	for(var/mob/M as anything in m_viewers)
		spawn(0) // It's possible that it could be deleted in the meantime, or that it runtimes.
		if(M)
			if(isobserver(M))
				message = "[message] ([ghost_follow_link(src, M)])"
			if(isnewplayer(M))
				continue
			if(M.stat == UNCONSCIOUS)
				continue
			to_chat(M, message)
	log_emote(message, src)

#undef MAX_HUGE_MESSAGE_LEN
#undef POST_DELIMITER_STR