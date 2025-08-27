
-- The main variables to mess with are oldHair, dayHair, nightHair, and targetCharacter.
-- oldHair = The day hair that's currently on the character. Only necessary if you are swapping day hairs mid-game, otherwise, you can leave it empty.
-- dayHair = The hair you want to display during day/armor set.
-- nightHair = The hair you want to display during night/camp set.
-- targetCharacter = The character you want this to apply to.

-- Most of this code was written by wesslen. Thank you!

local function OnSessionLoaded()
	print ("Auto-Switch Hair mod was successfully loaded.")
end

local locNilHair = '00000000-0000-0000-0000-000000000001'
function SetHairOverride(character, newHair)
	local currentHair = GetVarUUID(character, 'Em_HairOverride')
	if currentHair == newHair then
		return
	end

	if currentHair and currentHair ~= locNilHair then
--		print("remove hair " .. currentHair)
		RemoveCustomVisualOvirride(character, currentHair)
	end

	SetVarUUID(character, 'Em_HairOverride', newHair or locNilHair)
	if newHair then
--		print("set hair " .. newHair)
		AddCustomVisualOverride(character, newHair)
	end
end

local oldHair = "" -- Old hair, if you want to change the day hair mid-game
local dayHair = "03bb366d-e3da-4976-9dab-c7635965f330" -- Daytime hair, currently set to Luskan Plume
local nightHair = "4aac9b41-75f7-4724-b3cd-e6ca810092a7" -- Nighttime hair, currently set to Bardic Inspiration

local allHairs = { oldHair, nightHair, dayHair }

local function locApplyDayHair()
	SetHairOverride(targetCharacter, dayHair)
end

local function locArmorChanged(entity)
--	_D(entity.ArmorSetState)

	if entity.ArmorSetState.State == 'Vanity' then
		SetHairOverride(targetCharacter, nightHair)
	else
		locApplyDayHair()
--		SetHairOverride(targetCharacter, nil)
	end
end

local locInited = false
local function locInit()
	targetCharacter = Osi.DB_Avatars:Get(nil)[1][1] -- This sets the target player to your avatar. If you want it to apply to a companion instead, place their UUID here. Example code commented out below.
	-- targetCharacter = "00000000-0000-0000-0000-000000000000"
	if locInited then
		return
	end
	locInited = true

	local entity = Ext.Entity.Get(targetCharacter)
	if not entity then
		return
	end

	local currentHair = GetVarUUID(targetCharacter, 'Em_HairOverride')
	for _, hair in pairs(allHairs) do
		if hair ~= currentHair then
			RemoveCustomVisualOvirride(targetCharacter, hair)
		end
	end

	if not entity.ArmorSetState then
		-- the ArmorSetState component is not present before it's been used for the first time.
		-- create it if it doesn't exist so we can listen for changes on first use
		entity:CreateComponent('ArmorSetState')
	end
	locArmorChanged(entity)

	Ext.Entity.OnChange("ArmorSetState", locArmorChanged, entity)
end

local function locOnGameStateChanged(event)
	if event.ToState.Label ~= "Running"
	or event.FromState.Label == "Save"
	then
		return
	end
	locInit()
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)
Ext.Events.GameStateChanged:Subscribe(locOnGameStateChanged)
Ext.Events.ResetCompleted:Subscribe(locInit)