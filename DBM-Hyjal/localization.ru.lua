if GetLocale() ~= "ruRU" then return end

local L

------------------------
--  Rage Winterchill  --
------------------------
L = DBM:GetModLocalization("Rage")

L:SetGeneralLocalization({
	name = "Лютый Хлад"
})
L:SetOptionLocalization {
	AnnounceVoicePhase = "Озвучка фаз тралом :)"
}
-----------------
--  Anetheron  --
-----------------
L = DBM:GetModLocalization("Anetheron")

L:SetGeneralLocalization({
	name = "Анетерон"
})

L:SetOptionLocalization {
	AnnounceFails = "Объявлять игроков, попавших под $spell:317873, в рейд-чат\n(требуются права лидера или помощника)",
}

L:SetMiscLocalization {
	FearOn = "Фир на: %s",
	Fear   = "Кто попал под Фир (в этом бою): %s"
}

----------------
--  Kazrogal  --
----------------
L = DBM:GetModLocalization("Kazrogal")

L:SetGeneralLocalization({
	name = "Каз'рогал"
})

L:SetOptionLocalization({
	HpOff = "Если выбивает ошибки отключите данную функцию",
	SetAbbIcon = "Ставить метки на инферналов(1 фаза)",
	AnnounceVoicePhase = "Озвучка фазы тралом :)"
})

---------------
--  Azgalor  --
---------------
L = DBM:GetModLocalization("Azgalor")

L:SetGeneralLocalization({
	name = "Азгалор"
})

L:SetOptionLocalization {
	AnnounceVoicePhase = "Озвучка фаз тралом :)"
}

------------------
--  Archimonde  --
------------------
L = DBM:GetModLocalization("Archimonde")

L:SetGeneralLocalization({
	name = "Архимонд"
})

L:SetOptionLocalization {
	AnnounceVoicePhase = "Озвучка фаз тралом :)"
}

----------------
-- WaveTimers --
----------------
L = DBM:GetModLocalization("HyjalWaveTimers")

L:SetGeneralLocalization({
	name = "Треш-мобы"
})

L:SetWarningLocalization({
	WarnWave = "%s",
	WarnWaveSoon = "Скоро следующая волна"
})

L:SetTimerLocalization({
	TimerWave = "Следующая волна"
})

L:SetOptionLocalization({
	WarnWave     = "Warn when a new wave is incoming", --Translate
	WarnWaveSoon = "Warn when a new wave is incoming soon", --Translate
	DetailedWave = "Detailed warning when a new wave is incoming (which mobs)", --Translate
	TimerWave    = "Show a timer for next wave" --Translate
})

L:SetMiscLocalization({
	HyjalZoneName   = "Вершина Хиджала",
	Thrall          = "Тралл",
	Jaina           = "Леди Джайна Праудмур",
	RageWinterchill = "Лютый Хлад",
	Anetheron       = "Анетерон",
	Kazrogal        = "Каз'рогал",
	Azgalor         = "Азгалор",
	WaveCheck       = "Текущая атака: (%d+) из 5",
	WarnWave_0      = "Волна %s/5",
	WarnWave_1      = "Волна %s/5 - %s %s",
	WarnWave_2      = "Волна %s/5 - %s %s и %s %s",
	WarnWave_3      = "Волна %s/5 - %s %s, %s %s и %s %s",
	WarnWave_4      = "Волна %s/5 - %s %s, %s %s, %s %s и %s %s",
	WarnWave_5      = "Волна %s/5 - %s %s, %s %s, %s %s, %s %s и %s %s",
	WarnWave__1     = "Волна %s/5 - %s %s, %s %s",
	RageGossip      = "Леди Праудмур, мертвецы построили еще один лагерь. В скором времени они начнут атаковать нас. Мы готовы помочь!",
	AnetheronGossip = "Мы готовы встретить любого, кого пошлет Архимонд, леди Праудмур.",
	KazrogalGossip  = "Я с тобой, Тралл.",
	AzgalorGossip   = "Нам нечего бояться.",
	JainaFirst      = "Держитесь! Мы должны победить!",

	Boss1GossipStart = "Леди Праудмур, мы отразили натиск нежити, но разведчики докладывают о прибытии могущественного лича. Помогите нам!",

	Pudge1      = "Изрыгатель слизи",
	Pudge2      = "Монструозное поганище",
	Fiend       = "Могильщика",
	Necromancer = "Некроманта",

	Ghoul       = "Вурдалака",
	Abomination = "Поганища",

	Banshee = "Банши",

	Gargoyle = "Горгульи",
	Wyrm     = "Ледяной змей",
	Stalker  = "Ловчих Скверны",
	Infernal = "Инфернала"
})
