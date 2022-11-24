#define STATE_EMPTY 1
#define STATE_LOADED 2
#define STATE_SECURED 3


/obj/machinery/probe_launcher
	name = "probe launcher"
	desc = "A converted ASM-S-5 torpedo tube intended to launch astrocartographical drones. Stand clear when operating."
	icon = 'maps/torch/icons/probe_launcher.dmi'
	icon_state = "torpedo"
	density = TRUE
	anchored = TRUE
	var/load_state = STATE_EMPTY
	var/department_type = /decl/department/exploration //i dont think this will ever be useful, but here it is just in case.
	var/obj/structure/astrocartography_probe/loaded_probe
	var/obj/effect/overmap/visitable/ship/sector
	var/height = 3
	var/width = 2

/obj/machinery/probe_launcher/Initialize()
	. = ..()
	sector = get_owning_overmap_object()
	SetBounds()

/obj/machinery/probe_launcher/on_update_icon()
	. = ..()
	if(load_state == STATE_LOADED)
		icon_state = "torpedo_loaded"
	else
		icon_state = initial(icon_state)

/obj/machinery/probe_launcher/receive_mouse_drop(atom/dropping, mob/user)
	if(istype(dropping, /obj/structure/astrocartography_probe) && load_state == STATE_EMPTY)
		var/obj/structure/astrocartography_probe/P = dropping
		if(P.completed)
			visible_message(SPAN_NOTICE("You begin to load [P] into [src]..."), SPAN_WARNING("[user] begins to load [P] into [src]."))
			if(do_after(user, (10 SECOND), src))
				visible_message(SPAN_NOTICE("You load [P] into [src]."), SPAN_WARNING("[user] loads [P] into [src]."))
				P.forceMove(src)
				playsound(src, 'sound/effects/metalscrape3.ogg', 75, 1)
				loaded_probe = P
				load_state = STATE_LOADED
				flick(icon, "torpedo_loading")
				addtimer(CALLBACK(src, /atom/proc/update_icon),0.5 SECOND)
		else
			to_chat(user, SPAN_WARNING("The [src] cannot load an incomplete probe."))
			return


/obj/machinery/probe_launcher/physical_attack_hand(var/mob/user)
	if(loaded_probe && load_state == STATE_LOADED )
		visible_message(SPAN_NOTICE("You begin to unload [loaded_probe] from the [src]..."), SPAN_WARNING("[user] begins to unload [loaded_probe] from the [src]."))
		if(do_after(user, (10 SECOND), src))
			visible_message(SPAN_NOTICE("You unload [loaded_probe] from the [src]."), SPAN_WARNING("[user] unloads [loaded_probe] from the [src]."))
			loaded_probe.forceMove(get_turf(user))
			playsound(src, 'sound/effects/metalscrape1.ogg', 75, 1)
			loaded_probe = null
			load_state = STATE_EMPTY
			flick(icon, "torpedo_unloading")
			addtimer(CALLBACK(src, /atom/proc/update_icon),0.5 SECOND)
	. = ..()

/obj/machinery/probe_launcher/proc/SetBounds()
	if (dir == NORTH || dir == SOUTH)
		bound_width = width * world.icon_size
		bound_height = height * world.icon_size
	else
		bound_width = height * world.icon_size
		bound_height = width * world.icon_size

/obj/machinery/probe_launcher/proc/start_launch_probe() //do some setup, pop it out of the tube.
	if(!loaded_probe)
		return
	loaded_probe.layer = layer - 0.01 //nudge it below our layer
	vis_contents += loaded_probe
	loaded_probe.dir = dir
	playsound(loc, 'sound/effects/bang.ogg', 50, 1, 5)
	switch(dir)
		if(SOUTH)
			loaded_probe.pixel_x += 16
			animate(loaded_probe, pixel_y = -128, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT)
			addtimer(CALLBACK(src, .proc/finish_launch_probe), 3.1 SECONDS)
		if(EAST)
			animate(loaded_probe, pixel_x = 128, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT)
			addtimer(CALLBACK(src, .proc/finish_launch_probe), 3.1 SECONDS)
			loaded_probe.pixel_y += 76
		if(WEST)
			animate(loaded_probe, pixel_x = -128, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT)
			addtimer(CALLBACK(src, .proc/finish_launch_probe), 3.1 SECONDS)
			loaded_probe.pixel_y += 76
		if(NORTH)
			loaded_probe.pixel_x -= 16
			animate(loaded_probe, pixel_y = 128, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT)
			addtimer(CALLBACK(src, .proc/finish_launch_probe), 3.1 SECONDS)

/obj/machinery/probe_launcher/proc/finish_launch_probe() //WOOSH.
	playsound(loc,'sound/effects/rocket.ogg',100)
	switch(dir)
		if(SOUTH)
			animate(loaded_probe, pixel_y = -800, time = 2 SECONDS, easing = SINE_EASING|EASE_IN)
		if(EAST)
			animate(loaded_probe, pixel_x = 800, time = 2 SECONDS, easing = SINE_EASING|EASE_IN)
		if(WEST)
			animate(loaded_probe, pixel_x = -800, time = 2 SECONDS, easing = SINE_EASING|EASE_IN)
		if(NORTH)
			animate(loaded_probe, pixel_y = 800, time = 2 SECONDS, easing = SINE_EASING|EASE_IN)
	report_probe_launch_to_goals()

/obj/machinery/probe_launcher/proc/report_probe_launch_to_goals()
	var/decl/department/D = GET_DECL(department_type)
	for(var/datum/goal/department/exploration/probe_launch/P in D.goals)
		P.register_probe_launch(sector.loc, loaded_probe, sector)