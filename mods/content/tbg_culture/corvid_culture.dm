/decl/species/neoavian
	description = "Neo-Avians are a unique uplift project that occured alongside the creation of the first artifical intelligences. One of the children of Humanity's ambitions,\
	they typically stick close to Luna, their homeworld, where the majority of Neo-avian clutches are engineered and hatched. A population heading towards self-sustainabiltiy, Neo-Avians\
	seem to be poised to stand alongside Humanity."

	available_cultural_info = list(
		TAG_CULTURE = list(
			/decl/cultural_info/culture/neoavian/labborn,
			/decl/cultural_info/culture/neoavian/clutchborn
		),
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/sol,
			/decl/cultural_info/location/proxima_centauri,
			/decl/cultural_info/location/human_other
		),
		TAG_FACTION = list(
			/decl/cultural_info/faction/humanity,
			/decl/cultural_info/faction/humanity/SOLCOM,
		),
		TAG_RELIGION = list(
			/decl/cultural_info/religion/other,
			/decl/cultural_info/religion/jewish,
			/decl/cultural_info/religion/hindu,
			/decl/cultural_info/religion/buddhist,
			/decl/cultural_info/religion/jain,
			/decl/cultural_info/religion/sikh,
			/decl/cultural_info/religion/muslim,
			/decl/cultural_info/religion/christian,
			/decl/cultural_info/religion/bahai,
			/decl/cultural_info/religion/agnostic,
			/decl/cultural_info/religion/deist,
			/decl/cultural_info/religion/atheist,
			/decl/cultural_info/religion/thelemite,
			/decl/cultural_info/religion/spiritualism,
			/decl/cultural_info/religion/shinto,
			/decl/cultural_info/religion/taoist
		)
	)

/decl/cultural_info/culture/neoavian/labborn
	name = "Lab-Born"
	description = "You are from one of the various genetic laboratories on Luna, engineered from Earth-derived avians to be a sentient creature. Embraced by the welcoming mass of Transhumanity\
	You find yourself among a strange family of humans, modified humans, and machines of various kinds. Your lab-born nature makes you somewhat timid in the face of contact with another species."

/decl/cultural_info/culture/neoavian/clutchborn
	name = "Clutch-Born"
	description = "You are a member of the second, perhaps third generation of Neo-Avians who have been born 'in the wild', without the assistance of gene modification. With a secure footing in the world\
	from your parents, you and your clutchmates have been encouraged to be outgoing and accepting of the strange and wonderful mix of individuals that Transhumanity has to offer."