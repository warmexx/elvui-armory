if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

local U = select(2, ...)
local s = U.s
local c = U.c

local function ColorItemBorder(b, link)
    local quality, _
    if link then
        _, _, quality = GetItemInfo(link)
    end
    U.ColorItemBorder(b, quality or Armory:GetQualityFromLink(link))
end

local function CreateBackdrop(b, ...)
	b:CreateBackdrop(...)
    return b.backdrop or b.Backdrop
end

local function PointXY(frame, x, y)
	local a, b, c, d, e = frame:GetPoint()
	frame:SetPoint(a, b, c, x or d, y or e)
end

local function SkinMisc()
    local skins = {
        "ArmoryStaticPopup",
        "ArmoryDropDownList1MenuBackdrop",
        "ArmoryDropDownList2MenuBackdrop",
        "ArmoryDropDownList1Backdrop",
        "ArmoryDropDownList2Backdrop"
    }
    for _, skin in ipairs(skins) do
        _G[skin]:SetTemplate("Transparent")
    end

    U.SkinButton(ArmoryStaticPopupButton1)
    U.SkinButton(ArmoryStaticPopupButton2)
end

local function SkinOptionDropDownBox(f)
    local point, relativeTo, relativePoint, x, y = f.Label:GetPoint()
    f.Label:ClearAllPoints()
    f.Label:SetPoint(point, relativeTo, relativePoint, x + 8, y)
    U.SkinDropDownBox(f)
end

local function SkinOptions()
    local checkBoxes = {
        "ArmoryOptionsPanelEnable",
        "ArmoryOptionsPanelSearchAll",
        "ArmoryOptionsPanelLastViewed",
        "ArmoryOptionsPanelPerCharacter",
        "ArmoryOptionsPanelShowAltEquip",
        "ArmoryOptionsPanelShowUnequip",
        "ArmoryOptionsPanelShowEqcTooltips",
        "ArmoryOptionsPanelPauseInCombat",
        "ArmoryOptionsPanelPauseInInstance",
        "ArmoryOptionsPanelScanOnEnter",
        "ArmoryOptionsPanelFactionFilter",
        "ArmoryOptionsPanelClassColors",
        "ArmoryOptionsPanelScaleOnMouseWheel",

        "ArmoryOptionsMinimapPanelMinimapButton",
        "ArmoryOptionsMinimapPanelGlobalMinimapButton",
        "ArmoryOptionsMinimapPanelHideIfToolbar",
        "ArmoryOptionsMinimapPanelGlobalPositionButton",

        "ArmoryOptionsModulePanelInventory",
        "ArmoryOptionsModulePanelQuestLog",
        "ArmoryOptionsModulePanelSpellBook",
        "ArmoryOptionsModulePanelTradeSkills",
        "ArmoryOptionsModulePanelSocial",
        "ArmoryOptionsModulePanelSharing",
        "ArmoryOptionsModulePanelPets",
        "ArmoryOptionsModulePanelTalents",
        "ArmoryOptionsModulePanelPVP",
        "ArmoryOptionsModulePanelReputation",
        "ArmoryOptionsModulePanelSkills",
        "ArmoryOptionsModulePanelRaid",
        "ArmoryOptionsModulePanelBuffs",

        "ArmoryOptionsSharePanelShareProfessions",
        "ArmoryOptionsSharePanelShareQuests",
        "ArmoryOptionsSharePanelShareCharacter",
        "ArmoryOptionsSharePanelShareItems",
        "ArmoryOptionsSharePanelShareAsAlt",
        "ArmoryOptionsSharePanelChannelCheck",
        "ArmoryOptionsSharePanelShareInInstance",
        "ArmoryOptionsSharePanelShareInCombat",
        "ArmoryOptionsSharePanelShowShareMessages",
        "ArmoryOptionsSharePanelShareAll",

        "ArmoryOptionsTooltipPanelItemCountPerSlot",
        "ArmoryOptionsTooltipPanelGlobalItemCount",
        "ArmoryOptionsTooltipPanelCrossFactionItemCount",

        "ArmoryOptionsFindPanelSearchWindow",
        "ArmoryOptionsFindPanelSearchRealms",
        "ArmoryOptionsFindPanelSearchExtended",
        "ArmoryOptionsFindPanelSearchRestrictive",
        "ArmoryOptionsFindPanelSearchAltClick",

        "ArmoryOptionsExpirationPanelIgnoreAlts",
        "ArmoryOptionsExpirationPanelCheckVisit",
        "ArmoryOptionsExpirationPanelExcludeVisit",
        "ArmoryOptionsExpirationPanelLogonVisit",
        "ArmoryOptionsExpirationPanelCheckCount",
        "ArmoryOptionsExpirationPanelHideCount",
        "ArmoryOptionsExpirationPanelLogonCount",

        "ArmoryOptionsSummaryPanelSummary",
        "ArmoryOptionsSummaryPanelClass",
        "ArmoryOptionsSummaryPanelLevel",
        "ArmoryOptionsSummaryPanelZone",
        "ArmoryOptionsSummaryPanelXP",
        "ArmoryOptionsSummaryPanelPlayed",
        "ArmoryOptionsSummaryPanelOnline",
        "ArmoryOptionsSummaryPanelMoney",
        "ArmoryOptionsSummaryPanelRaidInfo",
        "ArmoryOptionsSummaryPanelQuest",
        "ArmoryOptionsSummaryPanelExpiration",
        "ArmoryOptionsSummaryPanelTradeSkills",

        "ArmoryOptionsMiscPanelLDBLabel",
        "ArmoryOptionsMiscPanelEncoding",
        "ArmoryOptionsMiscPanelEnhancedTips",
        "ArmoryOptionsMiscPanelExtendedTradeSkills",
        "ArmoryOptionsMiscPanelSystemWarnings",
    }
    local sliders = {
        "ArmoryOptionsPanelScaleSlider",
        "ArmoryOptionsMinimapPanelAngleSlider",
        "ArmoryOptionsMinimapPanelRadiusSlider",
        "ArmoryOptionsExpirationPanelExpDaysSlider",
        "ArmoryOptionsSummaryPanelDelaySlider",
    }
    local dropDownBoxes = {
        "ArmoryOptionsPanelWeeklyResetDropDown",
        "ArmoryOptionsFindPanelDefaultSearchTypeDropDown",
        "ArmoryOptionsMiscPanelWarningSoundDropDown",
    }
    local swatches = {
        "ArmoryOptionsTooltipPanelShowItemCount",
        "ArmoryOptionsTooltipPanelShowItemCountTotals",
        "ArmoryOptionsTooltipPanelShowKnownBy",
        "ArmoryOptionsTooltipPanelShowHasSkill",
        "ArmoryOptionsTooltipPanelShowCanLearn",
        "ArmoryOptionsTooltipPanelShowCrafters",
    }
    local buttons = {
        "ArmoryOptionsPanelResetScreen",
        "ArmoryOptionsExpirationPanelCheck",
    }
    local editBoxes = {
        "ArmoryOptionsSharePanelChannelName",
    }

    for _, name in ipairs(checkBoxes) do
		U.SkinCheckBox(_G[name])
    end

    for _, name in ipairs(sliders) do
        U.SkinSliderFrame(_G[name])
    end

    for _, name in ipairs(dropDownBoxes) do
        SkinOptionDropDownBox(_G[name])
    end

    for _, name in ipairs(swatches) do
        U.SkinCheckBox(_G[name.."Check"])
    end

    for _, name in ipairs(buttons) do
        U.SkinButton(_G[name])
    end

    for _, name in ipairs(editBoxes) do
        U.SkinEditBox(_G[name])
        _G[name]:Height(_G[name]:GetHeight() - 5)
    end
end

local function SkinTooltips()
    local tooltips = {
        ArmoryComparisonTooltip1,
        ArmoryComparisonTooltip2,
    }

    local function AdjustTooltip(tt)
        local _, link = tt:GetItem()
        local point, relativeTo, relativePoint, x, y = tt:GetPoint()
        local xAdd = point:find("LEFT") and 2 or -2
        tt:ClearAllPoints()
        tt:SetPoint(point, relativeTo, relativePoint, x + xAdd, y)
        ColorItemBorder(tt, link)
    end

    for _, tt in ipairs(tooltips) do
        U.SkinTooltip(tt)
        tt:HookScript("OnShow", AdjustTooltip)
    end
end

local function SkinMinimapButton()
    ArmoryMinimapButton:Hide()
    ArmoryMinimapButton:HookScript("OnShow", function(self) self:Hide() end)

    local disabled = function() return true end

    ArmoryOptionsMinimapPanelMinimapButton.disabledFunc = disabled
    ArmoryOptionsMinimapPanelGlobalMinimapButton.disabledFunc = disabled
    ArmoryOptionsMinimapPanelAngleSlider.disabledFunc = disabled
    ArmoryOptionsMinimapPanelRadiusSlider.disabledFunc = disabled
    ArmoryOptionsMinimapPanelGlobalPositionButton.disabledFunc = disabled

    ArmoryOptionsPanel_Refresh(ArmoryOptionsMinimapPanel)
end

local function SkinInsetFrame(frame, relativeTo)
    U.SkinFrame(frame)
    frame:SetHeight(frame:GetHeight() + 5)
    frame:Point("TOPLEFT", relativeTo, "BOTTOMLEFT", 0, -3)
end

local function SkinBarFrame(frame)
    local name = frame:GetName()
    _G[name.."BackgroundBar"]:Kill()
    U.SkinStatusBar(_G[name.."Bar"])
end

local function SkinPaperDollTalent()
    local frame = ArmoryPaperDollTalent
    local point, relativeTo, relativePoint, x, y = frame:GetPoint()
    U.SkinFrame(frame)
    frame:Point("TOPLEFT", 51, -62)
end

local function SkinPaperDollSkills()
    local skill1 = ArmoryPaperDollTradeSkillFrame1
    local skill2 = ArmoryPaperDollTradeSkillFrame2

    SkinInsetFrame(ArmoryPaperDollTradeSkill, ArmoryPaperDollTalent)

    SkinBarFrame(skill1)
    SkinBarFrame(skill2)
    skill2:Point("TOPLEFT", skill1, "BOTTOMLEFT", 0, -3)
end

local function SkinPaperDollHealth()
    SkinInsetFrame(ArmoryHealthFrame, ArmoryPaperDollTradeSkill)
    SkinBarFrame(ArmoryHealth)
    SkinBarFrame(ArmoryMana)
end

local function SkinPaperDollStats()
    ArmoryAttributesFrame:StripTextures()
    -- local frame = ArmoryAttributesFrame
    -- local point, relativeTo, relativePoint, x, y = frame:GetPoint()
    -- U.SkinFrame(frame)
    -- frame:SetHeight(frame:GetHeight() + 8)
end

local ResistanceCoords = {
    [1] = { 0.21875, 0.8125, 0.25, 0.32421875 },		--Arcane
    [2] = { 0.21875, 0.8125, 0.0234375, 0.09765625 },	--Fire
    [3] = { 0.21875, 0.8125, 0.13671875, 0.2109375 },	--Nature
    [4] = { 0.21875, 0.8125, 0.36328125, 0.4375},		--Frost
    [5] = { 0.21875, 0.8125, 0.4765625, 0.55078125},	--Shadow
}

local function SkinResistances(frameName)
    for i = 1, 5 do
        local frame, icon, text = _G[frameName..i], _G[frameName..i]:GetRegions()
        local point, relativeTo, relativePoint, x, y = frame:GetPoint()
        frame:Size(26)
        frame:SetTemplate("Default")

        frame:ClearAllPoints()
        if i == 1 then
            frame:Point(point, relativeTo, relativePoint, 3, 0)
        else
            frame:Point(point, relativeTo, relativePoint, 0, -5)
        end

        if icon then
            icon:SetInside()
            icon:SetTexCoord(unpack(ResistanceCoords[i]))
            icon:SetDrawLayer("ARTWORK")
        end

        if text then
            text:SetDrawLayer("OVERLAY")
        end
    end
end

local function SkinPaperDollInset()
    SkinPaperDollTalent()
    SkinPaperDollSkills()
    SkinPaperDollHealth()
    SkinPaperDollStats()
    SkinResistances("ArmoryMagicResFrame")
end

local function SkinArmoryFrame()
    U.SkinCloseButton(ArmoryFrameCloseButton)
    U.SkinFrame(ArmoryFrame)
    ArmoryFrameInset:StripTextures()

    -- Portrait
    ArmoryFramePortrait:Kill()
    ArmoryFramePortraitButton:Hide()

    -- Character selection
    U.SkinNextPrevButton(ArmorySelectCharacter, true)
    ArmorySelectCharacter:ClearAllPoints()
    ArmoryFrameLeftButton:ClearAllPoints()
    ArmoryFrameRightButton:ClearAllPoints()
    ArmorySelectCharacter:Point("TOPLEFT", ArmoryFrame, "TOPLEFT", 4, -3)
    ArmoryFrameLeftButton:Point("LEFT", ArmorySelectCharacter, "RIGHT", 4, -2)
    ArmoryFrameRightButton:Point("RIGHT", ArmoryFrameCloseButton, "LEFT", 6, -2)

    -- Title and character header
    ArmoryFrame.TitleText:ClearAllPoints()
    ArmoryLevelText:ClearAllPoints()
    ArmoryFrame.TitleText:Point("TOP", ArmoryFrame, "TOP", -6, -4)
    ArmoryLevelText:Point("TOP", ArmoryFrame.TitleText, "BOTTOM", 0, -6)

    -- Bottom tabs
    for i = 1, 5 do
        U.SkinTab(_G["ArmoryFrameTab"..i])
    end

    -- Side tabs
    for i = 1, ARMORY_MAX_LINE_TABS do
        local button = _G["ArmoryFrameLineTab"..i]
        local icon = button:GetNormalTexture()
        button:StripTextures()
        button:SetTemplate("Default", true)
        button:StyleButton()
        icon:SetTexCoord(unpack(c.TexCoords))
        icon:SetInside()

        if i == 1 then
            button:Point("TOPLEFT", ArmoryFrame, "TOPRIGHT", 2, -45)
        else
            local prevButton = _G["ArmoryFrameLineTab"..(i-1)]
            button:ClearAllPoints()
            button:Point("TOP", prevButton, "BOTTOM", 0, -8)
        end
        CreateBackdrop(button)
    end

    -- Mail
    ArmoryMailIcon:SetTexCoord(unpack(c.TexCoords))
    ArmoryMailIcon:SetInside()
    CreateBackdrop(ArmoryMailFrame):SetOutside(ArmoryMailIcon)
    ArmoryMailFrame:Point("TOPLEFT", 28, 24)

    -- Resting
    ArmoryRestIcon:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
    ArmoryRestIcon:ClearAllPoints()
    ArmoryRestIcon:Point("BOTTOMLEFT", ArmoryFrame, "TOPLEFT", -8, 0)
end

local function SkinBuffs()
    hooksecurefunc("ArmoryAuraButton_Update", function(buttonName, index, filter, unit)
        local button = _G[buttonName..index]
        if button and not button.isSkinned then
            local icon = _G[buttonName..index.."Icon"]
            icon:SetTexCoord(unpack(c.TexCoords))
            icon:SetInside()
            CreateBackdrop(button):SetOutside(icon)
            button.isSkinned = true
        end
    end)
end

local function SkinPaperDoll()
    ArmoryPaperDollFrame:StripTextures()

    local slots = {
        "HeadSlot",
        "NeckSlot",
        "ShoulderSlot",
        "BackSlot",
        "ChestSlot",
        "ShirtSlot",
        "TabardSlot",
        "WristSlot",
        "HandsSlot",
        "WaistSlot",
        "LegsSlot",
        "FeetSlot",
        "Finger0Slot",
        "Finger1Slot",
        "Trinket0Slot",
        "Trinket1Slot",
        "MainHandSlot",
        "SecondaryHandSlot",
        "RangedSlot",
    }
    for _, slot in pairs(slots) do
        local icon = _G["Armory"..slot.."IconTexture"]
        local slot = _G["Armory"..slot]
        U.SkinItemButton(slot, icon)
    end

    hooksecurefunc("ArmoryPaperDollItemSlotButton_Update", function(button)
        local slotId = button:GetID()
        local quality, _
        if button.itemId ~= nil then
            if button.itemId ~= 0 then
                _, _, quality = GetItemInfo(button.itemId)
            end
        else
            quality = Armory:GetInventoryItemQuality("player", slotId) or Armory:GetQualityFromLink(button.link)
        end
        U.ColorItemBorder(button, quality)
    end)
    hooksecurefunc("ArmoryAlternateSlotFrame_Show", function(parent, orientation, direction)
        local i = 1
        while ( _G["ArmoryAlternate"..i.."Slot"] ) do
            local button = _G["ArmoryAlternate"..i.."Slot"]
            if not button:IsShown() then break end

            button:SetNormalTexture(nil)
            button:StyleButton()
            button:SetTemplate("Default", true)
            button.icon:SetTexCoord(unpack(c.TexCoords))
            button.icon:SetInside()

            ColorItemBorder(button, button.link)
            i = i + 1
        end
    end)

    SkinPaperDollInset()
end

local function SkinPets()
    ArmoryPetFrame:StripTextures()

    ArmoryPetFrame.TitleText:Kill()
    ArmoryPetFrame.TitleText:Point("LEFT", 20)

    ArmoryPetAttributesFrame:StripTextures()
    SkinResistances("ArmoryPetMagicResFrame")

    for i = 1, ARMORY_NUM_PET_SLOTS do
        local icon = _G["ArmoryPetFramePet"..i.."IconTexture"]
        local slot = _G["ArmoryPetFramePet"..i]
        slot:StripTextures()
        slot:StyleButton(false)
        slot:SetTemplate("Default", true)
        icon:SetTexCoord(unpack(c.TexCoords))
        icon:SetInside()
    end
end

local function SkinTalents()
    ArmoryTalentFrame:StripTextures()

    for i=1, ARMORY_MAX_TALENT_TABS do
        U.SkinTab(_G["ArmoryTalentFrameTab"..i])
    end
    ArmoryTalentFrameTab1:Point("TOPLEFT", 12, -49)

	ArmoryTalentFrameScrollFrame:StripTextures()
    ArmoryTalentFrameScrollFrame:CreateBackdrop("Default")

	U.SkinScrollBar(ArmoryTalentFrameScrollFrameScrollBar)
    ArmoryTalentFrameScrollFrameScrollBar:Point("TOPLEFT", ArmoryTalentFrameScrollFrame, "TOPRIGHT", 10, -16)

	for i = 1, ARMORY_MAX_NUM_TALENTS do
		local talent = _G["ArmoryTalentFrameTalent"..i]
		local icon = _G["ArmoryTalentFrameTalent"..i.."IconTexture"]

		if talent then
			talent:StripTextures()
			talent:SetTemplate("Default")
			talent:StyleButton()

			icon:SetInside()
			icon:SetTexCoord(unpack(c.TexCoords))
			icon:SetDrawLayer("ARTWORK")
		end
	end
end

local function SkinPVP()
    ArmoryPVPFrame:StripTextures()

    local pageBackdrop = CreateFrame("Frame", nil, ArmoryPVPFrame)
    pageBackdrop:SetTemplate("Transparent")
    pageBackdrop:Point("TOPLEFT", ArmoryPVPFrame, "TOPLEFT", 22, -108)
    pageBackdrop:Point("BOTTOMRIGHT", ArmoryPVPFrame, "BOTTOMRIGHT", -8, 5)
    pageBackdrop:SetFrameLevel(ArmoryPVPFrame:GetFrameLevel())

    ArmoryHonorFrameProgressButton:CreateBackdrop("Transparent")
	ArmoryHonorFrameProgressBar:Width(322)
	ArmoryHonorFrameProgressBar:SetStatusBarTexture(c.media.normTex)
end

local function SkinReputation()
    ArmoryReputationFrame:StripTextures()

    for i = 1, ARMORY_NUM_FACTIONS_DISPLAYED do
        local factionBar = _G["ArmoryReputationBar"..i]
        local factionHeader = _G["ArmoryReputationHeader"..i]
        local factionName = _G["ArmoryReputationBar"..i.."FactionName"]
        local factionWar = _G["ArmoryReputationBar"..i.."AtWarCheck"]

        factionBar:StripTextures()
        factionBar:CreateBackdrop("Default")
        factionBar:SetStatusBarTexture(c.media.normTex)
        factionBar:Size(108, 13)

        if i == 1 then
            factionBar:Point("TOPLEFT", 194, -80)
        end

        factionName:Width(140)
        factionName:Point("LEFT", factionBar, "LEFT", -150, 0)
        factionName.SetWidth = c.noop

        factionHeader:GetNormalTexture():Size(14)
        factionHeader:SetHighlightTexture(nil)
        factionHeader:Point("TOPLEFT", factionBar, "TOPLEFT", -175, 0)

        factionWar:StripTextures()
        factionWar:Point("LEFT", factionBar, "RIGHT", 0, 0)

        factionWar.Icon = factionWar:CreateTexture(nil, "OVERLAY")
        factionWar.Icon:Point("LEFT", 6, -8)
        factionWar.Icon:Size(32)
        factionWar.Icon:SetTexture("Interface\\Buttons\\UI-CheckBox-SwordCheck")
    end

	hooksecurefunc("ArmoryReputationFrame_Update", function()
		local numFactions = Armory:GetNumFactions()
		local factionIndex, factionHeader
		local factionOffset = FauxScrollFrame_GetOffset(ArmoryReputationListScrollFrame)

		for i = 1, ARMORY_NUM_FACTIONS_DISPLAYED, 1 do
			factionHeader = _G["ArmoryReputationHeader"..i]
			factionIndex = factionOffset + i
            if factionIndex <= numFactions then
                U.SkinPlusMinButton(factionHeader)
			end
		end
	end)

    ArmoryReputationListScrollFrame:StripTextures()
    ArmoryReputationListScrollFrame:Point("TOPRIGHT", -28, -75)
    U.SkinScrollBar(ArmoryReputationListScrollFrameScrollBar)

	ArmoryReputationDetailFrame:StripTextures()
	ArmoryReputationDetailFrame:SetTemplate("Transparent")
	ArmoryReputationDetailFrame:Point("TOPLEFT", ArmoryReputationFrame, "TOPRIGHT", 2, -12)

	U.SkinCloseButton(ArmoryReputationDetailCloseButton)
	ArmoryReputationDetailCloseButton:Point("TOPRIGHT", 2, 2)
end

local function SkinRaidInfo()
    ArmoryRaidInfoScrollFrame:StripTextures()
    ArmoryRaidInfoScrollFrame:Point("TOPRIGHT", -43, -24)
    ArmoryRaidInfoScrollFrame:SetWidth(290)
    U.SkinScrollBar(ArmoryRaidInfoScrollFrameScrollBar)

    for i = 1, ARMORY_MAX_RAID_INFOS do
        local instanceID = _G["ArmoryRaidInfoInstance"..i.."ID"]
        instanceID:SetWidth(66)
    end
end

local function SkinSkills()
    ArmorySkillFrame:StripTextures()

    for i = 1, ARMORY_NUM_SKILLS_DISPLAYED do
		local bar = _G["ArmorySkillRankFrame"..i]
		local label = _G["ArmorySkillTypeLabel"..i]
		local border = _G["ArmorySkillRankFrame"..i.."Border"]
		local background = _G["ArmorySkillRankFrame"..i.."Background"]

		bar:CreateBackdrop("Default")
        bar:SetStatusBarTexture(c.media.normTex)

		border:StripTextures()
		background:SetTexture(nil)

		label:GetNormalTexture():Size(14)
		label:SetHighlightTexture(nil)

        if i == 1 then
            label:Point("LEFT", ArmorySkillFrame, "TOPLEFT", 20, -87)
        end
	end

	hooksecurefunc("ArmorySkillFrame_SetStatusBar", function(statusBarID) U.SkinPlusMinButton(_G["ArmorySkillTypeLabel"..statusBarID]) end)

    ArmorySkillListScrollFrame:StripTextures()
    ArmorySkillListScrollFrame:Point("TOPRIGHT", -28, -75)
	U.SkinScrollBar(ArmorySkillListScrollFrameScrollBar)
end

local function SkinOther()
    for i = 1, ARMORY_MAX_OTHER_TABS do
        U.SkinTab(_G["ArmoryOtherFrameTab"..i])
    end
    ArmoryOtherFrameTab1:Point("TOPLEFT", 12, -49)
    SkinReputation()
    SkinRaidInfo()
    SkinSkills()
end

local function SetIconTexture(icon, ...)
    local arg1 = ...
    if type(arg1) == "string" and arg1 == "Interface\\Buttons\\UI-EmptySlot-Disabled" then
        icon:SetTexture(nil)
    else
        icon:SetTexture(...)
        icon:SetTexCoord(unpack(c.TexCoords))
    end
end

local function SkinInventoryButton(button)
    if button.inset then return end

    for i = 1, button:GetNumRegions() do
        local region = select(i, button:GetRegions())
        if region and region:GetObjectType() == "Texture" and region ~= button.searchOverlay and region ~= button.icon then
            region:SetTexture(nil)
        end
    end

    button.inset = CreateFrame("Button", nil, button)
    button.inset:SetInside()
    button.inset:SetTemplate("Default", true)
    button.inset:StyleButton()
    button.inset:SetScript("OnClick", function(self)
        local button = self:GetParent()
        button:GetScript("OnClick")(button)
    end)
    button.inset:SetScript("OnEnter", function(self)
        local button = self:GetParent()
        self.hover:Show()
        button:GetScript("OnEnter")(button)
    end)
    button.inset:SetScript("OnLeave", function(self)
        local button = self:GetParent()
        self.hover:Hide()
        button:GetScript("OnLeave")(button)
    end)

    button.inset.icon = button.inset:CreateTexture(nil, "BORDER")
    button.inset.icon:SetInside()
    SetIconTexture(button.inset.icon, button.icon:GetTexture())

    button.icon:Hide()
    button.icon.SetTexture = function(self, ...)
        local button = self:GetParent()
        SetIconTexture(button.inset.icon, ...)
    end

    if _G[button:GetName().."Count"] then
        _G[button:GetName().."Count"]:SetParent(button.inset)
    end
    button.searchOverlay:SetOutside(button.inset.icon)
    button.searchOverlay:SetParent(button.inset)

    if button.link then
        ColorItemBorder(button.inset, button.link)
    end
end

local function SkinInventory()
    U.SkinArmoryFrame(ArmoryInventoryFrame, true)

    ArmoryInventoryMoneyBackgroundFrame:StripTextures()
    ArmoryInventoryMoneyBackgroundFrame:SetWidth(150)
    ArmoryInventoryMoneyBackgroundFrame:ClearAllPoints()
    ArmoryInventoryMoneyBackgroundFrame:Point("TOPRIGHT", -8, -35)

    ArmoryInventoryFrameEditBox:ClearAllPoints()
    ArmoryInventoryFrameEditBox:Point("TOPLEFT", 8, -35)
    U.SkinSearchBox(ArmoryInventoryFrameEditBox, 150)

    ArmoryInventoryFilterDropDown:ClearAllPoints()
    ArmoryInventoryFilterDropDown:Point("TOPRIGHT", -3, -60)
    ArmoryInventoryFilterDropDownText:ClearAllPoints()
    ArmoryInventoryFilterDropDownText:Point("RIGHT", ArmoryInventoryFilterDropDown, "RIGHT", 0, 0)
    ArmoryDropDownMenu_JustifyText(ArmoryInventoryFilterDropDown, "RIGHT")
    hooksecurefunc("ArmoryItemFilter_InitializeDropDown", function(self) ArmoryDropDownMenu_JustifyText(self, "RIGHT") end)

    ArmoryInventoryExpandButtonFrame:StripTextures()
    ArmoryInventoryExpandButtonFrame:Point("TOPLEFT", 0, -60)
	ArmoryInventoryCollapseAllButton:GetNormalTexture():Size(15)

    hooksecurefunc("ArmoryInventoryFrame_Update", function() U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton) end)

    ArmoryInventoryFrameTab1:ClearAllPoints()
    ArmoryInventoryFrameTab1:Point("TOPLEFT", ArmoryInventoryFrame, "BOTTOMLEFT", 19, 2)
    U.SkinTab(ArmoryInventoryFrameTab1)
    U.SkinTab(ArmoryInventoryFrameTab2)

    ArmoryInventoryIconViewFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryIconViewFrame:Width(ArmoryInventoryIconViewFrame:GetWidth() + 1)
    ArmoryInventoryIconViewFrame:StripTextures()
    U.SkinScrollBar(ArmoryInventoryIconViewFrameScrollBar)
    U.SkinCheckBox(ArmoryInventoryIconViewFrameLayoutCheckButton)
    ArmoryInventoryIconViewFrameLayoutCheckButton:Point("TOPLEFT", ArmoryInventoryFrame, "TOPLEFT", 2, -2)

    hooksecurefunc("ArmoryInventoryIconViewFrame_ShowContainer", function(containerFrame)
        local containerName = containerFrame:GetName()
        local label = _G[containerName.."Label"]
        local buttonBaseName = containerName.."Item"
        if Armory:GetInventoryBagLayout() and label:GetID() == ARMORY_VOID_CONTAINER then
            buttonBaseName = containerName.."VoidItem"
        end

        local i = 1
        while _G[buttonBaseName..i] do
            SkinInventoryButton(_G[buttonBaseName..i])
            i = i + 1
        end

        U.SkinPlusMinButton(label)
    end)

    hooksecurefunc("ArmoryInventoryIconViewFrame_Update", function() U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton) end)

    ArmoryInventoryListViewFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryListViewFrame:SetWidth(297)
    ArmoryInventoryListViewScrollFrame:StripTextures()
    ArmoryInventoryListViewScrollFrame:SetWidth(297)
    U.SkinScrollBar(ArmoryInventoryListViewScrollFrameScrollBar)
    U.SkinCheckBox(ArmoryInventoryListViewFrameSearchAllCheckButton)
    ArmoryInventoryListViewFrameSearchAllCheckButton:Point("TOPLEFT", ArmoryInventoryFrame, "TOPLEFT", 2, -2)

    hooksecurefunc("ArmoryInventoryListViewFrame_Update", function()
        for i = 1, ARMORY_INVENTORY_LINES_DISPLAYED do
            local button = _G["ArmoryInventoryLine"..i]
            local isHeader = select(5, Armory:GetInventoryLineInfo(button:GetID()))
            if isHeader then
                U.SkinPlusMinButton(button)
            else
                U.SkinInventoryLine(button)
            end
        end
        U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton)
	end)

    hooksecurefunc(Armory, "SetItemLink", function(self, button, link)
        if button.searchOverlay and button.searchOverlay:IsVisible() then
            return
        elseif button.Icon and button.Icon.IsDesaturated and button.Icon:IsDesaturated() then
            return
        else
            ColorItemBorder(button.inset or button, link)
        end
    end)
end

local function SkinQuestInfoItem(item)
    item:StripTextures()
    item:SetTemplate("Default")
    item:StyleButton()
    item:Width(item:GetWidth() - 4)
    item.Icon:SetTexCoord(unpack(c.TexCoords))
    item.Icon:SetDrawLayer("OVERLAY")
    item.Icon:Point("TOPLEFT", 2, -2)
    item.Icon:Size(item.Icon:GetWidth() - 2, item.Icon:GetHeight() - 2)
    item.Count:SetDrawLayer("OVERLAY")
end

local function SkinQuests()
    U.SkinArmoryFrame(ArmoryQuestLogFrame, true)

    U.SkinSearchBox(ArmoryQuestLogFrameEditBox)
    ArmoryQuestLogFrameEditBox:ClearAllPoints()
    ArmoryQuestLogFrameEditBox:Point("TOPLEFT", 8, -35)

    ArmoryQuestLogExpandButtonFrame:Kill()

    ArmoryQuestLogTitle1:Point("TOPLEFT", 5, -58)

    ArmoryEmptyQuestLogFrame:StripTextures()

    ArmoryQuestLogListScrollFrame:SetTemplate()
    ArmoryQuestLogListScrollFrame:Width(298)
    ArmoryQuestLogListScrollFrame:Point("TOPLEFT", 8, -56)
    U.SkinScrollBar(ArmoryQuestLogListScrollFrameScrollBar)

    ArmoryQuestLogDetailScrollFrame:SetTemplate()
    ArmoryQuestLogDetailScrollFrame:Width(298)
    U.SkinScrollBar(ArmoryQuestLogDetailScrollFrameScrollBar)

    for i = 1, MAX_NUM_ITEMS do
        local questItem = _G["ArmoryQuestLogItem"..i]
        SkinQuestInfoItem(questItem)
    end

    ArmoryQuestLogCount:ClearAllPoints()
    ArmoryQuestLogCount:Point("BOTTOMRIGHT", ArmoryQuestLogListScrollFrame, "TOPRIGHT", 330, 0)

    hooksecurefunc("ArmoryQuestFrameItems_Update", function()
        local headers = {
            ArmoryQuestLogQuestTitle,
            ArmoryQuestLogDescriptionTitle,
            ArmoryQuestLogRewardTitleText,
            ArmoryQuestLogItemChooseText
        }

        for _, header in ipairs(headers) do
            header:SetTextColor(1, 0.80, 0.10)
        end

        local texts = {
            ArmoryQuestLogObjectivesText,
            ArmoryQuestLogSuggestedGroupNum,
            ArmoryQuestLogQuestDescription,
            ArmoryQuestLogItemChooseText,
            ArmoryQuestLogItemReceiveText,
            ArmoryQuestLogSpellLearnText,
            ArmoryQuestLogPlayerTitleText,
            ArmoryQuestLogTimerText
        }

        for _, text in ipairs(texts) do
            text:SetTextColor(1, 1, 1)
        end

        local requiredMoney = Armory:GetQuestLogRequiredMoney()
        if requiredMoney > 0 then
			if requiredMoney > Armory:GetMoney() then
				ArmoryQuestLogRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
			else
				ArmoryQuestLogRequiredMoneyText:SetTextColor(1, 0.80, 0.10)
			end
		end

        local numObjectives = Armory:GetNumQuestLeaderBoards()
		local _, objType, finished, objective
		local numVisibleObjectives = 0

		for i = 1, numObjectives do
			_, objType, finished = Armory:GetQuestLogLeaderBoard(i)
			if objType ~= "spell" then
				numVisibleObjectives = numVisibleObjectives + 1
				local objective = _G["ArmoryQuestLogObjective"..numVisibleObjectives]

				if objective then
					if finished then
						objective:SetTextColor(1, .8, .1)
					else
						objective:SetTextColor(.63, .09, .09)
					end
				end
			end
		end

        for i = 1, MAX_NUM_ITEMS do
            local questItem = _G["ArmoryQuestLogItem"..i]
            if not questItem:IsShown() then break end

            local point, relativeTo, relativePoint, x, y = questItem:GetPoint()
            if i == 1 then
                questItem:Point(point, relativeTo, relativePoint, 0, y)
            elseif relativePoint == "BOTTOMLEFT" then
                questItem:Point(point, relativeTo, relativePoint, 0, -4)
            elseif point then
                questItem:Point(point, relativeTo, relativePoint, 4, 0)
            end

            questItem.Name:SetTextColor(1, 1, 1)
        end
    end)

    for i = 1, ARMORY_QUESTS_DISPLAYED do
        local questLogTitle = _G["ArmoryQuestLogTitle"..i]

        questLogTitle:SetNormalTexture(c.Media.Textures.PlusButton)
		questLogTitle.SetNormalTexture = c.noop

		questLogTitle:GetNormalTexture():Size(15)
		questLogTitle:GetNormalTexture():Point("LEFT", 5, 0)

        hooksecurefunc(questLogTitle, "SetNormalTexture", function(self, texture)
            U.SkinPlusMinButton(self, texture)
		end)
    end
end

local function SkinSpellLineTab(tab)
    tab:StripTextures()
    tab:GetNormalTexture():SetTexCoord(unpack(c.TexCoords))
    tab:GetNormalTexture():SetInside()

    tab.pushed = true;
    CreateBackdrop(tab, "Default"):SetAllPoints()
    tab:StyleButton(true)
    tab:GetHighlightTexture().SetTexture = c.noop
    tab:GetCheckedTexture().SetTexture = c.noop

    local point, relativeTo, relativePoint, x, y = tab:GetPoint()
    tab:Point(point, relativeTo, relativePoint, 1, y)
end

local function SkinSpellBook()
    U.SkinArmoryFrame(ArmorySpellBookFrame, true)

    -- Replace tabs by standard ones
    PanelTemplates_SetNumTabs(ArmorySpellBookFrame, 3)
    for i = 1, 3 do
        local tab = CreateFrame("Button", "ArmorySpellBookFrameTab"..i, ArmorySpellBookFrame, "CharacterFrameTabButtonTemplate")
        tab:SetID(i)
        tab:StripTextures()
        U.SkinTab(tab)

        tab.oldtab = _G["ArmorySpellBookFrameTabButton"..i]
        tab.oldtab.newtab = tab
        tab.oldtab:Kill()
        tab.oldtab.Show = function(self) self.newtab:Show() end
        tab.oldtab.Hide = function(self) self.newtab:Hide() end
        tab.oldtab.SetText = function(self, value) self.newtab:SetText(value) end
        tab.oldtab.Disable = function(self) self.newtab:Disable() end
        tab.oldtab.Enable = function(self) self.newtab:Enable() end

        tab:SetScript("OnClick", function(self)
            PanelTemplates_SetTab(ArmorySpellBookFrame, self:GetID());
            ArmoryToggleSpellBook(self.oldtab.bookType)
        end)

        if i == 1 then
            tab:SetPoint("TOPLEFT", ArmorySpellBookFrame, "BOTTOMLEFT", 19, 2)
        else
            tab:SetPoint("LEFT", "ArmorySpellBookFrameTab"..(i-1), "RIGHT", -16, 0)
        end
     end

    ArmorySpellBookPageText:SetTextColor(1, 1, 1)
    ArmorySpellBookPageText:Point("BOTTOM", 0, 12)
    ArmorySpellBookPageText:SetParent(ArmorySpellBookSpellIconsFrame)

    ArmorySpellBookPrevPageButton:Size(24)
    ArmorySpellBookPrevPageButton:Point("BOTTOMRIGHT", ArmorySpellBookFrame, "BOTTOMRIGHT", -40, 12)
    U.SkinNextPrevButton(ArmorySpellBookPrevPageButton)

    ArmorySpellBookNextPageButton:Size(24)
    ArmorySpellBookNextPageButton:Point("TOPLEFT", ArmorySpellBookPrevPageButton, "TOPLEFT", 25, 0)
    U.SkinNextPrevButton(ArmorySpellBookNextPageButton)

    for i = 1, MAX_SKILLLINE_TABS do
        SkinSpellLineTab(_G["ArmorySpellBookSkillLineTab"..i])
    end

    ArmorySpellButton1:Point("TOPLEFT", 18, -18)
    for i = 1, SPELLS_PER_PAGE do
        local button = _G["ArmorySpellButton"..i]
        local icon = _G["ArmorySpellButton"..i.."IconTexture"]

        for i = 1, button:GetNumRegions() do
			local region = select(i, button:GetRegions())
			if region:GetObjectType() == "Texture" then
				if region:GetTexture() ~= "Interface\\Buttons\\ActionBarFlyoutButton" then
					region:SetTexture(nil)
				end
			end
		end

		button:CreateBackdrop("Default", true)
		button.backdrop:SetFrameLevel(button.backdrop:GetFrameLevel() - 1)

		button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)

		button.bg = CreateFrame("Frame", nil, button)
		button.bg:CreateBackdrop("Transparent", true)
		button.bg:Point("TOPLEFT", -6, 6)
		button.bg:Point("BOTTOMRIGHT", 112, -6)
		button.bg:Height(46)
		button.bg:SetFrameLevel(button.bg:GetFrameLevel() - 2)

		icon:SetTexCoord(unpack(c.TexCoords))
    end

    PointXY(ArmorySpellButton1, 16, -55)

	-- evens
	for i = 2, SPELLS_PER_PAGE, 2 do
		PointXY(_G["ArmorySpellButton"..i], 163, 0)
	end
	-- odds
	for i = 3, SPELLS_PER_PAGE, 2 do
		PointXY(_G["ArmorySpellButton"..i], 0, -20)
	end

    ArmorySpellBookPetInfoIcon:Kill()
    ArmorySpellBookPetInfoName:ClearAllPoints()
    ArmorySpellBookPetInfoName:Point("TOPLEFT", ArmorySpellBookFrame, "TOPLEFT", 12, -30)
    ArmorySpellBookPetInfoText:ClearAllPoints()
    ArmorySpellBookPetInfoText:Point("TOPRIGHT", ArmorySpellBookFrame, "TOPRIGHT", -12, -30)
end

local function SkinSocial()
    U.SkinArmoryFrame(ArmorySocialFrame, true)

    for i = 1, ARMORY_SOCIAL_TABS do
        U.SkinTab(_G["ArmorySocialFrameTab"..i])
    end

    local frames = {
        "ArmoryFriendsListScrollFrame",
        "ArmoryIgnoreListScrollFrame"
    }

    for i, frame in ipairs(frames) do
        _G[frame]:Height(342)
        _G[frame]:Point("TOPRIGHT", -33, -75)
        _G[frame]:StripTextures()
        U.SkinScrollBar(_G[frame.."ScrollBar"])
    end

    local buttons = {
        ArmoryFriendsListButton = ARMORY_FRIENDS_TO_DISPLAY,
        ArmoryIgnoreListButton = ARMORY_IGNORES_TO_DISPLAY
    }

    for button, num in pairs(buttons) do
        for i = 1, num do
            _G[button..i]:SetHighlightTexture(nil)
            if i == 1 then
                _G[button..i]:Point("TOPLEFT", 2, -76)
            end
        end
    end
end

local function SkinRecipeList(self, _, tradeSkillInfo)
    if tradeSkillInfo.type == "header" then
        U.SkinPlusMinButton(self)
    end
	if tradeSkillInfo.hasProgressBar then
        U.SkinStatusBar(self.SubSkillRankBar)
	end
end

local function SkinTradeSkill()
    U.SkinArmoryFrame(ArmoryTradeSkillFrame, true)

    ArmoryTradeSkillFrame:StripTextures(true)
    ArmoryTradeSkillFrame:CreateBackdrop("Transparent")

    ArmoryTradeSkillFrame.RecipeList:StripTextures()
    ArmoryTradeSkillFrame.DetailsFrame:StripTextures()
    ArmoryTradeSkillFrame.DetailsFrame:Point("TOPLEFT", 8, -222)
    ArmoryTradeSkillFrame.ExpandButtonFrame:StripTextures()
    ArmoryTradeSkillFrame.ExpandButtonFrame:Point("TOPLEFT", 3, -59)
    ArmoryTradeSkillFrame.DetailsFrame.Contents:StripTextures()

    ArmoryTradeSkillFrame.RankFrame.Border:StripTextures()
    ArmoryTradeSkillFrame.RankFrame:ClearAllPoints()
    ArmoryTradeSkillFrame.RankFrame:Point("BOTTOMRIGHT", ArmoryTradeSkillFrame, "TOPRIGHT", -10, -45)
    ArmoryTradeSkillFrame.RankFrame:Width(180)
    ArmoryTradeSkillFrame.RankFrame.SkillRank:ClearAllPoints()
    ArmoryTradeSkillFrame.RankFrame.SkillRank:Point("TOP", ArmoryTradeSkillFrame.RankFrame, "TOP", 0, -2)
    U.SkinStatusBar(ArmoryTradeSkillFrame.RankFrame)

    U.SkinButton(ArmoryTradeSkillFrame.FilterButton)
    ArmoryTradeSkillFrame.FilterButton:SetPoint("TOPRIGHT", ArmoryTradeSkillFrame.RankFrame, "BOTTOMRIGHT", 0, -12)

    U.SkinScrollBar(ArmoryTradeSkillFrame.RecipeList.ScrollBar)
    U.SkinScrollBar(ArmoryTradeSkillFrame.DetailsFrame.ScrollBar)

    U.SkinSearchBox(ArmoryTradeSkillFrameEditBox)
    ArmoryTradeSkillFrameEditBox:ClearAllPoints()
    ArmoryTradeSkillFrameEditBox:Point("TOPLEFT", 8, -30)

    hooksecurefunc(ArmoryTradeSkillFrame.RecipeList, "UpdateLayout", function()
        local point, relativeTo, relativePoint, x, y

        point, relativeTo, relativePoint, x, y = ArmoryTradeSkillFrame.RecipeList:GetPoint()
        ArmoryTradeSkillFrame.RecipeList:Point(point, relativeTo, relativePoint, x + 33, y + 10)

        point, relativeTo, relativePoint, x, y = ArmoryTradeSkillFrame.RecipeList.FilterBar:GetPoint()
        ArmoryTradeSkillFrame.RecipeList.FilterBar:ClearAllPoints()
        ArmoryTradeSkillFrame.RecipeList.FilterBar:Point(point, relativeTo, relativePoint, x - 11, y + 10)

        point, relativeTo, relativePoint, x, y = ArmoryTradeSkillFrame.RecipeList.ScrollBar:GetPoint()
        ArmoryTradeSkillFrame.RecipeList.ScrollBar:Point(point, relativeTo, relativePoint, 2, y)
    end)

    hooksecurefunc(ArmoryTradeSkillFrame.RecipeList, "Refresh", function()
		for _, tradeSkillButton in ipairs(ArmoryTradeSkillFrame.RecipeList.buttons) do
			if not tradeSkillButton.headerIsHooked then
                hooksecurefunc(tradeSkillButton, "SetUpHeader", SkinRecipeList)
				tradeSkillButton.headerIsHooked = true
            end
		end
	end)

    hooksecurefunc(ArmoryTradeSkillFrame.DetailsFrame, "RefreshDisplay", function()
        local ResultIcon = ArmoryTradeSkillFrame.DetailsFrame.Contents.ResultIcon
        ResultIcon:StyleButton()
        if ResultIcon:GetNormalTexture() then
            ResultIcon:GetNormalTexture():SetTexCoord(unpack(c.TexCoords))
            ResultIcon:GetNormalTexture():SetInside()
        end
        ResultIcon:SetTemplate("Default")
		ResultIcon.IconBorder:SetTexture(nil)
		ResultIcon.ResultBorder:SetTexture(nil)

        for i = 1, #ArmoryTradeSkillFrame.DetailsFrame.Contents.Reagents do
            local Button = ArmoryTradeSkillFrame.DetailsFrame.Contents.Reagents[i]
            local Icon = Button.Icon
            local Count = Button.Count

            Icon:SetTexCoord(unpack(c.TexCoords))
            Icon:SetDrawLayer("OVERLAY")
            if not Icon.backdrop then
                Icon.backdrop = CreateFrame("Frame", nil, Button)
                Icon.backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
                Icon.backdrop:SetTemplate("Default")
                Icon.backdrop:SetOutside(Icon)
            end

            Icon:SetParent(Icon.backdrop)
            Count:SetParent(Icon.backdrop)
            Count:SetDrawLayer("OVERLAY")

            Button.NameFrame:Kill()

            ColorItemBorder(Icon.backdrop, Armory:GetTradeSkillReagentItemLink(ArmoryTradeSkillFrame.DetailsFrame.selectedRecipe, i))
        end
    end)

    PointXY(ArmoryTradeSkillFrame.ExpandButtonFrame.CollapseAllButton, 1)
    hooksecurefunc(ArmoryTradeSkillFrame, "RefreshExpandButtonFrame", function(numTradeSkills)
        U.SkinPlusMinButton(ArmoryTradeSkillFrame.ExpandButtonFrame.CollapseAllButton)
    end)
end

local function SkinFind()
    U.SkinArmoryFrame(ArmoryFindFrame)

    U.SkinEditBox(ArmoryFindFrameEditBox)
    ArmoryFindFrameEditBox:Height(ArmoryFindFrameEditBox:GetHeight() - 3)
    ArmoryFindFrameEditBox:Point("TOPLEFT", 8, -33)

    U.SkinDropDownBox(ArmoryFindTypeDropDown)
    ArmoryFindTypeDropDown:ClearAllPoints()
    ArmoryFindTypeDropDown:Point("TOPRIGHT", ArmoryFindFrame, "TOPRIGHT", -3, -29)

    ArmoryFindFrameScrollFrame:StripTextures()
    U.SkinScrollBar(ArmoryFindFrameScrollFrameScrollBar)
    ArmoryFindFrameScrollFrame:Point("TOPRIGHT", -33, -84)
    ArmoryFindFrameScrollFrame:Height(206)

    ArmoryFindFrameColumnHeader1:Point("TOPLEFT", 6, -58)
    WhoFrameColumn_SetWidth(ArmoryFindFrameColumnHeader2, 84)
    for i = 1, 3 do
        _G["ArmoryFindFrameColumnHeader"..i]:StripTextures()
    end

    for i = 1, ARMORY_FIND_LINES_DISPLAYED do
        _G["ArmoryFindFrameButton"..i]:SetHighlightTexture(nil)
    end

    ArmoryFindFrameButton1:Point("TOPLEFT", 3, -83)
    ArmoryFindFrameTotals:Point("BOTTOM", 0, 110)

    local detailBackdrop = CreateFrame("Frame", nil, ArmoryFindFrame)
    detailBackdrop:SetTemplate("Transparent")
    detailBackdrop:Point("TOPLEFT", ArmoryFindFrame, "TOPLEFT", 10, -298)
    detailBackdrop:Point("BOTTOMRIGHT", ArmoryFindFrame, "BOTTOMRIGHT", -10, 40)
    detailBackdrop:SetFrameLevel(ArmoryFindFrame:GetFrameLevel() - 1)

    ArmoryFindFrameDetailWho:ClearAllPoints()
    ArmoryFindFrameDetailWho:Point("TOPLEFT", detailBackdrop, "TOPLEFT", 6, -30)

    U.SkinButton(ArmoryFindButton)
    ArmoryFindButton:Point("BOTTOMLEFT", 15, 8)
    ArmoryFindButton:Width(ArmoryFindButton:GetWidth() - 8)

    U.SkinCheckBox(ArmoryFindFrameSearchGlobalCheckButton)
    U.SkinCheckBox(ArmoryFindFrameSearchExtendedCheckButton)
    ArmoryFindFrameSearchGlobalCheckButton:Point("BOTTOMLEFT", 144, 8)
    ArmoryFindFrameSearchExtendedCheckButton:Point("BOTTOMLEFT", 246, 8)
end

local function SkinLookup()
    U.SkinArmoryFrame(ArmoryLookupFrame)

    ArmoryLookupMessageFrame:Point("TOP", 0, -120)

    U.SkinEditBox(ArmoryLookupFrameEditBox)
    ArmoryLookupFrameEditBox:Height(ArmoryLookupFrameEditBox:GetHeight() - 2)
    ArmoryLookupFrameEditBox:Point("TOPLEFT", 8, -33)

    U.SkinDropDownBox(ArmoryLookupTypeDropDown)
    ArmoryLookupTypeDropDown:ClearAllPoints()
    ArmoryLookupTypeDropDown:Point("TOPRIGHT", -3, -29)

    U.SkinDropDownBox(ArmoryLookupTradeSkillDropDown)
    ArmoryLookupTradeSkillDropDown:ClearAllPoints()
    ArmoryLookupTradeSkillDropDown:Point("TOPRIGHT", ArmoryLookupTypeDropDown, "BOTTOMRIGHT", 0, 8)

    U.SkinDropDownBox(ArmoryLookupQuestDropDown)
    ArmoryLookupQuestDropDown:ClearAllPoints()
    ArmoryLookupQuestDropDown:Point("TOPRIGHT", ArmoryLookupTypeDropDown, "BOTTOMRIGHT", 0, 8)

    U.SkinCheckBox(ArmoryLookupFrameSearchExactCheckButton)
    ArmoryLookupFrameSearchExactCheckButton:ClearAllPoints()
    ArmoryLookupFrameSearchExactCheckButton:Point("RIGHT", ArmoryLookupFrameEditBox, "BOTTOMRIGHT", -20, -20)

    ArmoryLookupExpandButtonFrame:StripTextures()
    ArmoryLookupExpandButtonFrame:Point("TOPLEFT", 0, -60)
	ArmoryLookupExpandAllButton:GetNormalTexture():Size(15)
    hooksecurefunc("ArmoryLookupFrame_Update", function() U.SkinPlusMinButton(ArmoryLookupExpandAllButton) end)

    U.SkinButton(ArmoryLookupButton)
    ArmoryLookupButton:ClearAllPoints()
    ArmoryLookupButton:Point("BOTTOMRIGHT", -18, 8)

    U.SkinDropDownBox(ArmoryLookupChannelDropDown, 130)
    ArmoryLookupChannelDropDown:ClearAllPoints()
    ArmoryLookupChannelDropDown:Point("RIGHT", ArmoryLookupButton, "LEFT", 0, -3)

    ArmoryLookupFrameTargetText:Point("BOTTOMLEFT", 8, 15)

    ArmoryLookupLine1:Point("TOPLEFT", 8, -83)
    for i = 1, ARMORY_LOOKUP_LINES_DISPLAYED do
        local line = _G["ArmoryLookupLine"..i]

        line:SetNormalTexture(c.Media.Textures.PlusButton)
		line.SetNormalTexture = c.noop

        hooksecurefunc(line, "SetNormalTexture", function(self, texture)
            U.SkinPlusMinButton(self, texture)
		end)
    end

    ArmoryLookupScrollFrame:StripTextures()
    U.SkinScrollBar(ArmoryLookupScrollFrameScrollBar)
    ArmoryLookupScrollFrame:Point("TOPLEFT", 8, -83)
    ArmoryLookupScrollFrame:Height(305)
end

local function SkinQTips()
    hooksecurefunc(Armory.qtip, "Acquire", function(self, name)
        if name:sub(1, 6) == "Armory" then
            for key, tooltip in Armory.qtip:IterateTooltips() do
                if key == name then
                    tooltip:SetScript("OnShow", function(self)
                        self:SetTemplate("Transparent")
                        if self.slider then
                            U.SkinSliderFrame(self.slider)
                        end
                    end)
                    hooksecurefunc(tooltip, "SetCell", function(self, index, column, value, provider)
                        if self.inhook then return end
                        self.inhook = true
                        if provider and type(value) == "string" then
                            if strfind(value, "MinusButton") then
                                tooltip:SetCell(index, column, c.Media.Textures.MinusButton, provider)
                            elseif strfind(value, "PlusButton") then
                                tooltip:SetCell(index, column, c.Media.Textures.PlusButton, provider)
                            end
                        end
                        self.inhook = false
                    end)
                    break
                end
            end
        end
    end)
end

Armory:Execute(function()
    SkinMisc()
    SkinOptions()
    SkinTooltips()
    --SkinMinimapButton()
    SkinArmoryFrame()
    SkinBuffs()
    SkinPaperDoll()
    SkinPets()
    SkinTalents()
    SkinPVP()
    SkinOther()
    SkinInventory()
    SkinQuests()
    SkinSpellBook()
    SkinSocial()
    SkinTradeSkill()
    SkinFind()
    SkinLookup()
    SkinQTips()
end)
