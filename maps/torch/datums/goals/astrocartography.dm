/datum/goal/department/exploration/study_stellar_event
	var/obj/effect/overmap/stellar_event_type
	var/number_to_study

/datum/goal/department/exploration/study_stellar_event_for_time
	var/obj/effect/overmap/stellar_event_type
	var/time_to_study

/datum/goal/department/exploration/probe_launch
	var/probes_to_launch = 1
	var/probes_launched = 0
	var/probe_type
	var/list/probe_types = list("radiation sensor package", "armored sensor package", "ion sensor package", "gravitational sensor package", "optical sensor package", "quantum distortion sensor package")

/datum/goal/department/exploration/probe_launch/proc/get_assignment_string()
	return

/datum/goal/department/exploration/probe_launch/check_success()
	if(probes_launched == probes_to_launch)
		return TRUE
	return FALSE

/datum/goal/department/exploration/probe_launch/proc/register_probe_launch(var/turf/T, var/obj/structure/astrocartography_probe/probe, var/obj/effect/overmap/visitable/ship/sector)
	return

// Probes in stellar event

/datum/goal/department/exploration/probe_launch/launch_probes_in_stellar_event
	description = "Launch a number of probes in certain stellar phenomena."
	var/stellar_event_type
	var/list/event_types_to_name = list(
		/obj/effect/overmap/event/meteor = "asteriod fields",
		/obj/effect/overmap/event/electric = "plasma streams",
		/obj/effect/overmap/event/dust = "dust clouds",
		/obj/effect/overmap/event/ion = "charged particle storms",
		/obj/effect/overmap/event/carp = "xenofauna swarms",
		)

/datum/goal/department/exploration/probe_launch/launch_probes_in_stellar_event/get_assignment_string()
	return "<li>\A Launch [num2text(probes_to_launch)] probes with a [probe_type] in [event_types_to_name[stellar_event_type]]</li>"

/datum/goal/department/exploration/probe_launch/launch_probes_in_stellar_event/New()
	. = ..()
	probe_type = pick(probe_types)
	probes_to_launch = rand(1,6)
	stellar_event_type = pick(subtypesof(/obj/effect/overmap/event))

/datum/goal/department/exploration/probe_launch/launch_probes_in_stellar_event/register_probe_launch(var/turf/T, var/obj/structure/astrocartography_probe/probe, var/obj/effect/overmap/visitable/ship/sector)
	for(var/obj/effect/overmap/event/E in T.contents)
		if(E.type == stellar_event_type && probe.probehead.probe_head_type_string == probe_type)
			++probes_launched
			announcer.autosay("Stellar phenomena telemetry stream recorded. Probe launch successful. [num2text(probes_to_launch)] probes left.", "Probe Telemetry Computer")
			check_success()

/datum/goal/department/exploration/probe_launch/launch_probes_in_stellar_event/on_completion()
	. = ..()
	minor_announcement.Announce(message = "Stellar phenomena streams recorded. All probes launched. Transmitting datapacket...", new_title = "Probe Telemetry Recorder")


// probes at location

/datum/goal/department/exploration/probe_launch/launch_probes_at_locations
	description = "Launch a number of probes at certain locations."
	var/list/locations_to_launch_at = list()
	var/list/locations_launched_at = list()

/datum/goal/department/exploration/probe_launch/launch_probes_at_locations/get_assignment_string()
	var/text = "<br><li>\A Launch [num2text(probes_to_launch)] probes with a [probe_type] at specific points:</li></br>"
	for(var/turf/T in locations_to_launch_at)
		var/TX = T.x
		var/TY = T.y
		text += "<br><li>Point [pick(global.phonetic_alphabet)] -  X: [TX] Y:[TY]</li></br>"
	return text

/datum/goal/department/exploration/probe_launch/launch_probes_at_locations/New()
	. = ..()
	probe_type = pick(probe_types)
	probes_to_launch = rand(1,6)
	var/datum/overmap/overmap = global.overmaps_by_name[OVERMAP_ID_SPACE]
	for(var/i=1, i<=probes_to_launch;i++)
		var/randX = rand(1, overmap.map_size_x)
		var/randY = rand(1, overmap.map_size_y)
		var/turf/T = locate(randX, randY, overmap.assigned_z)
		locations_to_launch_at += T

/datum/goal/department/exploration/probe_launch/launch_probes_at_locations/register_probe_launch(var/turf/T, var/obj/structure/astrocartography_probe/probe, var/obj/effect/overmap/visitable/ship/sector)
	if(T in locations_to_launch_at && probe.probehead.probe_head_type_string == probe_type)
		probes_launched++
		announcer.autosay("Positional telemetry stream recorded. Probe launch successful. [num2text(probes_to_launch)] probes left.", "Probe Telemetry Computer")
		check_success()

/datum/goal/department/exploration/probe_launch/launch_probes_at_locations/on_completion()
	. = ..()
	minor_announcement.Announce(message = "Positional telemetry streams recorded. All probes launched. Transmitting datapacket...", new_title = "Probe Telemetry Recorder")
// probes in jump

/datum/goal/department/exploration/probe_launch/launch_probe_during_jump
	description = "Launch a certain kind of probe in a FTL Jump."

/datum/goal/department/exploration/probe_launch/launch_probe_during_jump/New()
	. = ..()
	probe_type = pick(probe_types)
	probes_to_launch = rand(1,6)
	probes_to_launch = 1 //limit this to one for now.

/datum/goal/department/exploration/probe_launch/launch_probe_during_jump/register_probe_launch(var/turf/T, var/obj/structure/astrocartography_probe/probe, var/obj/effect/overmap/visitable/ship/sector)
	for(var/datum/event/ftl/F in SSevent.active_events) //iterating over world icky icky nasty nasty find a better way to do this.
		if(F.affecting_z == sector.map_z && probe.probehead.probe_head_type_string == probe_type)
			probes_launched++
			check_success()
			break

/datum/goal/department/exploration/probe_launch/launch_probe_during_jump/on_completion()
	. = ..()
	minor_announcement.Announce(message = "Superluminal data stream recorded. Transmitting datapacket...", new_title = "Probe Telemetry Recorder")

/datum/goal/department/exploration/probe_launch/launch_probe_during_jump/get_assignment_string()
	return "<li>\A Launch a probe with a [probe_type] during a superluminal jump.</li>"



