#define LANGUAGE_HUMAN_EURO      "Zurich Accord Common"
#define LANGUAGE_HUMAN_ARABIC    "Prototype Standard Arabic"
#define LANGUAGE_HUMAN_INDIAN    "New Dehlavi"
#define LANGUAGE_HUMAN_IBERIAN   "Iberian"
#define LANGUAGE_HUMAN_RUSSIAN   "Pan-Slavic"
#define LANGUAGE_SPACER          "Spacer"

/decl/language/human/euro
	name = LANGUAGE_HUMAN_EURO
	desc = "A constructed language established by a conference of European and African research universities convening in Zurich, Switzerland starting in 2119, \
			later adopted with little controversy as the lingua franca of the entirety of Sol space following the establishment of SolCom."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = ""
	key = "1"
	shorthand = "ZAC"
	partial_understanding = list(
		LANGUAGE_HUMAN_ARABIC = 5,
		LANGUAGE_HUMAN_INDIAN = 5,
		LANGUAGE_HUMAN_IBERIAN = 30,
		LANGUAGE_HUMAN_RUSSIAN = 5,
		LANGUAGE_SPACER = 20
	)
	syllables = list(
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin",
		"ch", "de", "ge", "be", "ach", "abe", "ich", "ein", "die", "sch", "auf", "aus", "ber", "che", "ent", "que",
		"ait", "les", "lle", "men", "ais", "ans", "ait", "ave", "con", "com", "des", "tre", "eta", "eur", "est",
		"ing", "the", "ver", "was", "ith", "hin"
	)

/decl/language/human/indian
	name = LANGUAGE_HUMAN_INDIAN
	desc = "Billed as a reunification of the Hindustani languages of Hindi and Urdu in the Latin script, New Dehlavi enjoyed very rapid adoption rates among the common populace, \
			compared to the other great Earth commons."
	colour = "indian"
	key = "3"
	shorthand = "Dehv"
	space_chance = 30
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 5,
		LANGUAGE_HUMAN_ARABIC = 10,
		LANGUAGE_SPACER = 20
	)
	syllables = list(
		"ek", "aur", "ki", "ki", "ke", "de", "thaa", "ne", "me", "yaa", "se", "haa",
		"hai", "aar", "en", "ain", "y", "ke", "hai", "yaa", "en", "me", "aur", "se",
		"ki", "ne", "ek", "aar", "ain", "ki", "haa", "y", "thaa", "de", "usk", "use",
		"khaa", "kin", "kiy", "ky", "dei", "dekh", "nhi", "pne", "pr", "baar", "yon",
		"men", "iyaa", "main", "apn"
	)

/decl/language/human/russian
	name = LANGUAGE_HUMAN_RUSSIAN
	desc = "The official language of the Independent Colonial Confederation of Gilgamesh, originally established in 2122 by the short-lived United Slavic Confederation on Earth."
	colour = "russian"
	key = "r"
	shorthand = "Slav"
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 5,
		LANGUAGE_SPACER = 20
	)
	syllables = list(
		"rus", "zem", "ave", "groz", "ski", "ska", "ven", "konst", "pol", "lin", "svy",
		"danya", "da", "mied", "zan", "das", "krem", "myka", "to", "st", "no", "na", "ni",
		"ko", "ne", "en", "po", "ra", "li", "on", "byl", "cto", "eni", "ost", "ol", "ego",
		"ver", "stv", "pro"
	)

/decl/language/human/iberian
	name = LANGUAGE_HUMAN_IBERIAN
	desc = "One of the few great common Earth languages to come about naturally, this language developed in the late 21st century during\
			 a historic period of closeness between Spain, Portugal and their former colonies."
	colour = "iberian"
	key = "5"
	shorthand = "Iber"
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 30,
		LANGUAGE_SPACER = 20
	)
	syllables = list(
		"ad", "al", "an", "ar", "as", "ci", "co", "de", "do", "el", "en", "er", "es",
		"ie", "ue", "la", "ra", "os", "nt", "te", "ar", "qu", "el", "ta", "do", "co",
		"re", "as", "on", "aci", "ada", "ado", "ant", "ara", "cio", "com", "con", "des",
		"dos", "ent", "era", "ero", "que", "ent", "nte", "est", "ado", "par", "los", "ien",
		"sta", "una", "ion", "tra", "men", "ele", "nao", "uma", "ame", "dos", "uno", "mas",
		"ndo", "nha", "ver", "voc", "uma"
	)

/decl/language/human/arabic
	name = LANGUAGE_HUMAN_ARABIC
	desc = "'Prototype Standard Arabic', as it was known during its development as a world-wide replacement for the myriad regional dialects of Modern Standard, \
			 was mostly ignored on Earth until co-operative Pan-Arab space exploration made its use attractive. Its use as a liturgical language remains limited."
	colour = "arabic"
	key = "4"
	shorthand = "PSA"
	space_chance = 35
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 5,
		LANGUAGE_HUMAN_INDIAN = 10,
		LANGUAGE_SPACER = 20
	)
	syllables = list(
		"af", "if", "ba", "ta", "tha", "id", "jem", "ha", "kha", "dal", "dhl", "ra", "zay",
		"sen", "um", "shn", "sid", "ad", "ta", "za", "ayn", "gha", "zir", "yn", "fa", "qaf",
		"iam", "mim", "al", "ja", "non", "ha", "waw", "ya", "hem", "zah", "hml", "ks", "ini",
		"da", "ks", "iga", "ih", "la", "ulf", "xe", "ayw", "'", "-"
	)

/decl/language/spacer
	name = LANGUAGE_SPACER
	desc = "A rough, informal language used infrequently by humans as a last resort when attempts to establish dialogue in more proper languages fail and no autotranslators are available."
	key = "j"
	shorthand = "Spc"
	partial_understanding = list(
		LANGUAGE_HUMAN_EURO = 25,
		LANGUAGE_HUMAN_CHINESE = 25,
		LANGUAGE_HUMAN_ARABIC = 25,
		LANGUAGE_HUMAN_INDIAN = 25,
		LANGUAGE_HUMAN_IBERIAN = 25,
		LANGUAGE_HUMAN_RUSSIAN = 25,
		LANGUAGE_HUMAN_SELENIAN = 25,
		LANGUAGE_GUTTER = 35
	)
	syllables = list(
		"ada", "zir", "bian", "ach", "usk", "ado", "ich", "cuan", "iga", "qing", "le", "que", "ki", "qaf", "dei", "eta"
	)
	colour = "spacer"

