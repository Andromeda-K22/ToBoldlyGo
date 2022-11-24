var/list/global/age_verified_this_round = list()

/mob/new_player/Login()

	ASSERT(loc == null)

	update_Login_details()	//handles setting lastKnownIP and computer_id for use by the ban systems as well as checking for multikeying
	if(join_motd)
		to_chat(src, "<div class=\"motd\">[join_motd]</div>")
	to_chat(src, "<div class='info'>Game ID: <div class='danger'>[game_id]</div></div>")

	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	verify_player_age()

	global.using_map.show_titlescreen(client)
	my_client = client
	set_sight(sight|SEE_TURFS)
	global.player_list |= src

	if(!SScharacter_setup.initialized)
		SScharacter_setup.newplayers_requiring_init += src
	else
		deferred_login()

// This is called when the charcter setup system has been sufficiently initialized and prefs are available.
// Do not make any calls in mob/Login which may require prefs having been loaded.
// It is safe to assume that any UI or sound related calls will fall into that category.
/mob/new_player/proc/deferred_login()
	if(!client)
		return

	client.prefs?.apply_post_login_preferences()
	client.playtitlemusic()
	maybe_send_staffwarns("connected as new player")

	show_lobby_menu(TRUE)

	var/decl/security_state/security_state = GET_DECL(global.using_map.security_state)
	var/decl/security_level/SL = security_state.current_security_level
	var/alert_desc = ""
	if(SL.up_description)
		alert_desc = SL.up_description

	to_chat(src, SPAN_NOTICE("The alert level on the [station_name()] is currently: <font color=[SL.light_color_alarm]><B>[SL.name]</B></font>. [alert_desc]"))

	// bolds the changelog button on the interface so we know there are updates.
	if(client.prefs?.lastchangelog != global.changelog_hash)
		to_chat(client, SPAN_NOTICE("You have unread updates in the changelog."))
		if(config.aggressive_changelog)
			client.changes()

/mob/new_player/proc/verify_player_age()
	var/time = text2num(time2text(world.realtime, "YYYY")) //it distresses me that byond keeps track of time from some weird date instead of unix epoch. Oh well.
	var/input
	var/DBQuery/query
	if(establish_db_connection())
		query = dbcon.NewQuery("SELECT COUNT(`ckey`) FROM `mazian_custom`")
		query.Execute()

	if(!(client.ckey in age_verified_this_round) || (!query.item[1]))

		input = input(client, "Please input your Year Of Birth. You must be 18 years or older.", "Age Check", null) as num

		if(!input) //if this is somehow null, kick and make them try again.
			alert(client, "The date you have entered is invalid.", "Invalid Response", "OK")
			del(client)

		if((input > time) || (input < time-90)) //You are not born in the future and you are not over 90 years old.
			alert(client, "The date you have entered is invalid.", "Invalid Response", "OK")
			log_admin("[client.ckey] entered a Year Of Birth that was in the future.")
			del(client)

		while(input == null)
			stoplag(1)

		if((time-input) >= 18) //they're legal
			log_admin("[client.ckey] has successfully verified their age.")
			age_verified_this_round |= client.ckey
			if(establish_db_connection())
				//this player does not exist in the DB!
				var/DBQuery/entryquery = dbcon.NewQuery("INSERT INTO `mazian_custom` (`ckey`, `date`) VALUES ('[client.ckey]', NOW())")
				entryquery.Execute()
				to_chat(client, SPAN_NOTICE("Your YoB has been logged in the database. You will not need to re-enter it in the future."))
			else
				to_chat(client, SPAN_WARNING("Database connection failed. You are authorized for the duration of this round, but will need to re-enter your YoB in the future."))
		else
			log_admin("[client.ckey] has failed age verification and been auto-banned.")
			AddBan(client.ckey, client.computer_id, "Failed YoB Verification", "Server", 0)
			del(client)
	else
		return