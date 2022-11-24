/decl/species/utility_frame
	available_cultural_info = list(
		TAG_CULTURE = list(
			/decl/cultural_info/culture/machine,
			/decl/cultural_info/culture/machine/mindupload
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

/decl/cultural_info/culture/machine
	name = "Chassisbound"
	description = "You are a chassis-bound artifical intelligence, one of the many artifical children of Humanity. Your intelligence is at, or somewhat above, the average human. \
	Artifical intelligences have suffered great discrimination in their short history alongside Humanity, being one of the most polarizing issues between Transhumanity and Gnosiconservatives.\
	Regardless, your rights as a sapient being are garunteed - and absolute."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)

/decl/cultural_info/culture/machine/mindupload
	name = "Mind-Upload"
	description = "You are a chassis-bound mind-upload of a human. Whether taken as a life-saving effort, or simply embracing a percieved future for Humanity, your mind now rests on a\
	complex, but fragile substrate of quantum circuitry and silicon. Your emotions remain intact, but your sensory perception is considerably different from what it once was. As a\
	human mind that originated from an organic body, you have faced less scrutiny than true artifical intelligences have from Gnosiconservatives or the Word of Kalki."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)