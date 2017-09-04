
local MAJOR, MINOR = "LibRaces-1.0", 4
local lib = LibStub:NewLibrary(MAJOR, MINOR)

if not lib then return end

local races = {
    ["mensch"] = "Human",
    ["orc"] = "Orc",
    ["zwerg"] = "Dwarf",
    ["nachtelf"] = "NightElf",
    ["nachtelfe"] = "NightElf",
    ["untoter"] = "Scourge",
    ["untote"] = "Scourge",
    ["tauren"] = "Tauren",
    ["gnom"] = "Gnome",
    ["troll"] = "Troll",
    ["goblin"] = "Goblin",
    ["blutelf"] = "BloodElf",
    ["blutelfe"] = "BloodElf",
    ["draenei"] = "Draenei",
    ["worgen"] = "Worgen",
    ["pandaren"] = "Pandaren",
    ["human"] = "Human",
    ["dwarf"] = "Dwarf",
    ["night elf"] = "NightElf",
    ["undead"] = "Scourge",
    ["gnome"] = "Gnome",
    ["blood elf"] = "BloodElf",
    ["humano"] = "Human",
    ["humana"] = "Human",
    ["orco"] = "Orc",
    ["enano"] = "Dwarf",
    ["enana"] = "Dwarf",
    ["elfo de la noche"] = "NightElf",
    ["elfa de la noche"] = "NightElf",
    ["no-muerto"] = "Scourge",
    ["no-muerta"] = "Scourge",
    ["gnomo"] = "Gnome",
    ["gnoma"] = "Gnome",
    ["trol"] = "Troll",
    ["elfo de sangre"] = "BloodElf",
    ["elfa de sangre"] = "BloodElf",
    ["huargen"] = "Worgen",
    ["humain"] = "Human",
    ["humaine"] = "Human",
    ["orque"] = "Orc",
    ["nain"] = "Dwarf",
    ["naine"] = "Dwarf",
    ["elfe de la nuit"] = "NightElf",
    ["mort-vivant"] = "Scourge",
    ["morte-vivante"] = "Scourge",
    ["taurène"] = "Tauren",
    ["trollesse"] = "Troll",
    ["gobelin"] = "Goblin",
    ["gobeline"] = "Goblin",
    ["elfe de sang"] = "BloodElf",
    ["draeneï"] = "Draenei",
    ["pandarène"] = "Pandaren",
    ["umano"] = "Human",
    ["umana"] = "Human",
    ["orchessa"] = "Orc",
    ["nano"] = "Dwarf",
    ["nana"] = "Dwarf",
    ["elfo della notte"] = "NightElf",
    ["elfa della notte"] = "NightElf",
    ["non morto"] = "Scourge",
    ["non morta"] = "Scourge",
    ["elfo del sangue"] = "BloodElf",
    ["elfa del sangue"] = "BloodElf",
    ["인간"] = "Human",
    ["오크"] = "Orc",
    ["드워프"] = "Dwarf",
    ["나이트 엘프"] = "NightElf",
    ["언데드"] = "Scourge",
    ["타우렌"] = "Tauren",
    ["노움"] = "Gnome",
    ["트롤"] = "Troll",
    ["고블린"] = "Goblin",
    ["블러드 엘프"] = "BloodElf",
    ["드레나이"] = "Draenei",
    ["늑대인간"] = "Worgen",
    ["판다렌"] = "Pandaren",
    ["orquisa"] = "Orc",
    ["anão"] = "Dwarf",
    ["anã"] = "Dwarf",
    ["elfo noturno"] = "NightElf",
    ["elfa noturna"] = "NightElf",
    ["morto-vivo"] = "Scourge",
    ["morta-viva"] = "Scourge",
    ["taurena"] = "Tauren",
    ["gnomida"] = "Gnome",
    ["trolesa"] = "Troll",
    ["goblina"] = "Goblin",
    ["elfo sangrento"] = "BloodElf",
    ["elfa sangrenta"] = "BloodElf",
    ["draenaia"] = "Draenei",
    ["worgenin"] = "Worgen",
    ["pandarena"] = "Pandaren",
    ["Человек"] = "Human",
    ["Орк"] = "Orc",
    ["Дворф"] = "Dwarf",
    ["Ночной эльф"] = "NightElf",
    ["Ночная эльфийка"] = "NightElf",
    ["Нежить"] = "Scourge",
    ["Таурен"] = "Tauren",
    ["Гном"] = "Gnome",
    ["Тролль"] = "Troll",
    ["Гоблин"] = "Goblin",
    ["Эльф крови"] = "BloodElf",
    ["Эльфийка крови"] = "BloodElf",
    ["Дреней"] = "Draenei",
    ["Дренейка"] = "Draenei",
    ["Ворген"] = "Worgen",
    ["Пандарен"] = "Pandaren",
    ["人类"] = "Human",
    ["兽人"] = "Orc",
    ["矮人"] = "Dwarf",
    ["暗夜精灵"] = "NightElf",
    ["亡灵"] = "Scourge",
    ["牛头人"] = "Tauren",
    ["侏儒"] = "Gnome",
    ["巨魔"] = "Troll",
    ["地精"] = "Gnome",
    ["血精灵"] = "BloodElf",
    ["德莱尼"] = "Draenei",
    ["狼人"] = "Worgen",
    ["熊猫人"] = "Pandaren",
    ["人類"] = "Human",
    ["獸人"] = "Orc",
    ["夜精靈"] = "NightElf",
    ["不死族"] = "Scourge",
    ["牛頭人"] = "Tauren",
    ["食人妖"] = "Troll",
    ["哥布林"] = "Goblin",
    ["血精靈"] = "BloodElf",
    ["德萊尼"] = "Draenei",
    ["熊貓人"] = "Pandaren",
};

function lib.GetRaceToken(name)
	return races[name];
end
