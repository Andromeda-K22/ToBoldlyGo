/obj/structure/astrocartography_probe
	name = "astrocartography probe chassis"
	desc = "A chassis for an astrocartography probe. Obstensibly a retrofitted antiship missile body, despite the serial number having been hastily ground off. This one is incomplete."
	icon = 'maps/torch/icons/astrocartography_drone_big.dmi'
	icon_state = "base"
	var/has_engine = FALSE
	var/has_probe_package = FALSE
	var/has_guidance_package = FALSE
	var/panel_open = FALSE
	var/is_wired = FALSE
	var/has_power_cell = FALSE
	var/completed = FALSE
	var/obj/item/astrocartography_equipment/astro_probe_head/probehead //used for desc stuff and checking the type for goals.

/obj/structure/astrocartography_probe/finished
	completed = TRUE

/obj/structure/astrocartography_probe/on_update_icon()
	cut_overlays()
	if(has_engine)
		add_overlay(image(icon, "engine"))
	if(probehead)
		add_overlay(image(icon, "probe_head"))
		var/image/I = image(icon, "probe_overlay")
		I.color = probehead.overlay_color
		add_overlay(I)
	if(panel_open)
		add_overlay(image(icon, "panel_open"))
	if(!panel_open)
		add_overlay(image(icon, "panel"))

/obj/structure/astrocartography_probe/Destroy()
	. = ..()
	probehead = null

/obj/structure/astrocartography_probe/examine(mob/user, distance, infix, suffix)
	. = ..()

	if(panel_open)
		to_chat(user, SPAN_NOTICE("The panel is open."))
		if(has_engine)
			to_chat(user, SPAN_NOTICE("It has a thruster package installed."))
		if(has_guidance_package)
			to_chat(user, SPAN_NOTICE("It has a guidance package installed."))
		if(has_probe_package)
			to_chat(user, SPAN_NOTICE("It has a [probehead.probe_head_type_string] installed."))

/obj/structure/astrocartography_probe/attackby(obj/item/W, mob/user)
	. = ..()

	if(completed)
		to_chat(user, SPAN_WARNING("The [src]'s bolts have been firmly fixed in place; you can no longer modify it."))
		return

	if(istype(W, /obj/item/screwdriver))
		to_chat(user, SPAN_NOTICE("You [panel_open ? "close" : "open"] the service panel of [src]."))
		panel_open = !panel_open

	if(isWrench(W) && !panel_open)
		to_chat(user, SPAN_NOTICE("You begin to secure the bolts of the [src]. This cannot be reversed!"))
		if(check_completed())
			if(do_after(user, (6 SECOND), src))
				completed = TRUE
				to_chat(user, SPAN_NOTICE("You firmly fix the bolts of [src] in place, preventing any future modification."))
				on_completed()

	if(istype(W, /obj/item/stack/cable_coil) && panel_open && !is_wired)
		var/obj/item/stack/cable_coil/C = W
		if(!C.can_use(10))
			to_chat(user, SPAN_WARNING("You don't have enough cable to wire the [src]."))
			return FALSE
		if(do_after(user, (6 SECOND), src))
			if(C.use(10))
				to_chat(user, SPAN_NOTICE("You complete the wiring harness of [src]."))
				is_wired = TRUE

	if(panel_open)
		if(istype(W, /obj/item/astrocartography_equipment/astro_drone_engine))
			if(has_engine)
				to_chat(user, SPAN_WARNING("[src] already has a probe engine installed."))
				return FALSE
			if(do_after(user, (4 SECOND), src))
				to_chat(user, SPAN_NOTICE("You install [W] into [src]."))
				has_engine = TRUE
				user.unEquip(W)
				W.forceMove(src)

		if(istype(W, /obj/item/astrocartography_equipment/astro_drone_guidance))
			if(has_guidance_package)
				to_chat(user, SPAN_WARNING("[src] already has a guidance package installed."))
				return FALSE
			if(do_after(user, (4 SECOND), src))
				to_chat(user, SPAN_NOTICE("You install [W] into [src]."))
				has_guidance_package = TRUE
				user.unEquip(W)
				W.forceMove(src)

		if(istype(W, /obj/item/astrocartography_equipment/astro_probe_head))
			if(has_probe_package)
				to_chat(user, SPAN_WARNING("[src] already has a probe head installed."))
				return FALSE
			if(do_after(user, (4 SECOND), src))
				to_chat(user, SPAN_NOTICE("You install [W] into [src]."))
				has_probe_package = TRUE
				user.unEquip(W)
				W.forceMove(src)
				probehead = W

		if(istype(W, /obj/item/cell))
			if(has_power_cell)
				to_chat(user, SPAN_WARNING("[src] already has a power cell installed."))
				return FALSE
			if(do_after(user, (4 SECOND), src))
				to_chat(user, SPAN_NOTICE("You install [W] into [src]."))
				has_power_cell = TRUE
				user.unEquip(W)
				W.forceMove(src)

		if(isWirecutter(W))
			to_chat(user, SPAN_WARNING("You begin to remove the wiring from [src]."))
			if(do_after(user, (5 SECOND), src))
				to_chat(user, SPAN_WARNING("You remove the wiring from [src]."))
				is_wired = FALSE

		if(isCrowbar(W))
			var/obj/select = input("Probe Components", "Probe Components", null, null) as null|anything in contents
			if(QDELETED(user) || user.incapacitated() || !user.Adjacent(src) || !(W in user.get_held_items()))
				return FALSE
			if(do_after(user, (4 SECOND), src))
				switch(select.type)
					if(/obj/item/astrocartography_equipment/astro_drone_guidance)
						has_guidance_package = FALSE
					if(/obj/item/astrocartography_equipment/astro_probe_head)
						has_probe_package = FALSE
						probehead = null
					if(/obj/item/astrocartography_equipment/astro_drone_engine)
						has_engine = FALSE
					if(/obj/item/cell)
						has_power_cell = FALSE
				to_chat(user, SPAN_WARNING("You remove the [select] from [src]."))
				select.forceMove(get_turf(user))
	update_icon()
	return TRUE

/obj/structure/astrocartography_probe/proc/check_completed()
	if(has_engine && has_probe_package && has_guidance_package && has_power_cell)
		return TRUE
	return FALSE

/obj/structure/astrocartography_probe/proc/on_completed()
	name = "[probehead.probe_head_type_short] astrocartography probe"
	desc = "A completed astrocartography probe, sealed against the harsh enviroment of space and unable to be further modified."

/obj/item/astrocartography_equipment/
	icon = 'maps/torch/icons/astrocartography_drone_equipment.dmi'

/obj/item/astrocartography_equipment/astro_drone_engine
	name = "astrocartography drone engine"
	desc = "A set of cold-gas thrusters and manuvering gyros used to propel a probe to it's final point of study."
	icon_state = "dumbfire"

/obj/item/astrocartography_equipment/astro_drone_guidance
	name = "astrocartography drone guidance package"
	desc = "A complex, radiation-hardened computer module that guides a astrocartography probe to it's final point of study."
	icon_state = "guidance"

/obj/item/astrocartography_equipment/astro_probe_head
	name = "astrocartography probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments used to study various astronomical events. "
	icon = 'maps/torch/icons/astrocartography_drone_equipment.dmi'
	icon_state = "probe_head"
	var/overlay_color = COLOR_WHITE
	var/probe_head_type_string = "standard"
	var/probe_head_type_short = "standard"

/obj/item/astrocartography_equipment/astro_probe_head/Initialize()
	. = ..()
	var/image/I = image(icon, "probe_head_overlay")
	I.color = overlay_color
	add_overlay(I)

/obj/item/astrocartography_equipment/astro_probe_head/radiation
	name = "radiation-hardened probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. This one is specially hardened against radiation."
	overlay_color = COLOR_GREEN_GRAY
	probe_head_type_string = "radiation sensor package"
	probe_head_type_short = "radiation sensing"


/obj/item/astrocartography_equipment/astro_probe_head/armored
	name = "armored probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. This one is armored to withstand meteor impacts."
	overlay_color = COLOR_DARK_RED
	probe_head_type_string = "armored sensor package"
	probe_head_type_short = "impact data gathering"

/obj/item/astrocartography_equipment/astro_probe_head/advanced
	name = "advanced probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. This one boasts delicate, sensitive arrays for studying ion storms."
	overlay_color = COLOR_TEAL
	probe_head_type_string = "ion sensor package"
	probe_head_type_short = "exotic particle sensing"

/obj/item/astrocartography_equipment/astro_probe_head/gravitational
	name = "gravitational sensor probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. Most of this one's mass is taken up by a bulky, complex gravitational interferometer."
	overlay_color = COLOR_DARK_BLUE_GRAY
	probe_head_type_string = "gravitational sensor package"
	probe_head_type_short = "graviational measuring"

/obj/item/astrocartography_equipment/astro_probe_head/optical
	name = "optical probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. Most of this one's mass is taken up by optics and cameras."
	overlay_color = COLOR_PURPLE_GRAY
	probe_head_type_string = "optical sensor package"
	probe_head_type_short = "optical observation"

/obj/item/astrocartography_equipment/astro_probe_head/superluminal
	name = "quantum probe head"
	desc = "A complex and delicate package of astrogation and astrocartographic instruments. The entirety of this one is taken up by an incredibly sensitive quantum interferometer."
	overlay_color = COLOR_YELLOW_GRAY
	probe_head_type_string = "quantum distortion sensor package"
	probe_head_type_short = "quantum interferometer"