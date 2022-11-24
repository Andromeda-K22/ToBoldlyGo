/obj/item/clothing/under/solcom/Initialize()
	. = ..()
	LAZYREMOVE(sprite_sheets, BODYTYPE_UNATHI) // contained in the base icon

//
// PT Uniform
//

/obj/item/clothing/under/solcom/pt
	name = "pt uniform"
	desc = "A plain black set of shorts with a navy blue t-shirt. Utiliarian to the extreme. Fitted for both sexes."
	icon = 'maps/torch/icons/converted_icons/under/under_pt_iseo.dmi'

//
// Utility
//

/obj/item/clothing/under/solcom/utility
	name = "utility fatigues"
	desc = "A set of black fatigues made from sturdy, durable synthetic fibers used by the SOLCOM Surveyor Corps. Mildly flash and stain resistant."
	icon = 'maps/torch/icons/converted_icons/under/under_utility_iseo.dmi'
	siemens_coefficient = 0.8
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_ENERGY_MINOR
	)

/obj/item/clothing/under/solcom/utility/command
	desc = "A set of blue fatigues made from sturdy, durable synthetic fibers used by the SOLCOM Surveyor Corps. Mildly flash and stain resistant."
	icon = 'maps/torch/icons/converted_icons/under/under_utility_iseo_command.dmi'
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/command)

/obj/item/clothing/under/solcom/utility/security
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/security)

/obj/item/clothing/under/solcom/utility/engineering
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/engineering, /obj/item/clothing/accessory/armband/engine)

/obj/item/clothing/under/solcom/utility/supply
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/supply, /obj/item/clothing/accessory/armband/cargo)

/obj/item/clothing/under/solcom/utility/science
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/exploration)

/obj/item/clothing/under/solcom/utility/medical
	desc = "A set of white fatigues made from sturdy, durable synthetic fibers used by the SOLCOM Surveyor Corps. Very stain resistant - and sterile."
	icon = 'maps/torch/icons/converted_icons/under/under_utility_iseo_medical.dmi'
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/medical, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/solcom/utility/service
	starting_accessories = list(/obj/item/clothing/accessory/department/solcom/service)

//
// Service
//

/obj/item/clothing/under/solcom/service/uniform
	name = "service uniform"
	desc = "A fetching service uniform, with a white dress shirt and blue pants. For all semi-formal and formal occasions."
	icon = 'maps/torch/icons/converted_icons/under/under_service_uniform_iseo.dmi'

/obj/item/clothing/under/solcom/service/uniform/officer
	desc = "A fetching service uniform, with a white dress shirt and blue pants. For all semi-formal and formal occasions. This one has silver highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_uniform_officer_iseo.dmi'

/obj/item/clothing/under/solcom/service/uniform/command
	desc = "A fetching service uniform, with a white dress shirt and blue pants. For all semi-formal and formal occasions. This one has gold highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_uniform_command_iseo.dmi'

/obj/item/clothing/under/solcom/service/uniform/flag
	desc = "A fetching service uniform, with a white dress shirt and blue pants. For all semi-formal and formal occasions. This one has red highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_uniform_flag_iseo.dmi'

/obj/item/clothing/under/solcom/service/skirt
	name = "service skirt"
	desc = "A fetching service uniform, with a white dress shirt and a blue skirt. For all semi-formal and formal occasions."
	icon = 'maps/torch/icons/converted_icons/under/under_service_skirt_iseo.dmi'

/obj/item/clothing/under/solcom/service/skirt/officer
	desc = "A fetching service uniform, with a white dress shirt and a blue skirt. For all those semi-formal and formal occasions. This one has silver highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_skirt_officer_iseo.dmi'

/obj/item/clothing/under/solcom/service/skirt/command
	desc = "A fetching service uniform, with a white dress shirt and a blue skirt. For all those semi-formal and formal occasions. This one has gold highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_skirt_command_iseo.dmi'

/obj/item/clothing/under/solcom/service/skirt/flag
	desc = "A fetching service uniform, with a white dress shirt and a blue skirt. For all those semi-formal and formal occasions. This one has red highlights."
	icon = 'maps/torch/icons/converted_icons/under/under_service_skirt_flag_iseo.dmi'

//SOLCOM use service uniforms as the under for their dress clothing.




