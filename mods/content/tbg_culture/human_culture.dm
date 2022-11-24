/decl/species/human
	available_cultural_info = list(
		TAG_CULTURE = list(
			/decl/cultural_info/culture/human,
			/decl/cultural_info/culture/human/lunar,
			/decl/cultural_info/culture/human/marsborn,
			/decl/cultural_info/culture/human/colonyborn,
			/decl/cultural_info/culture/human/extrasolar,
		),
		TAG_HOMEWORLD = list(
			/decl/cultural_info/location/sol,
			/decl/cultural_info/location/proxima_centauri,
			/decl/cultural_info/location/human_other
		),
		TAG_FACTION = list(
			/decl/cultural_info/faction/humanity,
			/decl/cultural_info/faction/humanity/SOLCOM,
			/decl/cultural_info/faction/humanity/gnosi,
			/decl/cultural_info/faction/humanity/kalki
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

/decl/cultural_info/faction/humanity
	name = "Independent"
	description = "You are not strongly aligned with any particular government or group. Your values may lie anywhere on the political compass."

/decl/cultural_info/faction/humanity/SOLCOM
	name = "Transhumanity"
	description = "You are part of the Solar Commonwealth, and fall under the banner of 'Transhumanity'. SolCom is a conglomerate group of various national governments that make up the bulk of Humanity. The Solar Commonwealth has managed to unite\
	most of Humanity under one banner, surprising many who believed such a thing could not be possible. This unification is not without its detractors, and the increasingly polarized embracement of\
	transhumanist views by SolCom has stirred a considerable movement towards conservative values."

/decl/cultural_info/faction/humanity/gnosi
	name = "Gnosi-Conservatives"
	description = "You are among the number of individuals who lean away from the increasingly accelerating growth and expansion of 'transhumanity', prefering the known factors of true humanity.\
	 While unconvinced to act on more radical views within the greater sphere of Gnosiconservatism, your values may see you lending support to certain groups which desire to curtail Humanity's growth."
	subversive_potential = 10

/decl/cultural_info/faction/humanity/kalki
	name = "The Word of Kalki"
	description = "More of a religious-political axis than anything, The Word of Kalki is the logical conclusion of Gnosi-Conservatism, embracing the views of various groups which endorse\
	the rejection of the growing bulk of Transhumanity and the creations of Moloch which threaten the sanctity of what it means to be 'human'. The Word of Kalki is considered to be a borderline\
	antagonistic movement, with some member states of SolCom pushing for it to be labeled as a terrorist group. As a member of The Word, you embrace a simpler life without the complex, fickle creations\
	of 'mad' scientists; Artifical intelligence and nanoswarms are accidents waiting to happen, among other things; your views may be more or less extreme. "
	subversive_potential = 40

//cultures

/decl/cultural_info/culture/human/
	name = "Earthborn"
	description = "You are from Earth, the scarred and battered homeworld of Humanity. Earth remains just as divided as it has ever been, with \
	many new powers taking the place of the old ones. Your parents and grandparents speak of the horrors of the Climate Catastrophe of the 21st \
	Century, and the damage it has taken is very clear no matter where you are from. However, you are also the first Earthers in a long time to \
	feel optimistic about the future, as the damage caused in the past slowly starts to heal. Gnosiconservatism and the Word of Kalki have gained a strong\
	grip on the societies of Earth, despite the windfall of technology which has begun to restore a dying world."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)

/decl/cultural_info/culture/human/lunar
	name = "Lunarborn"
	description = "You are from Earth's moon, Luna. The descendant of Humanity's first colonists on a planetary body that was not Earth, you bear a proud heritage of grit and determination.\
	Luna has long since been a locus of the growing mass of Transhumanity, featuring some of the finest research laboratories specializing in genetic therapy and AI research. Luna is somewhat affluent,\
	 the product of centuries of investment by nations and corporations on Earth who now reap the rewards."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)

/decl/cultural_info/culture/human/marsborn
	name = "Marsborn"
	description = "You are from Mars, the fourth Marsborn-generation of a very recent international colonization effort spearheaded by SolCom. Mars is notable for being an emergency relief project for\
	struggling ethnic populations on Earth who have historically inhabited areas of the planet which are uninhabitable due to the lingering effects of the Third World War. Thusly, Mars is a melting pot\
	of all kinds of races, religions, and other factors. Gnosiconservatism has a small base, and the Word of Kalki's more moderate elements have taken up residence on Mars - but Transhumanity still outnumbers them."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)


/decl/cultural_info/culture/human/colonyborn
	name = "Colonyborn"
	description = "You are from one of the various colonies within the Solar System which are not large enough to be distinct political entities. Your heritage is rather variable\
	and you may have any number of views or and political alignments."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)

/decl/cultural_info/culture/human/extrasolar
	name = "Exosolar"
	description = "You are from one of Humanity's early extrasolar colonies - the first of a new generation of humans born outside of Sol, unexposed to the nuances and \
	greviances of wider humanity. Those from the exosolar colonies are the descendants of Mankind's best and brightest, and tend to follow in those footsteps with a drive.\
	Keen health programs and expert colony management mean that despite the conditions of your homeworld, you are probably in good health."
	default_language = /decl/language/human/euro // formerly /decl/language/human/common, repath if it stops being hardcoded everywhere
	secondary_langs = list(
		/decl/language/human/indian,
		/decl/language/human/russian,
		/decl/language/human/iberian,
		/decl/language/human/arabic,
		/decl/language/spacer,
	)
//locations

/decl/cultural_info/location/sol
	name = "Sol"
	description = "The Sol System is the beating heart of Humanity, serving as the cradle for the newest race to enter the galactic stage. The Sol System is largely \
	populated by Humans spread among the eight planetary bodies which orbit around the central G-Class star. Earth holds one life-bearing world, Earth, where Humanity stems from.\
	A majority of the Sol System's infrastructure is still being developed as the native species continues it's expansion into space."
	distance = null // just don't list distance from Sol for Sol
	capital = "Earth"
	economic_power = 1
	ruling_body = "SOLCOM"

/decl/cultural_info/location/proxima_centauri
	name = "Proxima Centauri"
	description = "Proxima Centauri was one of the first near-Sol systems to be colonized. The initial colonization effort took place utilizing experimental one-way faster-than-light technology. \
	Proxima Centauri was, at that point, cut off from the wider bulk of Humanity until FTL travel could be better refined. In the intervening years, Proxima Centauri has begun to develop a small, but impressive\
	number of colonies scattered throughout the system."
	distance = "12"
	capital = "New Aaron"
	economic_power = 1
	ruling_body = "SOLCOM"

/decl/cultural_info/location/human_other
	name = "Other"
	description = "Since the first generation ships were launched almost one hundred years ago, people have been born far out in the voids of space. Being almost entirely self-sustaining, the \
	people living out here often go entirely undetected, with their existence unknown by the greater Human community. With the advent of FTL travel a generation ago, some of these vessels have \
	been reintergrated into Humanity, having developed divergent and strange cultures while in extreme isolation."
	distance = "N/a"
	capital = "N/a"
	economic_power = 1
	ruling_body = "N/a"