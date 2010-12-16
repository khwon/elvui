local function SpellName(id)
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo(id)
	return name
end

--[[
	Nameplate Filter, Add the Nameplates name exactly here that you do NOT want to see
]]
PlateBlacklist = {
	--Shaman Totems
	["Earth Elemental Totem"] = true,
	["Fire Elemental Totem"] = true,
	["Fire Resistance Totem"] = true,
	["Flametongue Totem"] = true,
	["Frost Resistance Totem"] = true,
	["Healing Stream Totem"] = true,
	["Magma Totem"] = true,
	["Mana Spring Totem"] = true,
	["Nature Resistance Totem"] = true,
	["Searing Totem"] = true,
	["Stoneclaw Totem"] = true,
	["Stoneskin Totem"] = true,
	["Strength of Earth Totem"] = true,
	["Windfury Totem"] = true,
	["Totem of Wrath"] = true,
	["Wrath of Air Totem"] = true,

	--Army of the Dead
	["Army of the Dead Ghoul"] = true,

	--Hunter Trap
	["Venomous Snake"] = true,
	["Viper"] = true,

	--Test
	--["Unbound Seer"] = true,
}

--[[
		This portion of the file is for adding of deleting a spellID for a specific encounter on Grid layout
		or enemy cooldown in Arena displayed on screen.
		
		The best way to add or delete spell is to go at www.wowhead.com, search for a spell :
		Example : Incinerate Flesh from Lord Jaraxxus -> http://www.wowhead.com/?spell=67049
		Take the number ID at the end of the URL, and add it to the list
		
		That's it, That's all! 
		
		Tukz
]]-- 

--------------------------------------------------------------------------------------------
-- Raid Buff Reminder (Bar in the topright corner below minimap)
--------------------------------------------------------------------------------------------

BuffReminderRaidBuffs = {
	Flask = {
		94160, --"Flask of Flowing Water"
		79469, --"Flask of Steelskin"
		79470, --"Flask of the Draconic Mind"
		79471, --"Flask of the Winds
		79472, --"Flask of Titanic Strength"
	},
	BattleElixir = {
		33721, --"Spellpower Elixir",
	},
	GuardianElixir = {
		60343, --"Elixir of Mighty Defense",
	},
	Food = {
		57325, -- 80 AP
	},
}

--------------------------------------------------------------------------------------------
-- Buff Watch (Raid Frame Buff Indicator)
--------------------------------------------------------------------------------------------

if TukuiCF["auras"].raidunitbuffwatch == true then
	-- Classbuffs { spell ID, position [, {r,g,b,a}][, anyUnit] }
	
	--Healer Layout
	TukuiDB.HealerBuffIDs = {
		PRIEST = {
			{6788, "TOPLEFT", {1, 0, 0}, true}, -- Weakened Soul
			{33076, "TOPRIGHT", {0.2, 0.7, 0.2}}, -- Prayer of Mending
			{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, -- Renew
			{17, "BOTTOMRIGHT", {0.81, 0.85, 0.1}, true}, -- Power Word: Shield
			{10060 , "RIGHT", {227/255, 23/255, 13/255}}, -- Power Infusion
			{33206, "LEFT", {227/255, 23/255, 13/255}, true}, -- Pain Suppress
			{47788, "LEFT", {221/255, 117/255, 0}, true}, -- Hand of Freedom
		},
		DRUID = {
			{774, "TOPRIGHT", {0.8, 0.4, 0.8}}, -- Rejuvenation
			{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}}, -- Regrowth
			{94447, "TOPLEFT", {0.4, 0.8, 0.2}}, -- Lifebloom
			{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}}, -- Wild Growth
		},
		PALADIN = {
			{53563, "TOPRIGHT", {0.7, 0.3, 0.7}}, -- Beacon of Light
			{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true}, -- Hand of Protection
			{1044, "BOTTOMRIGHT", {221/255, 117/255, 0}, true}, -- Hand of Freedom
			{6940, "BOTTOMRIGHT", {227/255, 23/255, 13/255}, true}, -- Hand of Sacrafice
			{1038, "BOTTOMRIGHT", {238/255, 201/255, 0}, true} -- Hand of Salvation
		},
		SHAMAN = {
			{61295, "TOPLEFT", {0.7, 0.3, 0.7}}, -- Riptide 
			{16236, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, -- Ancestral Fortitude
			{51945, "BOTTOMRIGHT", {0.7, 0.4, 0}}, -- Earthliving
			{974, "TOPRIGHT", {221/255, 117/255, 0}, true}, -- Earth Shield
		},
		ALL = {
			{23333, "LEFT", {1, 0, 0}}, -- Warsong Flag
		},
	}

	--DPS Layout
	TukuiDB.DPSBuffIDs = {
		PALADIN = {
			{1022, "TOPRIGHT", {0.2, 0.2, 1}, true}, -- Hand of Protection
			{1044, "TOPRIGHT", {221/255, 117/255, 0}, true}, -- Hand of Freedom
			{6940, "TOPRIGHT", {227/255, 23/255, 13/255}, true}, -- Hand of Sacrafice
			{1038, "TOPRIGHT", {238/255, 201/255, 0}, true}, -- Hand of Salvation
		},
		ROGUE = {
			{57933, "TOPRIGHT", {227/255, 23/255, 13/255}}, -- Tricks of the Trade
		},
		DEATHKNIGHT = {
			{49016, "TOPRIGHT", {227/255, 23/255, 13/255}}, -- Hysteria
		},
		MAGE = {
			{54646, "TOPRIGHT", {0.2, 0.2, 1}}, -- Focus Magic
		},
		WARRIOR = {
			{59665, "TOPLEFT", {0.2, 0.2, 1}}, -- Vigilance
			{3411, "TOPRIGHT", {227/255, 23/255, 13/255}}, -- Intervene
		},
		ALL = {
			{23333, "LEFT", {1, 0, 0}}, -- Warsong flag
		},
	}
	
	--Layout for pets
	TukuiDB.PetBuffs = {
		HUNTER = {
			{136, "TOPRIGHT", {0.2, 0.8, 0.2}}, -- Mend Pet
		},
		DEATHKNIGHT = {
			{91342, "TOPRIGHT", {0.2, 0.8, 0.2}}, -- Shadow Infusion
			{63560, "TOPLEFT", {227/255, 23/255, 13/255}}, --Dark Transformation
		},
		WARLOCK = {
			{47193, "TOPRIGHT", {227/255, 23/255, 13/255}}, --Demonic Empowerment
		},
	}
end

--List of buffs to watch for on arena frames
ArenaBuffWhiteList = {
	-- Buffs
		[SpellName(1022)] = true, --hop
		[SpellName(12051)] = true, --evoc
		[SpellName(2825)] = true, --BL
		[SpellName(32182)] = true, --Heroism
		[SpellName(33206)] = true, --Pain Suppression
		[SpellName(29166)] = true, --Innervate
		[SpellName(18708)] = true, --"Fel Domination"
		[SpellName(54428)] = true, --divine plea
		[SpellName(31821)] = true, -- aura mastery

	-- Turtling abilities
		[SpellName(871)] = true, --Shield Wall
		[SpellName(48707)] = true, --"Anti-Magic Shell"
		[SpellName(31224)] = true, -- cloak of shadows
		[SpellName(19263)] = true, -- deterance
		[SpellName(47585)] = true, --  Dispersion

	-- Immunities
		[SpellName(45438)] = true, -- ice Brock
		[SpellName(642)] = true, -- pally bubble from hell
		
	-- Offensive Shit
		[SpellName(31884)] = true, -- Avenging Wrath
		[SpellName(34471)] = true, -- beast within
		[SpellName(85696)] = true, -- Zealotry
		[SpellName(467)] = true, -- Thorns
}

-------------------------------------------------------------
-- Debuff Filters
-------------------------------------------------------------

-- Debuffs to always hide
-- DPS Raid frames use this when not inside a BG/Arena. Player, TargetTarget, Focus always use it.
DebuffBlacklist = {
	[SpellName(8733)] = true, --Blessing of Blackfathom
	[SpellName(57724)] = true, --Sated
	[SpellName(25771)] = true, --forbearance
	[SpellName(57723)] = true, --Exhaustion
	[SpellName(36032)] = true, --arcane blast
	[SpellName(58539)] = true, --watchers corpse
	[SpellName(26013)] = true, --deserter
	[SpellName(6788)] = true, --weakended soul
	[SpellName(71041)] = true, --dungeon deserter
	[SpellName(41425)] = true, --"Hypothermia"
	[SpellName(55711)] = true, --Weakened Heart
	[SpellName(28531)] = true, --frost aura (naxx)
	[SpellName(67604)] = true, --Powering Up toc
	[SpellName(8326)] = true, --ghost
	[SpellName(20584)] = true, --ghost
	[SpellName(23445)] = true, --evil twin
	[SpellName(24755)] = true, --gay homosexual tricked or treated debuff
	[SpellName(25163)] = true, --fucking annoying pet debuff oozeling disgusting aura
	[SpellName(80354)] = true, --timewarp debuff
}


-- Debuffs to Show
-- Only works on raid frames when inside a BG/Arena. Target frame will always show these
DebuffWhiteList = {
	-- Death Knight
		[SpellName(51209)] = true, --hungering cold
		[SpellName(47476)] = true, --strangulate
	-- Druid
		[SpellName(33786)] = true, --Cyclone
		[SpellName(2637)] = true, --Hibernate
		[SpellName(339)] = true, --Entangling Roots
		[SpellName(80964)] = true, --Skull Bash
	-- Hunter
		[SpellName(3355)] = true, --Freezing Trap Effect
		--[SpellName(60210)] = true, --Freezing Arrow Effect
		[SpellName(1513)] = true, --scare beast
		[SpellName(19503)] = true, --scatter shot
		[SpellName(34490)] = true, --silence shot
	-- Mage
		[SpellName(31661)] = true, --Dragon's Breath
		[SpellName(61305)] = true, --Polymorph
		[SpellName(18469)] = true, --Silenced - Improved Counterspell
		[SpellName(122)] = true, --Frost Nova
		[SpellName(55080)] = true, --Shattered Barrier
	-- Paladin
		[SpellName(20066)] = true, --Repentance
		[SpellName(10326)] = true, --Turn Evil
		[SpellName(853)] = true, --Hammer of Justice
	-- Priest
		[SpellName(605)] = true, --Mind Control
		[SpellName(64044)] = true, --Psychic Horror
		[SpellName(8122)] = true, --Psychic Scream
		[SpellName(9484)] = true, --Shackle Undead
		[SpellName(15487)] = true, --Silence
	-- Rogue
		[SpellName(2094)] = true, --Blind
		[SpellName(1776)] = true, --Gouge
		[SpellName(6770)] = true, --Sap
		[SpellName(18425)] = true, --Silenced - Improved Kick
	-- Shaman
		[SpellName(51514)] = true, --Hex
		[SpellName(3600)] = true, --Earthbind
		[SpellName(8056)] = true, --Frost Shock
		[SpellName(63685)] = true, --Freeze
		[SpellName(39796)] = true, --Stoneclaw Stun
	-- Warlock
		[SpellName(710)] = true, --Banish
		[SpellName(6789)] = true, --Death Coil
		[SpellName(5782)] = true, --Fear
		[SpellName(5484)] = true, --Howl of Terror
		[SpellName(6358)] = true, --Seduction
		[SpellName(30283)] = true, --Shadowfury
		[SpellName(89605)] = true, --Aura of Foreboding
	-- Warrior
		[SpellName(20511)] = true, --Intimidating Shout
	-- Racial
		[SpellName(25046)] = true, --Arcane Torrent
	
	--PVE

			
}

--List of debuffs for targetframe for pvp only (when inside a bg/arena
--We do this because in PVE Situations we don't want to see these debuffs on our target frame
TargetPVPOnly = {
	[SpellName(34438)] = true, --UA
	[SpellName(34914)] = true, --VT
	[SpellName(31935)] = true, --avengers shield
	[SpellName(63529)] = true, --shield of the templar
	[SpellName(19386)] = true, --wyvern sting
	[SpellName(116)] = true, --frostbolt
	[SpellName(58179)] = true, --infected wounds
	[SpellName(18223)] = true, -- curse of exhaustion
	[SpellName(18118)] = true, --aftermath
	[SpellName(31589)] = true, --Slow
	--not sure if this one belongs here but i do know frost pve uses this
	[SpellName(44572)] = true, --deep freeze
}

--This list is used by the healerlayout (When not inside a bg/arena)
DebuffHealerWhiteList = {
	--Baradin Hold
		[SpellName(95173)] = true, -- Consuming Darkness
		
	--Blackwing Descent
		--Magmaw
		[SpellName(91911)] = true, -- Constricting Chains
		[SpellName(94679)] = true, -- Parasitic Infection
		[SpellName(94617)] = true, -- Mangle
		
		--Omintron Defense System
		[SpellName(79835)] = true, --Poison Soaked Shell	
		[SpellName(91433)] = true, --Lightning Conductor
		[SpellName(91521)] = true, --Incineration Security Measure
		
		--Maloriak
		[SpellName(77699)] = true, -- Flash Freeze
		[SpellName(77760)] = true, -- Biting Chill
		
		--Atramedes
		[SpellName(92423)] = true, -- Searing Flame
		[SpellName(92485)] = true, -- Roaring Flame
		[SpellName(92407)] = true, -- Sonic Breath
		
		--Chimaeron
		[SpellName(82881)] = true, -- Break
		
		--Nefarian
		
	--The Bastion of Twilight
		--Valiona & Theralion
		[SpellName(92878)] = true, -- Blackout
		[SpellName(86840)] = true, -- Devouring Flames
		
		--Halfus Wyrmbreaker
		
		--Twilight Ascendant Council
		[SpellName(92511)] = true, -- Hydro Lance
		[SpellName(82762)] = true, -- Waterlogged
		[SpellName(92505)] = true, -- Frozen
		[SpellName(92518)] = true, -- Flame Torrent
		[SpellName(83099)] = true, -- Lightning Rod
		[SpellName(92075)] = true, -- Gravity Core
		[SpellName(92488)] = true, -- Gravity Crush
		
		--Cho'gall
		
	--Throne of the Four Winds
		--Conclave of Wind
			--Nezir <Lord of the North Wind>
			[SpellName(93131)] = true, --Ice Patch
			--Anshal <Lord of the West Wind>
			[SpellName(86206)] = true, --Soothing Breeze
			[SpellName(93122)] = true, --Toxic Spores
			--Rohash <Lord of the East Wind>
			[SpellName(93058)] = true, --Slicing Gale 
		--Al'Akir
		[SpellName(93260)] = true, -- Ice Storm
		[SpellName(93295)] = true, -- Lightning Rod
}

--This list is used by the dps layout grid (When not inside a bg/arena)
DebuffDPSWhiteList = {
	--Baradin Hold
		[SpellName(88942)] = true, -- Meteor Slash
		
	--Blackwing Descent
		--Magmaw
		[SpellName(91911)] = true, -- Constricting Chains
		
		--Omintron Defense System
		[SpellName(91431)] = true, --Lightning Conductor
		
		--Maloriak
		[SpellName(77699)] = true, -- Flash Freeze
		
		--Atramedes
		
		--Chimaeron
		[SpellName(82881)] = true, -- Break
		
		--Nefarian
		
	--The Bastion of Twilight
		--Valiona & Theralion
		[SpellName(92878)] = true, -- Blackout
		[SpellName(86840)] = true, -- Devouring Flames
		
		--Halfus Wyrmbreaker
		
		--Twilight Ascendant Council
		[SpellName(92511)] = true, -- Hydro Lance
		[SpellName(82762)] = true, -- Waterlogged
		[SpellName(92518)] = true, -- Flame Torrent
		[SpellName(83099)] = true, -- Lightning Rod
		[SpellName(92075)] = true, -- Gravity Core
		[SpellName(92488)] = true, -- Gravity Crush
		
		--Cho'gall
		
	--Throne of the Four Winds
		--Conclave of Wind
			--Nezir <Lord of the North Wind>
			[SpellName(93131)] = true, --Ice Patch
			--Anshal <Lord of the West Wind>
			
			--Rohash <Lord of the East Wind>
			
		--Al'Akir
		[SpellName(93260)] = true, -- Ice Storm
		[SpellName(93295)] = true, -- Lightning Rod
}

--------------------------------------------------------------------------------------------
-- Enemy cooldown tracker or Spell Alert list
--------------------------------------------------------------------------------------------

-- the spellIDs to track on screen in arena.
if TukuiCF["arena"].spelltracker == true then
	TukuiDB.spelltracker = {
		[1766] = 10, -- kick
		[6552] = 10, -- pummel
		[80964] = 60, --SkullBash Bear
		[80965] = 60, --SkullBash Cat
		[85285] = 10, --Rebuke
		[2139] = 24, -- counterspell
		[19647] = 24, -- spell lock
		[10890] = 27, -- fear priest
		[47476] = 120, -- strangulate
		[47528] = 10, -- mindfreeze
		[29166] = 180, -- innervate
		[49039] = 120, -- Lichborne
		[54428] = 120, -- Divine Plea
		[10278] = 180, -- Hand of Protection
		[16190] = 180, -- Mana Tide Totem
		[51514] = 45, -- Hex
		[2094] = 120, -- Blind
		[72] = 12, -- fucking prot warrior shield bash
		[33206] = 144, -- pain sup
		[15487] = 45, -- silence priest
		[34490] = 20, -- i hate hunter silencing shot
		[14311] = 30, -- hunter forst trap shit
	}
end
