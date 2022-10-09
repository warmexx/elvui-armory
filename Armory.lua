if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

local U = select(2, ...)
local s = U.s
local c = U.c

local hideParchment = c.private.skins.parchmentRemoverEnable

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
        if U.IsRetail then
            _G[skin]:StripTextures()
            _G[skin]:CreateBackdrop("Transparent")
        else
            _G[skin]:SetTemplate("Transparent")
        end
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
    if U.IsRetail or U.IsWrath then
        table.insert(checkBoxes, "ArmoryOptionsModulePanelAchievements")
        table.insert(checkBoxes, "ArmoryOptionsModulePanelStatistics")

        table.insert(checkBoxes, "ArmoryOptionsTooltipPanelShowGems")
    end
    if U.IsRetail then
        table.insert(checkBoxes, "ArmoryOptionsModulePanelCurrency")
        table.insert(checkBoxes, "ArmoryOptionsModulePanelArtifacts")

        table.insert(checkBoxes, "ArmoryOptionsSharePanelShareGuild")

        table.insert(checkBoxes, "ArmoryOptionsTooltipPanelShowSecondarySkillRank")
        table.insert(checkBoxes, "ArmoryOptionsTooltipPanelShowGearSets")

        table.insert(checkBoxes, "ArmoryOptionsSummaryPanelItemLevel")
        table.insert(checkBoxes, "ArmoryOptionsSummaryPanelBags")
        table.insert(checkBoxes, "ArmoryOptionsSummaryPanelCurrency")
        table.insert(checkBoxes, "ArmoryOptionsSummaryPanelEvents")

        table.insert(checkBoxes, "ArmoryOptionsMiscPanelCooldownEvents")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelCheckCooldowns")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelEventWarnings")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelUseEventLocalTime")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelOverlay")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelMaziel")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelCollapse")
        table.insert(checkBoxes, "ArmoryOptionsMiscPanelCheckButton")
    else
        table.insert(checkBoxes, "ArmoryOptionsModulePanelSkills")
    end
    local sliders = {
        "ArmoryOptionsPanelScaleSlider",
        "ArmoryOptionsMinimapPanelAngleSlider",
        "ArmoryOptionsExpirationPanelExpDaysSlider",
        "ArmoryOptionsSummaryPanelDelaySlider",
    }
    local dropDownBoxes = {
        "ArmoryOptionsFindPanelDefaultSearchTypeDropDown",
        "ArmoryOptionsMiscPanelWarningSoundDropDown",
    }
    if not U.IsRetail then
        table.insert(dropDownBoxes, "ArmoryOptionsPanelWeeklyResetDropDown")
    end
    local swatches = {
        "ArmoryOptionsTooltipPanelShowItemCount",
        "ArmoryOptionsTooltipPanelShowItemCountTotals",
        "ArmoryOptionsTooltipPanelShowKnownBy",
        "ArmoryOptionsTooltipPanelShowHasSkill",
        "ArmoryOptionsTooltipPanelShowCanLearn",
        "ArmoryOptionsTooltipPanelShowCrafters",
    }
    if U.IsRetail or U.IsWrath then
        table.insert(swatches, "ArmoryOptionsTooltipPanelShowAchievements")
        table.insert(swatches, "ArmoryOptionsTooltipPanelAchievementProgressColor")
    end
    if U.IsRetail then
        table.insert(swatches, "ArmoryOptionsTooltipPanelShowSkillRank")
        table.insert(swatches, "ArmoryOptionsTooltipPanelShowQuestAlts")
    end
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

    if U.IsRetail then
        local currencyFrame = "ArmoryOptionsSummaryPanelCurrencyContainer"
        for i = 1, ARMORY_SUMMARY_CURRENCIES_DISPLAYED do
            U.SkinCheckBox(_G[currencyFrame.."Button"..i])
        end
        U.SkinScrollBar(_G[currencyFrame.."ScrollFrame"].ScrollBar)
    end
end

local function SkinTooltips()
    local tooltips = {
        ArmoryComparisonTooltip1,
        ArmoryComparisonTooltip2,
    }

    if U.IsRetail then
        table.insert(tooltips, ArmoryConquestTooltip)
        for _, tt in ipairs(tooltips) do
            U.SkinTooltip(tt)
        end
        return
    end

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

local function SkinStatFrame(suffix)
    local frame = _G["ArmoryAttributes"..suffix.."Frame"]
    local scrollBar = _G["ArmoryAttributes"..suffix.."FrameScrollFrameScrollBar"]
    frame:StripTextures()
    frame:SetWidth(frame:GetWidth() + 6)

    scrollBar:CreateBackdrop()
    U.SkinSliderFrame(scrollBar)
    scrollBar:SetTemplate("Default")
    scrollBar:SetScript("OnShow", function(self)
        self:Point("TOPRIGHT", frame, "TOPRIGHT", -3, -2)
        self:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -3, 2)
    end)
end

local function SkinStatDropDown(suffix)
    local frame = _G["ArmoryAttributes"..suffix.."FramePlayerStatDropDown"]
    local y, width
    if suffix == "OverlayTop" then
        y = -5
        width = 229
    else
        y = -10
        width = 263
    end
    U.SkinDropDownBox(frame, width)
    frame:Point("BOTTOMLEFT", "ArmoryAttributes"..suffix.."FrameTop", "TOPLEFT", -21, y)
    ArmoryDropDownList1:CreateBackdrop("Transparent")
    SkinStatFrame(suffix)
end

local function SkinPaperDollTalent(suffix)
    local frame = _G["ArmoryPaperDollTalent"..(suffix or "")]
    local point, relativeTo, relativePoint, x, y = frame:GetPoint()
    U.SkinFrame(frame)
    if U.IsRetail then frame:SetHeight(frame:GetHeight() - 8) end
    frame:Point("TOPLEFT", 51, -62)
end

local function SkinPaperDollSkills(suffix)
    local skillFrame = "ArmoryPaperDollTradeSkill"..(suffix or "")
    local talentFrame = "ArmoryPaperDollTalent"..(suffix or "")
    local frame =  _G[skillFrame]
    local skill1 = _G[skillFrame.."Frame1"]
    local skill2 = _G[skillFrame.."Frame2"]

    if U.IsRetail then
        U.SkinFrame(frame)
        frame:SetHeight(frame:GetHeight() + 8)
        frame:Point("TOPLEFT", talentFrame, "BOTTOMLEFT", 0, -3)
    else
        SkinInsetFrame(frame, talentFrame)
    end

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
    if U.IsBCC or U.IsWrath then
        ArmoryAttributesFrame:Point("TOPLEFT", 52, -289)

        U.SkinDropDownBox(ArmoryPlayerStatFrameLeftDropDown, 142)
        U.SkinDropDownBox(ArmoryPlayerStatFrameRightDropDown, 142)
        ArmoryPlayerStatLeftTop:Point("TOPLEFT", -4, 0)
        ArmoryPlayerStatRightTop:Point("TOPLEFT", ArmoryPlayerStatLeftTop, "TOPRIGHT", 3, 0)
    end
end

local ResistanceCoords = {
    [1] = { 0.21875, 0.8125, 0.25, 0.32421875 },        --Arcane
    [2] = { 0.21875, 0.8125, 0.0234375, 0.09765625 },    --Fire
    [3] = { 0.21875, 0.8125, 0.13671875, 0.2109375 },    --Nature
    [4] = { 0.21875, 0.8125, 0.36328125, 0.4375},        --Frost
    [5] = { 0.21875, 0.8125, 0.4765625, 0.55078125},    --Shadow
}

local function SkinResistances(frameName)
    for i = 1, 5 do
        local frame, icon, text = _G[frameName..i], _G[frameName..i]:GetRegions()
        local point, relativeTo, relativePoint, x, y = frame:GetPoint()
        frame:Size(26)
        frame:SetTemplate("Default")

        frame:ClearAllPoints()
        if U.IsWrath and frameName == "ArmoryPetMagicResFrame" then
            frame:Point(point, relativeTo, relativePoint, -5, 0)
        elseif i == 1  then
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

local function SkinSockets(suffix)
    local name = "ArmorySockets"..suffix.."Frame"
    local sockets = {
        "Meta",
        "Blue",
        "Yellow",
        "Red",
        "Other"
    }
    for i = 1, #sockets do
        local icon = _G[name..sockets[i]]
        if i == 1 then
            icon:Point("TOP", 3, 0)
        end

        CreateBackdrop(icon, "Default"):SetAllPoints()
    end
end

local function SkinPaperDollInset(suffix)
    suffix = suffix or ""

    SkinPaperDollTalent(suffix)
    SkinPaperDollSkills(suffix)
    if U.IsRetail then
        SkinSockets(suffix)

        if suffix == "Overlay" then
            SkinStatDropDown(suffix.."Top")
            SkinStatDropDown(suffix.."Bottom")
        else
            SkinStatDropDown(suffix)
        end
    else
        SkinPaperDollHealth()
        SkinPaperDollStats()
        SkinResistances("ArmoryMagicResFrame")
    end
end

local function SkinOverlay()
    U.SkinCheckBox(ArmoryPaperDollOverlayFrameCheckButton)
    ArmoryPaperDollOverlayFrameCheckButton:Point("BOTTOMLEFT", 3, -1)
    SkinPaperDollInset("Overlay")
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
        if U.IsRetail then
            button:CreateBackdrop("Default", true)
        else
            button:SetTemplate("Default", true)
        end
        button:StyleButton()
        icon:SetTexCoord(unpack(c.TexCoords))
        icon:SetInside()

        if not U.IsRetail and i == 1 then
            button:Point("TOPLEFT", ArmoryFrame, "TOPRIGHT", 2, -45)
        elseif not U.IsRetail or i > 1 then
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

local function SkinGearSet()
    local button = ArmoryGearSetToggleButton
    button.Icon = button:GetNormalTexture()
    button.Highlight = button:GetHighlightTexture()

    button:SetSize(26, 28)
    button:StyleButton()
    button:SetPushedTexture(nil)

    button.Icon:SetTexture("Interface\\PaperDollInfoFrame\\PaperDollSidebarTabs")
    button.Icon:SetTexCoord(0.01562500, 0.53125000, 0.46875000, 0.60546875)
    button.Icon:Point("BOTTOM", 1, -2)

    button.Highlight:Point("TOPLEFT", 3, -4)
    button.Highlight:Point("BOTTOMRIGHT", -1, 0)

    button.Hider = button:CreateTexture(nil, "OVERLAY")
    button.Hider:SetTexture(0.4, 0.4, 0.4, 0.4)
    button.Hider:Point("TOPLEFT", 3, -4)
    button.Hider:Point("BOTTOMRIGHT", -1, 0)

    local backdrop = CreateBackdrop(button, "Default")
    backdrop:Point("TOPLEFT", 1, -2)
    backdrop:Point("BOTTOMRIGHT", 1, -2)

    ArmoryGearSetFrame:HookScript("OnShow", function()
        button.Hider:Hide()
        button.Highlight:Hide()
    end)

    ArmoryGearSetFrame:HookScript("OnHide", function()
        button.Hider:Show()
        button.Highlight:Show()
    end)

    U.SkinCloseButton(ArmoryGearSetFrameClose)
    U.SkinButton(ArmoryGearSetFrameEquipSet)
    U.SkinFrame(ArmoryGearSetFrame)

    ArmoryGearSetFrame:Point("TOPLEFT", ArmoryPaperDollFrame, "TOPRIGHT", 4, 0)
    ArmoryGearSetFrameEquipSet:Width(ArmoryGearSetFrameEquipSet:GetWidth() - 8)

    for i = 1, MAX_EQUIPMENT_SETS_PER_PLAYER do
        local button = _G["ArmoryGearSetButton"..i]

        if button then
            local icon = button.icon

            button:StripTextures()
            button:StyleButton(true)
            CreateBackdrop(button, "Default"):SetAllPoints()

            icon:SetTexCoord(unpack(c.TexCoords))
            icon:SetInside()
        end
    end
end

local function SkinPaperDoll()
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
    }
    if not U.IsRetail then
        table.insert(slots, "RangedSlot")
        ArmoryPaperDollFrame:StripTextures()
    end

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
            if U.IsRetail then
                button:CreateBackdrop("Default", true)
            else
                button:SetTemplate("Default", true)
            end
            button.icon:SetTexCoord(unpack(c.TexCoords))
            button.icon:SetInside()

            ColorItemBorder(button, button.link)
            i = i + 1
        end
    end)

    SkinPaperDollInset()
end

local function SkinTalents(frameName)
    ArmoryTalentFrame:StripTextures()

    if U.IsRetail then
        ArmoryTalentFrame.bg:StripTextures()

        local numSpecs = Armory:GetNumSpecializations()
        for i = 1, numSpecs do
            local button = ArmoryTalentFrame["specTab"..i]
            local icon = button:GetNormalTexture()
            button:StripTextures()
            icon:SetTexCoord(unpack(c.TexCoords))
        end

        local specFrame = ArmoryTalentFrame.Spec

        specFrame:CreateBackdrop()
        specFrame.backdrop:Point("TOPLEFT", 8, -18)
        specFrame.backdrop:Point("BOTTOMRIGHT", 30, 18)
        specFrame.specIcon:Size(50, 50)
        specFrame.specIcon:Point("LEFT", Button, "LEFT", 15, 0)
        specFrame.specIcon:SetDrawLayer("ARTWORK", 2)
        specFrame.roleIcon:SetDrawLayer("ARTWORK", 2)
        specFrame.ring:SetAlpha(0)
        U.SkinIcon(specFrame.specIcon, true)

        for tier = 1, MAX_TALENT_TIERS do
            for column = 1, NUM_TALENT_COLUMNS do
                local button = ArmoryTalentFrame.Talents["tier"..tier]["talent"..column]
                button:StripTextures()
                button.icon:SetTexCoord(unpack(c.TexCoords))
                button.border:SetOutside(button.icon)
                button.border:SetColorTexture(1, 1, 1)
                button.border:SetDrawLayer("BACKGROUND", -1)
            end
        end
    else
        frameName = frameName or "ArmoryTalentFrame"
        if frameName == "ArmoryTalentFrame" then
            for i=1, (ARMORY_MAX_TALENT_TABS or MAX_TALENT_TABS) do
                U.SkinTab(_G["ArmoryTalentFrameTab"..i])
            end
            ArmoryTalentFrameTab1:Point("TOPLEFT", 12, -49)
        end

        local scrollFrame = _G[frameName.."ScrollFrame"]
        local scrollBar = _G[frameName.."ScrollFrameScrollBar"]

        scrollFrame:StripTextures()
        scrollFrame:CreateBackdrop("Default")

        U.SkinScrollBar(scrollBar)
        scrollBar:Point("TOPLEFT", scrollFrame, "TOPRIGHT", 10, -16)

        if U.IsBCC then
            ArmoryTalentFrameTalentPointsText:Point("BOTTOMRIGHT", ArmoryTalentFrame, "BOTTOMLEFT", 220, 84)
        elseif U.IsWrath then
            if frameName == "ArmoryTalentFrame" then
                ArmoryTalentFramePointsBar:StripTextures()
                ArmoryTalentFrameSpentPointsText:Point("LEFT", ArmoryTalentFramePointsBar, "LEFT", 12, -5)
                ArmoryTalentFrameTalentPointsText:Point("RIGHT", ArmoryTalentFramePointsBar, "RIGHT", -12, -5)
            else
                scrollFrame:Point("TOPRIGHT", -65, -81)
                scrollFrame:Height(250)

                ArmoryPetTalentFrameBackgroundTopLeft:Point("TOPLEFT", 23, -81)
                ArmoryPetTalentFrameBackgroundTopLeft:Height(200)
                ArmoryPetTalentFrameBackgroundTopRight:Height(200)
                ArmoryPetTalentFrameBackgroundBottomLeft:Height(90)
                ArmoryPetTalentFrameBackgroundBottomRight:Height(90)
            end
        end

        for i = 1, (ARMORY_MAX_NUM_TALENTS or MAX_NUM_TALENTS) do
            local talent = _G[frameName.."Talent"..i]
            local icon = _G[frameName.."Talent"..i.."IconTexture"]

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
end

local function SkinPets()
    if U.IsRetail then
        ArmoryPetFramePetInfo:Point("TOPLEFT", 20, -40)
        ArmoryPetFrameSelectedPetIcon:Size(36, 36)
        ArmoryPetFrameSelectedPetIcon:SetTexCoord(unpack(c.TexCoords))
        ArmoryPetFrameIconBorder:Kill()
        CreateBackdrop(ArmoryPetFramePetInfo, "Default", true):SetOutside(ArmoryPetFrameSelectedPetIcon)

        ArmoryPetFrameDiet:Point("TOPRIGHT", 63, -2)
        ArmoryPetFrameTypeText:Point("BOTTOMRIGHT", 60, 2)
        for i = 1, 7 do
            _G["ArmoryPetStatsPaneCategory"..i]:StripTextures()
        end

        ArmoryPetFramePrevPageButton:SetNormalTexture(nil)
        ArmoryPetFramePrevPageButton:SetPushedTexture(nil)
        ArmoryPetFramePrevPageButton:SetDisabledTexture(nil)
        SquareButton_SetIcon(ArmoryPetFramePrevPageButton, "LEFT")
        ArmoryPetFrameNextPageButton:SetNormalTexture(nil)
        ArmoryPetFrameNextPageButton:SetPushedTexture(nil)
        ArmoryPetFrameNextPageButton:SetDisabledTexture(nil)
        SquareButton_SetIcon(ArmoryPetFrameNextPageButton, "RIGHT")

        ArmoryPetSpecFrame.ring:Hide()
        local backdrop = CreateBackdrop(ArmoryPetSpecFrame, "Default")
        backdrop:SetOutside(ArmoryPetSpecFrame.specIcon)
        ArmoryPetSpecFrame.specIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        ArmoryPetSpecFrame.specIcon:SetParent(backdrop)

        for i = 1, ARMORY_NUM_PET_ABILITIES do
            local button = _G["ArmoryPetAbility"..i]
            button:StripTextures()
            CreateBackdrop(button, "Default"):SetOutside(button.Icon)
            button.icon:SetDrawLayer("ARTWORK")
            button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        end
    else
        ArmoryPetFrame:StripTextures()

        ArmoryPetFrame.TitleText:Kill()
        ArmoryPetFrame.TitleText:Point("LEFT", 20)

        ArmoryPetAttributesFrame:StripTextures()
        SkinResistances("ArmoryPetMagicResFrame")

        if U.IsWrath then
            U.SkinTab(ArmoryPetFrameTab1)
            U.SkinTab(ArmoryPetFrameTab2)
            ArmoryPetFrameTab1:Point("TOPLEFT", 12, -55)

            SkinTalents("ArmoryPetTalentFrame")
        end
    end

    for i = 1, ARMORY_NUM_PET_SLOTS do
        local icon = _G["ArmoryPetFramePet"..i.."IconTexture"]
        local slot = _G["ArmoryPetFramePet"..i]
        slot:StripTextures()
        slot:StyleButton(false)
        if U.IsRetail then
            slot:CreateBackdrop("Default", true)
        else
            slot:SetTemplate("Default", true)
        end
        icon:SetTexCoord(unpack(c.TexCoords))
        icon:SetInside()
    end
end

local function SkinGlyphs()
    ArmoryGlyphFrame:StripTextures()

    ArmoryGlyphFrameBackground:Size(334, 385)
	ArmoryGlyphFrameBackground:Point("TOPLEFT", 2, -36)
	ArmoryGlyphFrameBackground:SetTexture("Interface\\Spellbook\\UI-GlyphFrame")
	ArmoryGlyphFrameBackground:SetTexCoord(0.041015625, 0.65625, 0.140625, 0.8046875)

    ArmoryGlyphFrameTitleText:Point("TOP", -22, -3)
    ArmoryGlyphFrameTitleText:SetTextColor(1, 1, 1)

    ArmoryGlyphFrame:HookScript("OnShow", function()
        ArmorySpellBookTitleText:Hide()
    end)
    ArmoryGlyphFrame:HookScript("OnHide", function()
        ArmorySpellBookTitleText:Show()
    end)
end

local function SkinPVP()
    ArmoryPVPFrame:StripTextures(true)

    if U.IsClassic then
        local pageBackdrop = CreateFrame("Frame", nil, ArmoryPVPFrame)
        pageBackdrop:SetTemplate("Transparent")
        pageBackdrop:Point("TOPLEFT", ArmoryPVPFrame, "TOPLEFT", 22, -108)
        pageBackdrop:Point("BOTTOMRIGHT", ArmoryPVPFrame, "BOTTOMRIGHT", -8, 5)
        pageBackdrop:SetFrameLevel(ArmoryPVPFrame:GetFrameLevel())

        ArmoryHonorFrameProgressButton:CreateBackdrop("Transparent")
        ArmoryHonorFrameProgressBar:Width(322)
        ArmoryHonorFrameProgressBar:SetStatusBarTexture(c.media.normTex)
    elseif U.IsBCC or U.IsWrath then
        for i = 1, MAX_ARENA_TEAMS do
            local pvpTeam = _G["ArmoryPVPTeam"..i]

            pvpTeam:StripTextures()
            pvpTeam:CreateBackdrop("Default")
            pvpTeam.backdrop:Point("TOPLEFT", 9, -4)
            pvpTeam.backdrop:Point("BOTTOMRIGHT", -24, 3)

            _G["ArmoryPVPTeam"..i.."Highlight"]:Kill()
        end

        local PVPTeamDetails = ArmoryPVPTeamDetails
        PVPTeamDetails:StripTextures()
        PVPTeamDetails:SetTemplate("Transparent")

        for i = 1, 5 do
            local header = _G["ArmoryPVPTeamDetailsFrameColumnHeader"..i]
            header:StripTextures()
            header:StyleButton()
        end

        for i = 1, 10 do
            local button = _G["ArmoryPVPTeamDetailsButton"..i]
            button:Width(335)
            U.HandleButtonHighlight(button)
        end

        U.SkinCloseButton(ArmoryPVPTeamDetailsCloseButton)
    else
        ArmoryPVPFrame:SetAllPoints()

        ArmoryPVPFrameBackground:Kill()

        local frames = {
            "ArmoryPVPFrameTab1",
            "ArmoryPVPFrameHonor",
            "ArmoryPVPHonor",
            "ArmoryConquestFrame",
            "ArmoryPVPHonorXPBar",
            "ArmoryPVPTalents"

        }
        for _, frame in ipairs(frames) do
            local point, relativeTo, relativePoint, x, y = _G[frame]:GetPoint()
            local yAdd = frame:find("ArmoryPVPFrame") and 5 or 0
            _G[frame]:Point(point, relativeTo, relativePoint, x - 15, y + yAdd)
        end

        for _, button in ipairs(ARMORY_CONQUEST_BUTTONS) do
            button:StripTextures()
            button:CreateBackdrop()
            button:StyleButton(nil, true)
            button.SelectedTexture:SetInside()
            button.SelectedTexture:SetTexture(1, 1, 0, 0.1)
        end

        ArmoryPVPFrameTab1:StripTextures()
        ArmoryPVPFrameTab2:StripTextures()

        ArmoryPVPHonorXPBar:StripTextures()
        ArmoryPVPHonorXPBar.Bar:CreateBackdrop("Default")
    end
end

local function SkinReputation()
    ArmoryReputationFrame:StripTextures()

    ArmoryReputationListScrollFrame:StripTextures()
    if U.IsRetail then
        ArmoryReputationListScrollFrame:Point("BOTTOMRIGHT", ArmoryFrameInset, -27, 4)
    else
        ArmoryReputationListScrollFrame:Point("TOPRIGHT", -28, -75)
    end
    U.SkinScrollBar(ArmoryReputationListScrollFrameScrollBar)

    if U.IsRetail or U.IsWrath then
        ArmoryReputationFrame:HookScript("OnShow", function()
            for i = 1, Armory:GetNumFactions() do
                local statusbar = _G["ArmoryReputationBar"..i.."ReputationBar"]

                if statusbar then
                    U.SkinStatusBar(statusbar)

                    _G["ArmoryReputationBar"..i.."Background"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarHighlight1"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarHighlight2"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarAtWarHighlight1"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarAtWarHighlight2"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarLeftTexture"]:SetTexture()
                    _G["ArmoryReputationBar"..i.."ReputationBarRightTexture"]:SetTexture()
                end
            end
        end)

        hooksecurefunc("ArmoryReputationFrame_Update", function()
            for i = 1, Armory:GetNumFactions() do
                factionButton = _G["ArmoryReputationBar"..i.."ExpandOrCollapseButton"]
                if factionButton then
                    U.SkinPlusMinButton(factionButton)
                end
            end
        end)
    else
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
    end

    if not U.IsRetail then
        ArmoryReputationDetailFrame:StripTextures()
        ArmoryReputationDetailFrame:SetTemplate("Transparent")
        ArmoryReputationDetailFrame:Point("TOPLEFT", ArmoryReputationFrame, "TOPRIGHT", 2, -12)

        U.SkinCloseButton(ArmoryReputationDetailCloseButton)
        ArmoryReputationDetailCloseButton:Point("TOPRIGHT", 2, 2)
    end
end

local function SkinRaidInfo()
    if U.IsRetail then
        U.SkinScrollBar(ArmoryRaidInfoScrollFrame.scrollBar)

        ArmoryRaidInfoFrame:HookScript("OnShow", function()
            for _, button in ipairs(ArmoryRaidInfoScrollFrame.buttons) do
                button:SetHighlightTexture(nil)
            end
        end)
    else
        ArmoryRaidInfoScrollFrame:StripTextures()
        ArmoryRaidInfoScrollFrame:Point("TOPRIGHT", -43, -24)
        ArmoryRaidInfoScrollFrame:SetWidth(290)
        U.SkinScrollBar(ArmoryRaidInfoScrollFrameScrollBar)

        for i = 1, ARMORY_MAX_RAID_INFOS do
            local instanceID = _G["ArmoryRaidInfoInstance"..i.."ID"]
            instanceID:SetWidth(66)
        end
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

local function UpdateCurrencySkins()
    local TokenFrameContainer = ArmoryTokenFrameContainer
    if not TokenFrameContainer.buttons then return end

    local buttons = TokenFrameContainer.buttons
    local numButtons = #buttons

    for i = 1, numButtons do
        local button = buttons[i]

        if button then
            if button.highlight then button.highlight:Kill() end
            if button.categoryLeft then button.categoryLeft:Kill() end
            if button.categoryRight then button.categoryRight:Kill() end
            if button.categoryMiddle then button.categoryMiddle:Kill() end

            if button.icon then button.icon:SetTexCoord(unpack(c.TexCoords)) end

            if button.expandIcon then
                if not button.highlightTexture then
                    button.highlightTexture = button:CreateTexture(button:GetName().."HighlightTexture", "HIGHLIGHT")
                    button.highlightTexture:SetTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
                    button.highlightTexture:SetBlendMode("ADD")
                    button.highlightTexture:SetInside(button.expandIcon)

                    button.expandIcon:Point("LEFT", 4, 0)
                    button.expandIcon:Size(15, 15)
                end

                if button.isHeader then
                    if button.isExpanded then
                        U.SkinPlusMinButton(button.expandIcon, "MinusButton")
                    else
                        U.SkinPlusMinButton(button.expandIcon, "PlusButton")
                    end

                    button.highlightTexture:Show()
                else
                    button.highlightTexture:Hide()
                end
            end
        end
    end
end

local function SkinCurrency()
    ArmoryTokenFrameContainer:Point("TOPLEFT", 24, -75)
    U.SkinScrollBar(ArmoryTokenFrameContainerScrollBar)

    hooksecurefunc("ArmoryTokenFrame_Update", UpdateCurrencySkins)
    hooksecurefunc(ArmoryTokenFrameContainer, "update", UpdateCurrencySkins)
end

local function SkinOther()
    for i = 1, ARMORY_MAX_OTHER_TABS do
        U.SkinTab(_G["ArmoryOtherFrameTab"..i])
    end
    SkinReputation()
    SkinRaidInfo()
    if U.IsRetail then
        SkinCurrency()
    else
        ArmoryOtherFrameTab1:Point("TOPLEFT", 12, -49)
        SkinSkills()
    end
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

    if U.IsRetail then
        button.inset = CreateFrame("Button", nil, button, "BackdropTemplate")
        button.inset:CreateBackdrop("Default", true)
    else
        button.inset = CreateFrame("Button", nil, button)
        button.inset:SetTemplate("Default", true)
    end
    button.inset:SetInside()
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
    ArmoryInventoryExpandButtonFrame:Point("TOPLEFT", 1, -60)
    ArmoryInventoryCollapseAllButton:GetNormalTexture():Size(15)

    hooksecurefunc("ArmoryInventoryFrame_Update", function() U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton) end)

    ArmoryInventoryFrameTab1:ClearAllPoints()
    ArmoryInventoryFrameTab1:Point("TOPLEFT", ArmoryInventoryFrame, "BOTTOMLEFT", 19, 2)
    U.SkinTab(ArmoryInventoryFrameTab1)
    U.SkinTab(ArmoryInventoryFrameTab2)

    ArmoryInventoryIconViewFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryIconViewFrame:StripTextures()
    U.SkinScrollBar(ArmoryInventoryIconViewFrameScrollBar)
    U.SkinCheckBox(ArmoryInventoryIconViewFrameLayoutCheckButton)
    ArmoryInventoryIconViewFrameLayoutCheckButton:Point("TOPLEFT", ArmoryInventoryFrame, "TOPLEFT", 2, -2)

    hooksecurefunc("ArmoryInventoryIconViewFrame_ShowContainer", function(containerFrame)
        containerFrame:Hide()

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

        containerFrame:Show()
    end)

    hooksecurefunc("ArmoryInventoryIconViewFrame_Update", function() U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton) end)

    ArmoryInventoryListViewFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryListViewScrollFrame:StripTextures()
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
        elseif U.IsRetail then
            button = button.inset or button
            if not button.backdrop then button:CreateBackdrop() end
            ColorItemBorder(button, link)
        else
            ColorItemBorder(button.inset or button, link)
        end
    end)
end

local function SkinReward(frame)
    if not frame then return end

    if frame.Icon then
        U.SkinIcon(frame.Icon, true)

        frame.Count:ClearAllPoints()
        frame.Count:Point("BOTTOMRIGHT", frame.Icon, "BOTTOMRIGHT", 2, 0)
    end

    if frame.NameFrame then
        frame.NameFrame:SetAlpha(0)
    end

    if frame.Name then
        frame.Name:SetFontObject("GameFontHighlightSmall")
    end

    if frame.CircleBackground then
        frame.CircleBackground:SetAlpha(0)
        frame.CircleBackgroundGlow:SetAlpha(0)
    end
end

local function SkinQuestLog()
    ArmoryQuestLogFrame:StripTextures()
    ArmoryQuestLogFrame:Point("TOPLEFT", -12, 12)

    ArmoryQuestLogExpandButtonFrame:Point("TOPLEFT", 22, -69)
    ArmoryQuestLogCollapseAllButton:StripTextures()
    U.SkinPlusMinButton(ArmoryQuestLogCollapseAllButton, "PlusButton")
    hooksecurefunc("ArmoryQuestLog_Update", function() U.SkinPlusMinButton(ArmoryQuestLogCollapseAllButton) end)

    ArmoryQuestFrameTab1:ClearAllPoints()
    ArmoryQuestFrameTab1:Point("TOPLEFT", ArmoryQuestFrame, "BOTTOMLEFT", 19, 2)
    ArmoryQuestFrameTab2:Point("LEFT", ArmoryQuestFrameTab1, "RIGHT", -16, 0)
    U.SkinTab(ArmoryQuestFrameTab1)
    U.SkinTab(ArmoryQuestFrameTab2)

    ArmoryEmptyQuestLogFrame:StripTextures()

    ArmoryQuestLogListScrollFrame:CreateBackdrop()
    ArmoryQuestLogListScrollFrame:Width(298)
    ArmoryQuestLogListScrollFrame:Point("TOPLEFT", 19, -94)
    U.SkinScrollBar(ArmoryQuestLogListScrollFrameScrollBar)

    ArmoryQuestLogTitle1:Point("TOPLEFT", 19, -94)

    ArmoryQuestLogDetailScrollFrame:CreateBackdrop()
    ArmoryQuestLogDetailScrollFrame:Width(298)
    U.SkinScrollBar(ArmoryQuestLogDetailScrollFrameScrollBar)
    if not hideParchment then
        ArmoryQuestLogDetailScrollFrame.bg = ArmoryQuestLogDetailScrollFrame:CreateTexture(nil, "ARTWORK")
        ArmoryQuestLogDetailScrollFrame.bg:SetTexture("Interface\\QuestFrame\\QuestBG")
        ArmoryQuestLogDetailScrollFrame.bg:SetTexCoord(0, 1, 0.02, 1)
        ArmoryQuestLogDetailScrollFrame.bg:SetPoint("TOPLEFT", 2, -2)
        ArmoryQuestLogDetailScrollFrame.bg:Size(503, 356)
    end

    ArmoryQuestInfoSkillPointFrame:StripTextures()
    ArmoryQuestInfoSkillPointFrame:StyleButton()
    ArmoryQuestInfoSkillPointFrame:Width(ArmoryQuestInfoSkillPointFrame:GetWidth() - 4)
    ArmoryQuestInfoSkillPointFrame:SetFrameLevel(ArmoryQuestInfoSkillPointFrame:GetFrameLevel() + 2)
    ArmoryQuestInfoSkillPointFrame:SetHighlightTexture(nil)

    ArmoryQuestInfoSkillPointFrameIconTexture:SetTexCoord(unpack(c.TexCoords))
    ArmoryQuestInfoSkillPointFrameIconTexture:SetDrawLayer("OVERLAY")
    ArmoryQuestInfoSkillPointFrameIconTexture:Point("TOPLEFT", 2, -2)
    ArmoryQuestInfoSkillPointFrameIconTexture:Size(ArmoryQuestInfoSkillPointFrameIconTexture:GetWidth() - 2, ArmoryQuestInfoSkillPointFrameIconTexture:GetHeight() - 2)
    ArmoryQuestInfoSkillPointFrame:CreateBackdrop()
    ArmoryQuestInfoSkillPointFrameCount:SetDrawLayer("OVERLAY")

    ArmoryQuestLogQuestCount:ClearAllPoints()
    ArmoryQuestLogQuestCount:Point("BOTTOMRIGHT", ArmoryQuestLogListScrollFrame, "TOPRIGHT", 18, 8)

    hooksecurefunc("ArmoryQuestInfo_Display", function(template, parentFrame)
        for i, questItem in ipairs(ArmoryQuestInfoRewardsFrame.RewardButtons) do
            if not questItem:IsShown() then break end

            local point, relativeTo, relativePoint, x, y = questItem:GetPoint()
            if point and relativeTo and relativePoint then
                if i == 1 then
                    questItem:Point(point, relativeTo, relativePoint, 0, y)
                elseif relativePoint == "BOTTOMLEFT" then
                    questItem:Point(point, relativeTo, relativePoint, 0, -4)
                elseif point then
                    questItem:Point(point, relativeTo, relativePoint, 4, 0)
                end
            end

            questItem.Name:SetTextColor(1, 1, 1)
        end

        local rewardsFrame = ArmoryQuestInfoFrame.rewardsFrame
        local numSpellRewards = Armory:GetNumQuestLogRewardSpells()
        if numSpellRewards > 0 then
            if hideParchment then
                for spellHeader in rewardsFrame.spellHeaderPool:EnumerateActive() do
                    spellHeader:SetVertexColor(1, 1, 1)
                end
            end

            for followerReward in rewardsFrame.followerRewardPool:EnumerateActive() do
                if not followerReward.isSkinned then
                    followerReward:CreateBackdrop()
                    followerReward.backdrop:SetAllPoints(followerReward.BG)
                    followerReward.backdrop:SetPoint("TOPLEFT", 40, -5)
                    followerReward.backdrop:SetPoint("BOTTOMRIGHT", 2, 5)
                    followerReward.BG:Hide()

                    followerReward.PortraitFrame:ClearAllPoints()
                    followerReward.PortraitFrame:SetPoint("RIGHT", followerReward.backdrop, "LEFT", -2, 0)

                    followerReward.PortraitFrame.PortraitRing:Hide()
                    followerReward.PortraitFrame.PortraitRingQuality:SetTexture()
                    followerReward.PortraitFrame.LevelBorder:SetAlpha(0)
                    followerReward.PortraitFrame.Portrait:SetTexCoord(0.2, 0.85, 0.2, 0.85)

                    local level = followerReward.PortraitFrame.Level
                    level:ClearAllPoints()
                    level:SetPoint("BOTTOM", followerReward.PortraitFrame, 0, 3)

                    local squareBG = CreateFrame("Frame", nil, followerReward.PortraitFrame, "BackdropTemplate")
                    squareBG:SetFrameLevel(followerReward.PortraitFrame:GetFrameLevel()-1)
                    squareBG:SetPoint("TOPLEFT", 2, -2)
                    squareBG:SetPoint("BOTTOMRIGHT", -2, 2)
                    squareBG:SetTemplate()
                    followerReward.PortraitFrame.squareBG = squareBG

                    followerReward.isSkinned = true
                end

                local r, g, b = followerReward.PortraitFrame.PortraitRingQuality:GetVertexColor()
                followerReward.PortraitFrame.squareBG:SetBackdropBorderColor(r, g, b)
            end
        end

        if hideParchment then
            ArmoryQuestInfoTitleHeader:SetTextColor(1, .8, .1)
            ArmoryQuestInfoDescriptionHeader:SetTextColor(1, .8, .1)
            ArmoryQuestInfoObjectivesHeader:SetTextColor(1, .8, .1)
            ArmoryQuestInfoRewardsFrame.Header:SetTextColor(1, .8, .1)
            ArmoryQuestInfoDescriptionText:SetTextColor(1, 1, 1)
            ArmoryQuestInfoObjectivesText:SetTextColor(1, 1, 1)
            ArmoryQuestInfoGroupSize:SetTextColor(1, 1, 1)
            ArmoryQuestInfoRewardText:SetTextColor(1, 1, 1)
            ArmoryQuestInfoQuestType:SetTextColor(1, 1, 1)
            ArmoryQuestInfoRewardsFrame.ItemChooseText:SetTextColor(1, 1, 1)
            ArmoryQuestInfoRewardsFrame.ItemReceiveText:SetTextColor(1, 1, 1)

            if ArmoryQuestInfoRewardsFrame.SpellLearnText then
                ArmoryQuestInfoRewardsFrame.SpellLearnText:SetTextColor(1, 1, 1)
            end

            ArmoryQuestInfoRewardsFrame.PlayerTitleText:SetTextColor(1, 1, 1)
            ArmoryQuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(1, 1, 1)

            local numObjectives = Armory:GetNumQuestLeaderBoards()
            local numVisibleObjectives = 0
            for i = 1, numObjectives do
                local _, type, finished = Armory:GetQuestLogLeaderBoard(i)
                if (type ~= "spell" and type ~= "log" and numVisibleObjectives < MAX_OBJECTIVES) then
                    numVisibleObjectives = numVisibleObjectives + 1
                    local objective = ArmoryQuestInfoObjectivesFrame.Objectives[numVisibleObjectives]
                    if objective then
                         if finished then
                            objective:SetTextColor(1, .8, .1)
                        else
                            objective:SetTextColor(.63, .09, .09)
                        end
                    end
                end
            end

            local spellID, _, _, finished = Armory:GetQuestLogCriteriaSpell()
            if spellID then
                if finished then
                    ArmoryQuestInfoSpellObjectiveLearnLabel:SetTextColor(1, .8, .1)
                else
                    ArmoryQuestInfoSpellObjectiveLearnLabel:SetTextColor(.63, .09, .09)
                end
            end
        end
    end)

    local Rewards = { "MoneyFrame", "HonorFrame", "XPFrame", "ArtifactXPFrame", "SkillPointFrame" }

    for _, frame in pairs(Rewards) do
        SkinReward(ArmoryQuestInfoRewardsFrame[frame])
    end

    ArmoryQuestInfoPlayerTitleFrame.FrameLeft:SetTexture()
    ArmoryQuestInfoPlayerTitleFrame.FrameCenter:SetTexture()
    ArmoryQuestInfoPlayerTitleFrame.FrameRight:SetTexture()
    ArmoryQuestInfoPlayerTitleFrame.Icon:SetTexCoord(unpack(c.TexCoords))
    ArmoryQuestInfoPlayerTitleFrame:CreateBackdrop()
    ArmoryQuestInfoPlayerTitleFrame.backdrop:SetOutside(ArmoryQuestInfoPlayerTitleFrame.Icon)

    for i = 1, ARMORY_QUESTS_DISPLAYED do
        local questLogTitle = _G["ArmoryQuestLogTitle"..i]

        U.SkinPlusMinButton(questLogTitle, "PlusButton")
        questLogTitle.SetNormalTexture = c.noop
        questLogTitle:GetNormalTexture():Point("LEFT", 5, 0)

        hooksecurefunc(questLogTitle, "SetNormalTexture", function(self, texture) U.SkinPlusMinButton(self, texture) end)
    end
end

local function SkinQuestHistory()
    ArmoryQuestHistoryFrame:StripTextures()
    ArmoryQuestHistoryFrame:Point("TOPLEFT", -12, 12)

    ArmoryQuestHistoryExpandButtonFrame:Kill()

    ArmoryQuestHistoryScrollFrame:StripTextures()
    ArmoryQuestHistoryScrollFrame:Point("TOPRIGHT", -67, -75)
    U.SkinScrollBar(ArmoryQuestHistoryScrollFrameScrollBar)

    ArmoryQuestHistoryGroupByDateButton:Hide()
    local checkBox = CreateFrame("CheckButton", nil, ArmoryQuestHistoryFrame, "UICheckButtonTemplate")
    checkBox:Size(24, 24)
    checkBox:Point("TOPLEFT", ArmoryQuestFrame, "TOPLEFT", 2, -2)
    checkBox.text:SetText(ARMORY_BY_DATE)
    U.SkinCheckBox(checkBox)
    checkBox:SetScript("OnClick", function(self)
        Armory:SetQuestHistoryGroupByDate(self:GetChecked())
        ArmoryQuestHistory_Update()
    end)

    for i = 1, ARMORY_QUESTHISTORY_DISPLAYED do
        local questHistoryTitle = _G["ArmoryQuestHistoryTitle"..i]

        U.SkinPlusMinButton(questHistoryTitle, "PlusButton")
        questHistoryTitle.SetNormalTexture = c.noop

        questHistoryTitle:GetNormalTexture():Size(15)
        questHistoryTitle:GetNormalTexture():Point("LEFT", 5, 0)

        hooksecurefunc(questHistoryTitle, "SetNormalTexture", function(self, texture) U.SkinPlusMinButton(self, texture) end)
    end
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
    if U.IsRetail then
        U.SkinArmoryFrame(ArmoryQuestFrame, true)

        U.SkinSearchBox(ArmoryQuestFrameEditBox, 150)
        ArmoryQuestFrameEditBox:ClearAllPoints()
        ArmoryQuestFrameEditBox:Point("TOPLEFT", 8, -35)

        SkinQuestLog()
        SkinQuestHistory()
        return
    end

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

    local base, updateFunc
    if U.IsWrath then
        ArmoryQuestLogDetailScrollFrame:Height(262)
        base = "ArmoryQuestInfo"
        updateFunc = "ArmoryQuestInfo_Display"
    else
        base = "ArmoryQuestLog"
        updateFunc ="ArmoryQuestFrameItems_Update"
    end

    for i = 1, MAX_NUM_ITEMS do
        local questItem = _G[base.."Item"..i]
        SkinQuestInfoItem(questItem)
    end

    ArmoryQuestLogCount:ClearAllPoints()
    ArmoryQuestLogCount:Point("BOTTOMRIGHT", ArmoryQuestLogListScrollFrame, "TOPRIGHT", 330, 0)

    hooksecurefunc(updateFunc, function()
        local headers, texts
        if U.IsWrath then
            headers = {
                ArmoryQuestInfoTitleHeader,
                ArmoryQuestInfoObjectivesHeader,
                ArmoryQuestInfoDescriptionHeader,
                ArmoryQuestInfoRewardsHeader
            }
            texts = {
                ArmoryQuestInfoDescriptionText,
                ArmoryQuestInfoObjectivesText,
                ArmoryQuestInfoGroupSize,
                ArmoryQuestInfoRewardText,
                ArmoryQuestInfoItemChooseText,
                ArmoryQuestInfoItemReceiveText,
                ArmoryQuestInfoSpellLearnText,
                ArmoryQuestInfoHonorFrameHonorReceiveText,
                ArmoryQuestInfoArenaPointsFrameReceiveText,
                ArmoryQuestInfoTalentFrameReceiveText,
                ArmoryQuestInfoXPFrameReceiveText,
                ArmoryQuestInfoPlayerTitleFrameTitle,
                ArmoryQuestInfoTimerText
            }
        else
            headers = {
                ArmoryQuestLogQuestTitle,
                ArmoryQuestLogDescriptionTitle,
                ArmoryQuestLogRewardTitleText,
                ArmoryQuestLogItemChooseText
            }
            texts = {
                ArmoryQuestLogObjectivesText,
                ArmoryQuestLogSuggestedGroupNum,
                ArmoryQuestLogQuestDescription,
                ArmoryQuestLogItemChooseText,
                ArmoryQuestLogItemReceiveText,
                ArmoryQuestLogSpellLearnText,
                ArmoryQuestLogPlayerTitleText,
                ArmoryQuestLogTimerText
            }
           end

        for _, header in ipairs(headers) do
            header:SetTextColor(1, 0.80, 0.10)
        end

        for _, text in ipairs(texts) do
            text:SetTextColor(1, 1, 1)
        end

        local requiredMoney = Armory:GetQuestLogRequiredMoney()
        if requiredMoney > 0 then
            if requiredMoney > Armory:GetMoney() then
                _G[base.."RequiredMoneyText"]:SetTextColor(0.6, 0.6, 0.6)
            else
                _G[base.."RequiredMoneyText"]:SetTextColor(1, 0.80, 0.10)
            end
        end

        local numObjectives = Armory:GetNumQuestLeaderBoards()
        local _, objType, finished, objective
        local numVisibleObjectives = 0

        for i = 1, numObjectives do
            _, objType, finished = Armory:GetQuestLogLeaderBoard(i)
            if objType ~= "spell" then
                numVisibleObjectives = numVisibleObjectives + 1
                local objective = _G[base.."Objective"..numVisibleObjectives]

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
            local questItem = _G[base.."Item"..i]
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

    tab.pushed = true
    CreateBackdrop(tab, "Default"):SetAllPoints()
    tab:StyleButton(true)
    tab:GetHighlightTexture().SetTexture = c.noop
    tab:GetCheckedTexture().SetTexture = c.noop

    local point, relativeTo, relativePoint, x, y = tab:GetPoint()
    tab:Point(point, relativeTo, relativePoint, 1, y)
end

local function SkinSpellBook()
    U.SkinArmoryFrame(ArmorySpellBookFrame, true)

    if U.IsRetail then
        local pageBackdrop = CreateFrame("Frame", nil, ArmorySpellBookFrame, "BackdropTemplate")
        pageBackdrop:SetTemplate("Default")
        pageBackdrop:Point("TOPLEFT", ArmorySpellBookFrame, "TOPLEFT", 2, -75)
        pageBackdrop:Point("BOTTOMRIGHT", ArmorySpellBookFrame, "BOTTOMRIGHT", -2, 2)
        if not hideParchment then
            pageBackdrop.bg = pageBackdrop:CreateTexture(nil, "BACKGROUND", nil, 2)
            pageBackdrop.bg:SetTexture("Interface\\QuestFrame\\QuestBG")
            pageBackdrop.bg:SetTexCoord(0, 1, 0.02, 1)
            pageBackdrop.bg:SetPoint("TOPLEFT", 2, -2)
            pageBackdrop.bg:Size(563, 528)
        end

        ArmorySpellBookPrevPageButton:SetParent(pageBackdrop)
        ArmorySpellBookNextPageButton:SetParent(pageBackdrop)
        ArmorySpellBookSpellIconsFrame:SetParent(pageBackdrop)
        ArmorySpellBookSpellIconsFrame:SetAllPoints()
    end

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
            PanelTemplates_SetTab(ArmorySpellBookFrame, self:GetID())
            ArmoryToggleSpellBook(self.oldtab.bookType)
        end)

        if i == 1 then
            tab:SetPoint("TOPLEFT", ArmorySpellBookFrame, "BOTTOMLEFT", 19, 2)
        else
            tab:SetPoint("LEFT", "ArmorySpellBookFrameTab"..(i-1), "RIGHT", -16, 0)
        end
    end

    ArmorySpellBookPageText:Point("BOTTOM", 0, 12)
    ArmorySpellBookPageText:SetParent(ArmorySpellBookSpellIconsFrame)
    ArmorySpellBookPrevPageButton:Size(24, 24)
    ArmorySpellBookNextPageButton:Size(24, 24)
    if U.IsRetail then
        ArmorySpellBookPrevPageButton:Point("CENTER", ArmorySpellBookFrame, "BOTTOMLEFT", 25, 18)
        ArmorySpellBookNextPageButton:Point("CENTER", ArmorySpellBookFrame, "BOTTOMLEFT", 314, 18)
    else
        ArmorySpellBookPageText:SetTextColor(1, 1, 1)
        ArmorySpellBookPrevPageButton:Point("BOTTOMRIGHT", ArmorySpellBookFrame, "BOTTOMRIGHT", -40, 12)
        ArmorySpellBookNextPageButton:Point("TOPLEFT", ArmorySpellBookPrevPageButton, "TOPLEFT", 25, 0)
    end
    U.SkinNextPrevButton(ArmorySpellBookPrevPageButton)
    U.SkinNextPrevButton(ArmorySpellBookNextPageButton)

    for i = 1, MAX_SKILLLINE_TABS do
        SkinSpellLineTab(_G["ArmorySpellBookSkillLineTab"..i])
    end

    ArmorySpellButton1:Point("TOPLEFT", 18, -18)
    for i = 1, SPELLS_PER_PAGE do
        local button = _G["ArmorySpellButton"..i]
        local icon = _G["ArmorySpellButton"..i.."IconTexture"]

        button.SpellSubName:SetTextColor(0.6, 0.6, 0.6)

        icon:SetTexCoord(unpack(c.TexCoords))

        if U.IsRetail then
            button:StripTextures()
            CreateBackdrop(button, "Default", true)

            icon:ClearAllPoints()
            icon:SetAllPoints()
        else
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

            button.bg = CreateFrame("Frame", nil, button)
            button.bg:CreateBackdrop("Transparent", true)
            button.bg:Point("TOPLEFT", -6, 6)
            button.bg:Point("BOTTOMRIGHT", 112, -6)
            button.bg:Height(46)
            button.bg:SetFrameLevel(button.bg:GetFrameLevel() - 2)
        end
    end

    if U.IsRetail then
        ArmorySpellBookPetInfo:Point("TOPLEFT", 10, -30)
        ArmorySpellBookPetInfo.icon:SetTexCoord(unpack(c.TexCoords))
        CreateBackdrop(ArmorySpellBookPetInfo, "Default", true):SetOutside(ArmorySpellBookPetInfo.Icon)
    else
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
    local buttons = {
        ArmoryFriendsListButton = ARMORY_FRIENDS_TO_DISPLAY,
        ArmoryIgnoreListButton = ARMORY_IGNORES_TO_DISPLAY
    }
    if U.IsRetail then
        table.insert(frames, "ArmoryEventsListScrollFrame")
        buttons.ArmoryEventsListButton = ARMORY_EVENTS_TO_DISPLAY
    end

    for i, frame in ipairs(frames) do
        _G[frame]:Height(342)
        _G[frame]:Point("TOPRIGHT", -33, -75)
        _G[frame]:StripTextures()
        U.SkinScrollBar(_G[frame.."ScrollBar"])
    end

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
    if U.IsRetail then
        if tradeSkillInfo.collapsed then
            U.SkinPlusMinButton(self, "PlusButton")
        else
            U.SkinPlusMinButton(self, "MinusButton")
        end
    elseif tradeSkillInfo.type == "header" then
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
        if U.IsRetail then
            ResultIcon:CreateBackdrop("Default")
        else
            ResultIcon:SetTemplate("Default")
        end
        ResultIcon.IconBorder:SetTexture(nil)
        ResultIcon.ResultBorder:SetTexture(nil)

        for i = 1, #ArmoryTradeSkillFrame.DetailsFrame.Contents.Reagents do
            local Button = ArmoryTradeSkillFrame.DetailsFrame.Contents.Reagents[i]
            local Icon = Button.Icon
            local Count = Button.Count

            Icon:SetTexCoord(unpack(c.TexCoords))
            Icon:SetDrawLayer("OVERLAY")
            if not Icon.backdrop then
                Icon.backdrop = CreateFrame("Frame", nil, Button, U.IsRetail and "BackdropTemplate" or nil)
                Icon.backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
                Icon.backdrop:SetTemplate("Default")
                Icon.backdrop:SetOutside(Icon)
            end

            Icon:SetParent(Icon.backdrop)
            Count:SetParent(Icon.backdrop)
            Count:SetDrawLayer("OVERLAY")

            Button.NameFrame:Kill()

            if U.IsRetail then
                for i = 1, #ArmoryTradeSkillFrame.DetailsFrame.Contents.OptionalReagents do
                    local Button = ArmoryTradeSkillFrame.DetailsFrame.Contents.OptionalReagents[i]
                    local Icon = Button.Icon

                    Icon:SetTexCoord(unpack(c.TexCoords))
                    Icon:SetDrawLayer("OVERLAY")
                    if not Icon.backdrop then
                        Icon.backdrop = CreateFrame("Frame", nil, Button, "BackdropTemplate")
                        Icon.backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
                        Icon.backdrop:SetTemplate()
                        Icon.backdrop:SetOutside(Icon)
                    end

                    Button.NameFrame:Kill()
                end
            else
                ColorItemBorder(Icon.backdrop, Armory:GetTradeSkillReagentItemLink(ArmoryTradeSkillFrame.DetailsFrame.selectedRecipe, i))
            end
        end
    end)

    if not U.IsRetail then PointXY(ArmoryTradeSkillFrame.ExpandButtonFrame.CollapseAllButton, 1) end
    hooksecurefunc(ArmoryTradeSkillFrame, "RefreshExpandButtonFrame", function(numTradeSkills)
        U.SkinPlusMinButton(ArmoryTradeSkillFrame.ExpandButtonFrame.CollapseAllButton)
    end)
end

local function SkinAchievements()
    U.SkinArmoryFrame(ArmoryAchievementFrame, true)

    U.SkinScrollBar(ArmoryAchievementListScrollFrameScrollBar)
    ArmoryAchievementListScrollFrame:StripTextures()
    ArmoryAchievementListScrollFrame:SetPoint("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -33, -63)

    U.SkinSearchBox(ArmoryAchievementFrameEditBox, 150)
    ArmoryAchievementFrameEditBox:ClearAllPoints()
    ArmoryAchievementFrameEditBox:Point("TOPLEFT", 8, -35)

    ArmoryAchievementCollapseAllButton:StripTextures()
    ArmoryAchievementExpandButtonFrame:Point("TOPLEFT", 8, -49)

    ArmoryAchievementFrameTab1:ClearAllPoints()
    ArmoryAchievementFrameTab1:Point("TOPLEFT", ArmoryAchievementFrame, "BOTTOMLEFT", 19, 2)
    ArmoryAchievementFrameTab2:Point("LEFT", ArmoryAchievementFrameTab1, "RIGHT", -16, 0)
    U.SkinTab(ArmoryAchievementFrameTab1)
    U.SkinTab(ArmoryAchievementFrameTab2)

    hooksecurefunc("ArmoryAchievementFrame_SetRowType", function(achievementRow, rowType, hasQuantity)
        if rowType == 0 then
            achievementRow:Point("LEFT", ArmoryAchievementFrame, "LEFT", 29, 0)
        elseif rowType == 1 then
            achievementRow:Point("LEFT", ArmoryAchievementFrame, "LEFT", 47, 0)
        elseif rowType == 2 then
            achievementRow:Point("LEFT", ArmoryAchievementFrame, "LEFT", 5, 0)
        elseif rowType == 3 then
            achievementRow:Point("LEFT", ArmoryAchievementFrame, "LEFT", 24, 0)
        end
    end)

    ArmoryAchievementListScrollFrame:HookScript("OnShow", function()
        ArmoryAchievementBar1:Point("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -35, -73)
    end)
    ArmoryAchievementListScrollFrame:HookScript("OnHide", function()
        ArmoryAchievementBar1:Point("TOPRIGHT", ArmoryAchievementFrame, "TOPRIGHT", -21, -73)
    end)

    ArmoryAchievementFrame:HookScript("OnShow", function()
        local numAchievements
        if ArmoryAchievementFrame.selected == "achievements" then
            numAchievements = Armory:GetNumAchievements()
        else
            numAchievements = Armory:GetNumStatistics()
        end
        for i = 1, numAchievements do
            local statusbar = _G["ArmoryAchievementBar"..i.."AchievementBar"]

            if statusbar then
                U.SkinStatusBar(statusbar)

                _G["ArmoryAchievementBar"..i.."Background"]:SetTexture(nil)
                _G["ArmoryAchievementBar"..i.."AchievementBarHighlight1"]:SetTexture(nil)
                _G["ArmoryAchievementBar"..i.."AchievementBarHighlight2"]:SetTexture(nil)
                _G["ArmoryAchievementBar"..i.."AchievementBarLeftTexture"]:SetTexture(nil)
                _G["ArmoryAchievementBar"..i.."AchievementBarRightTexture"]:SetTexture(nil)
            end
        end
    end)

    hooksecurefunc("ArmoryAchievementFrame_Update", function()
        local offset = FauxScrollFrame_GetOffset(ArmoryAchievementListScrollFrame)
        local numAchievements, isHeader
        if ArmoryAchievementFrame.selected == "achievements" then
            numAchievements = Armory:GetNumAchievements()
        else
            numAchievements = Armory:GetNumStatistics()
        end

        for i = 1, ARMORY_NUM_ACHIEVEMENTS_DISPLAYED do
            index = offset + i
            button = _G["ArmoryAchievementBar"..i.."ExpandOrCollapseButton"]
            if index <= numAchievements then
                if ArmoryAchievementFrame.selected == "achievements" then
                    isHeader = select(3, Armory:GetAchievementInfo(index))
                else
                    isHeader = select(3, Armory:GetStatisticInfo(index))
                end
                if isHeader then
                    U.SkinPlusMinButton(button)
                end
            end
        end
        U.SkinPlusMinButton(ArmoryAchievementCollapseAllButton)
    end)
end

local function SkinArtifacts()
    ArmoryArtifactFrame:StripTextures()
    ArmoryArtifactFrame:CreateBackdrop("Transparent")
    ArmoryArtifactFrame.BorderFrame:StripTextures()
    U.SkinCloseButton(ArmoryArtifactFrame.CloseButton)

    ArmoryArtifactFrame.ForgeBadgeFrame.ItemIcon:Hide()
    ArmoryArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:ClearAllPoints()
    ArmoryArtifactFrame.ForgeBadgeFrame.ForgeLevelBackground:SetPoint("TOPLEFT", ArmoryArtifactFrame)
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

    local detailBackdrop = CreateFrame("Frame", nil, ArmoryFindFrame, U.IsRetail and "BackdropTemplate" or nil)
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

        U.SkinPlusMinButton(line, "PlusButton")
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
                    if not U.IsClassic then
                        tooltip:SetScript("OnShow", function(self)
                            if not U.IsWrath then
                                self:SetTemplate("Transparent")
                            end
                            if self.slider then
                                U.SkinSliderFrame(self.slider)
                            end
                        end)
                    end
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
    if U.IsRetail or U.IsWrath then
        SkinAchievements()
    end
    if U.IsRetail then
        SkinOverlay()
        SkinGearSet()
        SkinArtifacts()
    end
    if U.IsWrath then
        SkinGlyphs()
    end
end)
