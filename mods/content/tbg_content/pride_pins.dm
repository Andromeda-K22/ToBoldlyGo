/obj/item/clothing/accessory/pride_pin
	name = "base pride pin"
	item_state = "pridepins"
	slot = ACCESSORY_SLOT_INSIGNIA
	icon = 'mods/content/tbg_content/icons/pridepins.dmi'


/obj/item/clothing/accessory/pride_pin/transgender
	name = "transgender pride pin"
	desc = "A pin celebrating transgender pride."
	icon_state = "transgenderpin"


/obj/item/clothing/accessory/pride_pin/lesbian
	name = "lesbian pride pin"
	desc = "A pin celebrating lesbian pride."
	icon_state = "lesbianpin"


/obj/item/clothing/accessory/pride_pin/bisexual
	name = "bisexual pride pin"
	desc = "A pin celebrating bisexual pride."
	icon_state = "bisexualpin"


/obj/item/clothing/accessory/pride_pin/gay
	name = "gay pride pin"
	desc = "A pin celebrating gay pride."
	icon_state = "gaypin"


/obj/item/clothing/accessory/pride_pin/pansexual
	name = "pansexual pride pin"
	desc = "A pin celebrating pansexual pride."
	icon_state = "pansexualpin"


/obj/item/clothing/accessory/pride_pin/nonbinary
	name = "nonbinary pride pin"
	desc = "A pin celebrating nonbinary pride."
	icon_state = "nonbinarypin"


/obj/item/clothing/accessory/pride_pin/asexual
	name = "asexual pride pin"
	desc = "A pin celebrating asexual pride."
	icon_state = "asexualpin"

/obj/item/clothing/accessory/pride_pin/aromantic
	name = "aromantic pride pin"
	desc = "A pin celebrating aromantic pride."
	icon_state = "aromanticpin"

/obj/item/clothing/accessory/pride_pin/intersex
	name = "intersex pride pin"
	desc = "A pin celebrating intersex pride."
	icon_state = "intersexpin"

/obj/item/clothing/accessory/pronouns
	name = "base pronouns badge"
	icon_state = "pronounpin"
	icon = 'mods/content/tbg_content/icons/pridepins.dmi'
	slot = ACCESSORY_SLOT_INSIGNIA

/obj/item/clothing/accessory/pronouns/they
	name = "they/them pronouns badge"
	desc = "A badge showing the wearer's pronouns: they, them and theirs."

/obj/item/clothing/accessory/pronouns/hehim
	name = "he/him pronouns badge"
	desc = "A badge showing the wearer's pronouns: he, him and his."

/obj/item/clothing/accessory/pronouns/sheher
	name = "she/her pronouns badge"
	desc = "A badge showing the wearer's pronouns: she, her and hers."

/obj/item/clothing/accessory/pronouns/hethey
	name = "he/they pronouns badge"
	desc = "A badge showing the wearer's pronouns: he, him and his or they, them and theirs."

/obj/item/clothing/accessory/pronouns/shethey
	name = "she/they pronouns badge"
	desc = "A badge showing the wearer's pronouns: she, her and hers or they, them and theirs."

/obj/item/clothing/accessory/pronouns/heshe
	name = "he/she pronouns badge"
	desc = "A badge showing the wearer's pronouns: he, him and his or she, her and hers."

/obj/item/clothing/accessory/pronouns/zehir
	name = "ze/hir pronouns badge"
	desc = "A badge showing the wearer's pronouns: ze, hir and hirs."

/obj/item/clothing/accessory/pronouns/ask
	name = "ask my pronouns badge"
	desc = "A badge asking others to ask for the wearer's pronouns."

/decl/loadout_option/accessory/pronouns
	name = "pronoun badge selection"
	description = "A selection of badges used to indicate the preferred pronouns of the wearer."
	path = /obj/item/clothing/accessory/pronouns


/decl/loadout_option/accessory/pronouns/New()
	..()
	var/list/options = list()
	options["they/them badge"] = /obj/item/clothing/accessory/pronouns/they
	options["he/him badge"] = /obj/item/clothing/accessory/pronouns/hehim
	options["she/her badge"] = /obj/item/clothing/accessory/pronouns/sheher
	options["he/they badge"] = /obj/item/clothing/accessory/pronouns/hethey
	options["she/they badge"] = /obj/item/clothing/accessory/pronouns/shethey
	options["he/she badge"] = /obj/item/clothing/accessory/pronouns/heshe
	options["ze/hir badge"] = /obj/item/clothing/accessory/pronouns/zehir
	options["ask me badge"] = /obj/item/clothing/accessory/pronouns/ask
	gear_tweaks += new /datum/gear_tweak/path (options)

/decl/loadout_option/accessory/pride_pins
	name = "pride pin selection"
	description = "A selection of pins used to signal membership or support of an identity or sexuality."
	path = /obj/item/clothing/accessory/pride_pin


/decl/loadout_option/accessory/pride_pins/New()
	..()
	var/list/options = list()
	options["transgender pride pin"] = /obj/item/clothing/accessory/pride_pin/transgender
	options["lesbian pride pin"] = /obj/item/clothing/accessory/pride_pin/lesbian
	options["bisexual pride pin"] = /obj/item/clothing/accessory/pride_pin/bisexual
	options["gay pride pin"] = /obj/item/clothing/accessory/pride_pin/gay
	options["pansexual pride pin"] = /obj/item/clothing/accessory/pride_pin/pansexual
	options["nonbinary pride pin"] = /obj/item/clothing/accessory/pride_pin/nonbinary
	options["asexual pride pin"] = /obj/item/clothing/accessory/pride_pin/asexual
	options["intersex pride pin"] = /obj/item/clothing/accessory/pride_pin/intersex
	options["aromantic pride pin"] = /obj/item/clothing/accessory/pride_pin/aromantic
	gear_tweaks += new /datum/gear_tweak/path (options)