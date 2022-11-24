
/decl/loadout_option/head/solberet
	name = "SOLCOM beret selection"
	description = "A beret denoting service in an organization within the SOLCOM."
	path = /obj/item/clothing/head/beret/SOLCOM
	allowed_branches = SOLCOM_BRANCHES

/decl/loadout_option/head/solberet/Initialize()
	. = ..()
	var/berets = list()
	berets["peacekeeper beret"] = /obj/item/clothing/head/beret/solcom/peacekeeper
	berets["gateway administration beret"] = /obj/item/clothing/head/beret/solcom/gateway
	berets["government research beret"] = /obj/item/clothing/head/beret/solcom/research
	berets["health service beret"] = /obj/item/clothing/head/beret/solcom/health
	berets["diplomatic security beret"] = /obj/item/clothing/head/beret/solcom/diplomatic
	gear_tweaks += new/datum/gear_tweak/path(berets)

/decl/loadout_option/head/fleetcap
	name = "SOLCOM cap"
	path = /obj/item/clothing/head/solcom/utility
	cost = 0
	allowed_branches = list(/datum/mil_branch/exoann)

/decl/loadout_option/head/surgical
	allowed_roles = STERILE_ROLES

/decl/loadout_option/head/beret
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/bandana
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/beanie
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/bow
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/cap
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/hairflower
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/hardhat
	allowed_roles = TECHNICAL_ROLES

/decl/loadout_option/head/formalhat
	allowed_roles = FORMAL_ROLES
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/informalhat
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/welding
	allowed_roles = TECHNICAL_ROLES

/decl/loadout_option/tactical/balaclava
	allowed_roles = ARMORED_ROLES

/decl/loadout_option/head/corporateberet
	allowed_branches = CIVILIAN_BRANCHES

/decl/loadout_option/head/pilot_helmet
	name = "ISSC pilot helmet"
	description = "A customized pilot's helmet."
	path = /obj/item/clothing/head/helmet/pilot/alternate
	allowed_branches = SOLCOM_BRANCHES
	allowed_roles = list(/datum/job/nt_pilot)

/decl/loadout_option/head/pilot_helmet/Initialize()
	. = ..()
	var/helmets = list()
	helmets["mobius pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/mobius
	helmets["viper pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/viper
	helmets["red one pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/luke
	helmets["shark pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/shark
	helmets["corvid pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/corvid
	helmets["ace of spades pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/ace
	helmets["checker pattern"] = /obj/item/clothing/head/helmet/pilot/alternate/checker
	gear_tweaks += new/datum/gear_tweak/path(helmets)