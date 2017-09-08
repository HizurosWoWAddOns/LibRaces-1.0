--- LibRaces-1.0 provides several functions around playable races in world of warcraft
-- @class file
-- @name LibRaces-1.0

local MAJOR, MINOR = "LibRaces-1.0", 5
local LibRaces = LibStub:NewLibrary(MAJOR, MINOR)

if not LibRaces then return end

local languageCodes = {en="enUS",de="deDE",es="esES",mx="esES",fr="frFR",it="itIT",ko="koKR",pt="ptBR",br="ptBR",ru="ruRU",cn="zhCN",tw="zhTW"};
local altLangCode = {enUS="enGB",esES="esMX",ptBR="ptPT"};
local genderEngStr = {[0]="NEUTRAL",[1]="MALE",[2]="FEMALE"};

-- races[<localeLowerCasedStripped>] = <table of localized race names (ref. from data)>
local races = {};

-- toEnglish[<localeLowerCasedStripped>] = { <englishStripped>, <englishCaseSens> }
local toEnglish = {};

-- gender[<localeLowerCasedStripped>] = <number[0, 1, 2]> -- 0=neutral, 1=male, 2=female
local gender = {};

-- languages[<localeLowerCasedStripped>] = { "<langCode>", <langCode>=true }
local language = {};

-- data[<engLowerStripped>] = { <langCode> = { <langCode> = { <male>, <female> } } }
local data = {
	["human"] = {
		deDE = {"Mensch","Mensch"},
		enUS = {"Human","Human"},
		esES = {"Humano","Humana"},
		frFR = {"Humain","Humaine"},
		itIT = {"Umano","Umana"},
		koKR = {"인간","인간"},
		ptBR = {"Humano","Humana"},
		ruRU = {"Человек","Человек"},
		zhCN = {"人类","人类"},
		zhTW = {"人類","人類"}
	},
	["orc"] = {
		deDE = {"Orc","Orcs"},
		enUS = {"Orc","Orc"},
		esES = {"Orco","Orco"},
		frFR = {"Orc","Orque"},
		itIT = {"Orco","Orchessa"},
		koKR = {"오크","오크"},
		ptBR = {"Orc","Orquisa"},
		ruRU = {"Орк","Орк"},
		zhCN = {"兽人","兽人"},
		zhTW = {"獸人","獸人"}
	},
	["dwarf"] = {
		deDE = {"Zwerg","Zwergin"},
		enUS = {"Dwarf","Dwarf"},
		esES = {"Enano","Enana"},
		frFR = {"Nain","Naine"},
		itIT = {"Nano","Nana"},
		koKR = {"드워프","드워프"},
		ptBR = {"Anão","Anã"},
		ruRU = {"Дворф","Дворф"},
		zhCN = {"矮人","矮人"},
		zhTW = {"矮人","矮人"}
	},
	["nightelf"] = {
		deDE = {"Nachtelf","Nachtelfe"},
		enUS = {"Night Elf","Night Elf"},
		esES = {"Elfo de la noche","Elfa de la noche"},
		frFR = {"Elfe de la nuit","Elfe de la nuit"},
		itIT = {"Elfo della Notte","Elfa della Notte"},
		koKR = {"나이트 엘프","나이트 엘프"},
		ptBR = {"Elfo Noturno","Elfa Noturna"},
		ruRU = {"Ночной эльф","Ночная эльфийка"},
		zhCN = {"暗夜精灵","暗夜精灵"},
		zhTW = {"夜精靈","夜精靈"}
	},
	["scourge"] = {
		deDE = {"Untoter","Untote"},
		enUS = {"Undead","Undead"},
		esES = {"No-muerto","No-muerta"},
		frFR = {"Mort-vivant","Morte-vivante"},
		itIT = {"Non Morto","Non Morta"},
		koKR = {"언데드","언데드"},
		ptBR = {"Morto-vivo","Morta-viva"},
		ruRU = {"Нежить","Нежить"},
		zhCN = {"亡灵","亡灵"},
		zhTW = {"不死族","不死族"}
	},
	["tauren"] = {
		deDE = {"Tauren","Tauren"},
		enUS = {"Tauren","Tauren"},
		esES = {"Tauren","Tauren"},
		frFR = {"Tauren","Taurène"},
		itIT = {"Tauren","Tauren"},
		koKR = {"타우렌","타우렌"},
		ptBR = {"Tauren","Taurena"},
		ruRU = {"Таурен","Таурен"},
		zhCN = {"牛头人","牛头人"},
		zhTW = {"牛頭人","牛頭人"}
	},
	["gnome"] = {
		deDE = {"Gnom","Gnom"},
		enUS = {"Gnome","Gnome"},
		esES = {"Gnomo","Gnoma"},
		frFR = {"Gnome","Gnome"},
		itIT = {"Gnomo","Gnoma"},
		koKR = {"노움","노움"},
		ptBR = {"Gnomo","Gnomida"},
		ruRU = {"Гном","Гном"},
		zhCN = {"侏儒","侏儒"},
		zhTW = {"地精","地精"}
	},
	["troll"] = {
		deDE = {"Troll","Trolle"},
		enUS = {"Troll","Troll"},
		esES = {"Trol","Trol"},
		frFR = {"Troll","Trollesse"},
		itIT = {"Troll","Troll"},
		koKR = {"트롤","트롤"},
		ptBR = {"Troll","Trolesa"},
		ruRU = {"Тролль","Тролль"},
		zhCN = {"巨魔","巨魔"},
		zhTW = {"食人妖","食人妖"}
	},
	["goblin"] = {
		deDE = {"Goblin","Goblin"},
		enUS = {"Goblin","Goblin"},
		esES = {"Goblin","Goblin"},
		frFR = {"Gobelin","Gobeline"},
		itIT = {"Goblin","Goblin"},
		koKR = {"고블린","고블린"},
		ptBR = {"Goblin","Goblina"},
		ruRU = {"Гоблин","Гоблин"},
		zhCN = {"地精","地精"},
		zhTW = {"哥布林","哥布林"}
	},
	["bloodelf"] = {
		deDE = {"Blutelf","Blutelfe"},
		enUS = {"Blood Elf","Blood Elf"},
		esES = {"Elfo de sangre","Elfa de sangre"},
		frFR = {"Elfe de sang","Elfe de sang"},
		itIT = {"Elfo del Sangue","Elfa del Sangue"},
		koKR = {"블러드 엘프","블러드 엘프"},
		ptBR = {"Elfo Sangrento","Elfa Sangrenta"},
		ruRU = {"Эльф крови","Эльфийка крови"},
		zhCN = {"血精灵","血精灵"},
		zhTW = {"血精靈","血精靈"}
	},
	["draenei"] = {
		deDE = {"Draenei","Draenei"},
		enUS = {"Draenei","Draenei"},
		esES = {"Draenei","Draenei"},
		frFR = {"Draeneï","Draeneï"},
		itIT = {"Draenei","Draenei"},
		koKR = {"드레나이","드레나이"},
		ptBR = {"Draenei","Draenaia"},
		ruRU = {"Дреней","Дренейка"},
		zhCN = {"德莱尼","德莱尼"},
		zhTW = {"德萊尼","德萊尼"}
	},
	["worgen"] = {
		deDE = {"Worgen","Worgen"},
		enUS = {"Worgen","Worgen"},
		esES = {"Huargen","Huargen"},
		frFR = {"Worgen","Worgen"},
		itIT = {"Worgen","Worgen"},
		koKR = {"늑대인간","늑대인간"},
		ptBR = {"Worgen","Worgenin"},
		ruRU = {"Ворген","Ворген"},
		zhCN = {"狼人","狼人"},
		zhTW = {"狼人","狼人"}
	},
	["pandaren"] = {
		deDE = {"Pandaren","Pandaren"},
		enUS = {"Pandaren","Pandaren"},
		esES = {"Pandaren","Pandaren"},
		frFR = {"Pandaren","Pandarène"},
		itIT = {"Pandaren","Pandaren"},
		koKR = {"판다렌","판다렌"},
		ptBR = {"Pandaren","Pandarena"},
		ruRU = {"Пандарен","Пандарен"},
		zhCN = {"熊猫人","熊猫人"},
		zhTW = {"熊貓人","熊貓人"}
	}
};

local function GetLanguageCode(lang)
	if type(lang)=="string" then
		local _lang=strsub(lang,0,2):lower();
		print("1",_lang);
		if _lang=="zh" then _lang=strsub(lang,3,4):lower(); end
		print("2",_lang)
		if languageCodes[_lang] then
			return languageCodes[_lang];
		end
	end
	return GetLocale(); -- fallback to client language
end

local function strip(str,normalize)
	assert(type(str)=="string");
	return (normalize==true and str:lower() or str):gsub(" ",""):gsub("-","");
end

local function Unpack(step,...)
	if step==3 then -- step3
		local name, engLower, engCaseSens, lang = ...;

		-- fill toEnglish table
		toEnglish[name] = {strip(engCaseSens),engCaseSens};

		-- fill races table
		races[name] = data[engLower];

		-- file language table
		if language[name]==nil then
			language[name] = {};
		end
		if not language[name][lang] then
			tinsert(language[name],lang);
			language[name][lang] = true;
		end

		-- second run of step3 for alternative language code if exists
		--if altLangCode[lang] then
		--	Unpack(3,name, engLower, engCaseSens, altLangCode[lang]);
		--end
	elseif step==2 then -- step2
		local engLower,engCaseSens,lang,localized = ...;

		-- lowercase and stripped like realm names on character names
		local localeFemaleStripped = strip(localized[2],true);
		local localeMaleStripped   = strip(localized[1],true);

		-- is locale name gender neutral
		local isNeutral = localeMaleStripped==localeFemaleStripped;

		-- fill gender table
		if isNeutral then
			gender[localeMaleStripped] = 0;
		else
			gender[localeFemaleStripped] = 2;
			gender[localeMaleStripped] = 1;
		end

		Unpack(3,localeFemaleStripped, engLower, engCaseSens, lang);
		if not isNeutral then
			Unpack(3,localeMaleStripped, engLower, engCaseSens, lang);
		end
	else -- step1
		for engLower, localizations in pairs(data) do
			local engCaseSens = localizations.enUS[1];
			-- english first
			Unpack(2,engLower,engCaseSens,"enUS",localizations.enUS); -- exec Unpack step2
			for lang, localized in pairs(localizations)do
				if lang~="enUS" then
					-- number, string, string, string, string
					Unpack(2,engLower,engCaseSens,lang,localized); -- exec Unpack step2
				end
			end
		end
		Unpack = nil;
	end
end

--- Returns english race token and name from any client supported language
-- @param name Race name (all client supported languages)
-- @return English tokenized race name (without dashes and whitespaces)
-- @return English race name
function LibRaces:GetRaceToken(name)
	if self~=lib then name=self; end
	if Unpack then Unpack(); end
	local name = strip(name,true);
	if toEnglish[name] then
		return unpack(toEnglish[name]);
	end
end

--- Returns name of race by selected language and gender or both gender names of race by choosen language
-- @paramsig name[, language[, gender]]
-- @param name Name of playable race (all client supported languages)
-- @param language The language code like enUS, ptBR or shorter like de, tw or cn (optional)
-- @param gender Choose gender 1=male, 2=female (optional)
-- @return Male and female name of race or name of race by selected gender
function LibRaces:GetRaceName(raceName, lang, gender)
	if self~=lib then raceName,lang,gender=self,raceName,lang; end
	assert(type(raceName)=="string","<LibRaces-1.0>:GetRaceName(<raceName(string)>[,<languageCode(string)>[,<gender(number 1=male|2=female)>]])");
	lang = GetLanguageCode(lang);
	if Unpack then Unpack(); end
	local race = races[strip(raceName,true)];
		if race and race[lang] then
		if gender==1 or gender==2 then
			return race[lang][gender];
		end
		return unpack(race[lang]); -- return male, female
	end
	-- nil on fail
end

function LibRaces:GetLanguageByRaceName(name)
	if self~=lib then name = self; end
	assert(type(name)=="string");
	if Unpack then Unpack(); end
	local lang = {};
	for _,v in ipairs(language[strip(name,true)] or {})do
		tinsert(lang, v);
		if altLangCode[v] then
			tinsert(lang, altLangCode[v]);
		end
	end
	if #lang>0 then
		table.sort(lang);
		return unpack(lang);
	end
end

function LibRaces:GetGenderByRaceName(name)
	if self~=lib then name = self; end
	assert(type(name)=="string");
	if Unpack then Unpack(); end
	local g = gender[strip(name,true)];
	if g then
		return g, genderEngStr[g]; -- 0=neutral, 1=male, 2=female
	end
end

function LibRaces:GetAllNamesByLanguage(lang)
	if self~=lib then lang = self; end
	local result,tmp,lang,a,b = {},{};
	print("lang",tostring(lang))
	lang = GetLanguageCode(lang);
	print("lang",tostring(lang))
	for _,tbl in pairs(data)do
		if tbl[lang] then
			a,b = tbl[lang][1],tbl[lang][2];
			if strlen(b)>strlen(a) then
				a,b = b,a;
			end
			if not tmp[a] then
				tinsert(result,a);
				tmp[a] = true;
			end
			if not tmp[b] then
				tinsert(result,b);
				tmp[b] = true;
			end
		end
	end
	return result,lang;
end

function LibRaces:FindRaceNameInText(text)
	if self~=lib then text = self; end
	assert(type(text)=="string","Usage: <LibRaces-1.0>:FindRaceNameInText(<text>) - string expected, got "..type(text));
	local names,res = LibRaces:GetAllNamesByLanguage();
	-- damned limitation of lua pattern...
	for i=1, #names do
		res = text:match(names[i]:gsub(" ","[ ]*"):gsub("%-","[%-]*"));
		if res then
			return res, LibRaces:GetRaceToken(res);
		end
	end
end
