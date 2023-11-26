local U = select(2, ...)
local s = U.s
local c = U.c

local GUILDBANK_LINES_DISPLAYED = 20

local NUM_SLOTS_PER_GUILDBANK_GROUP = 14
local NUM_GUILDBANK_COLUMNS = 7

local function SkinOptions()
    local checkBoxes = {
        ArmoryOptionsGuildBankPanelUniItemCountColor or ArmoryOptionsGuildBankPanel.UniItemCountColor,
        ArmoryOptionsGuildBankPanelMyGuildItemCount or ArmoryOptionsGuildBankPanel.MyGuildItemCount,
        ArmoryOptionsGuildBankPanelPersonalGuildItemCount or ArmoryOptionsGuildBankPanel.PersonalGuildItemCount,
        ArmoryOptionsGuildBankPanelGlobalItemCount or ArmoryOptionsGuildBankPanel.GlobalItemCount,
        ArmoryOptionsGuildBankPanelCrossFactionItemCount or ArmoryOptionsGuildBankPanel.CrossFactionItemCount,
        ArmoryOptionsGuildBankPanelIncludeInFind or ArmoryOptionsGuildBankPanel.IncludeInFind,
        ArmoryOptionsGuildBankPanelIntegrate or ArmoryOptionsGuildBankPanel.Integrate,
        ArmoryOptionsGuildBankPanelShowItemCountCheck or ArmoryOptionsGuildBankPanel.ShowItemCount
    }

    for _, checkbox in ipairs(checkBoxes) do
        U.SkinCheckBox(checkbox)
    end
end

local function SkinInventory()
    ArmoryInventoryGuildBankFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryGuildBankScrollFrame:StripTextures()
    U.SkinScrollBar(ArmoryInventoryGuildBankScrollFrameScrollBar)

    hooksecurefunc("ArmoryInventoryGuildBankFrame_Update", function()
        for i = 1, ARMORY_INVENTORY_LINES_DISPLAYED do
            local button = _G["ArmoryInventoryGuildBankLine"..i]
            if button:GetID() > 0 then
                if button.isCollapsed then
                    U.SkinPlusMinButton(button, "PlusButton")
                else
                    U.SkinPlusMinButton(button, "MinusButton")
                end
            end
        end
        U.SkinPlusMinButton(ArmoryInventoryCollapseAllButton)
    end)

    U.SkinTab(ArmoryInventoryFrameTab3)
    if U.IsRetail then
        ArmoryInventoryFrameTab3:ClearAllPoints()
        ArmoryInventoryFrameTab3:Point("LEFT", ArmoryInventoryFrameTab2, "RIGHT", -5, 0)
    end
end

local function SkinListGuildBank()
    U.SkinArmoryFrame(ArmoryListGuildBankFrame)

    ArmoryListGuildBankFrameMessage:Point("TOP", 0, -120)

    local kill = {
        "EmblemBackgroundUL",
        "EmblemBackgroundUR",
        "EmblemBackgroundBL",
        "EmblemBackgroundBR",
        "EmblemUL",
        "EmblemUR",
        "EmblemBL",
        "EmblemBR",
    }

    for i, name in ipairs(kill) do
        if _G["ArmoryListGuildBankFrame"..name] then
            _G["ArmoryListGuildBankFrame"..name]:Kill()
        end
    end

    ArmoryListGuildBankFrameTab1:ClearAllPoints()
    ArmoryListGuildBankFrameTab1:Point("TOPLEFT", ArmoryListGuildBankFrame, "BOTTOMLEFT", 19, 2)
    if U.IsRetail then
        ArmoryListGuildBankFrameTab2:ClearAllPoints()
        ArmoryListGuildBankFrameTab2:Point("LEFT", ArmoryListGuildBankFrameTab1, "RIGHT", -5, 0)
    end
    U.SkinTab(ArmoryListGuildBankFrameTab1)
    U.SkinTab(ArmoryListGuildBankFrameTab2)

    ArmoryListGuildBankFrameMoneyBackgroundFrame:StripTextures()
    ArmoryListGuildBankFrameMoneyBackgroundFrame:SetWidth(150)
    ArmoryListGuildBankFrameMoneyBackgroundFrame:ClearAllPoints()
    ArmoryListGuildBankFrameMoneyBackgroundFrame:Point("TOPRIGHT", -8, -35)

    ArmoryListGuildBankScrollFrame:StripTextures()
    U.SkinScrollBar(ArmoryListGuildBankScrollFrameScrollBar)
    ArmoryListGuildBankScrollFrame:Point("TOPRIGHT", -33, -96)
    ArmoryListGuildBankScrollFrame:Height(321)

    ArmoryGuildBankLine1:Point("TOPLEFT", 10, -98)
    for i = 1, GUILDBANK_LINES_DISPLAYED do
        U.SkinInventoryLine(_G["ArmoryGuildBankLine"..i])
    end

    hooksecurefunc("ArmoryListGuildBankFrame_AllignCommonControls", function(self)
        ArmoryGuildBankFactionFrame:ClearAllPoints()
        ArmoryGuildBankFactionFrame:Point("TOP", 0, -62)

        if not self.searchBox then
            ArmoryGuildBankFrameEditBox:SetHeight(22)
            U.SkinSearchBox(ArmoryGuildBankFrameEditBox, 135)
            self.searchBox = true
        end
        ArmoryGuildBankFrameEditBox:ClearAllPoints()
        ArmoryGuildBankFrameEditBox:Point("TOPLEFT", 8, -35)

        ArmoryGuildBankFilterDropDown:ClearAllPoints()
        ArmoryGuildBankFilterDropDown:Point("TOPRIGHT", ArmoryListGuildBankFrameMoneyBackgroundFrame, "BOTTOMRIGHT",  40, 0)

        ArmoryGuildBankNameDropDown:ClearAllPoints()
        ArmoryGuildBankNameDropDown:Point("TOPLEFT", -13, -56)
        ArmoryGuildBankNameDropDown:Width(164)
    end)
end

local function SkinIconGuildBank()
    ArmoryIconGuildBankFrame:StripTextures()
    ArmoryIconGuildBankFrame:CreateBackdrop("Transparent")
    ArmoryIconGuildBankFrameEmblemFrame:StripTextures(true)
    ArmoryIconGuildBankTabTitle:ClearAllPoints()
    ArmoryIconGuildBankTabTitle:Point("TOP", ArmoryIconGuildBankFrame, "TOP", 0, -40)

    for i = 1, ArmoryIconGuildBankFrame:GetNumChildren() do
        local child = select(i, ArmoryIconGuildBankFrame:GetChildren())
        if child.GetPushedTexture and child:GetPushedTexture() and not child:GetName() then
            U.SkinCloseButton(child)
            child:Point("TOPRIGHT", 2, 3)
            break
        end
    end

    U.SkinCheckBox(ArmoryIconGuildBankFramePersonalCheckButton)
    ArmoryIconGuildBankFramePersonalCheckButton:ClearAllPoints()
    ArmoryIconGuildBankFramePersonalCheckButton:Point("LEFT", ArmoryGuildBankFactionFrame, "RIGHT", 10, 6)

    ArmoryIconGuildBankFrameTab1:ClearAllPoints()
    ArmoryIconGuildBankFrameTab1:Point("TOPLEFT", ArmoryIconGuildBankFrame, "BOTTOMLEFT", 19, 2)
    if U.IsRetail then
        ArmoryIconGuildBankFrameTab2:ClearAllPoints()
        ArmoryIconGuildBankFrameTab2:Point("LEFT", ArmoryIconGuildBankFrameTab1, "RIGHT", -5, 0)
    end
    U.SkinTab(ArmoryIconGuildBankFrameTab1)
    U.SkinTab(ArmoryIconGuildBankFrameTab2)

    for i = 1, NUM_GUILDBANK_COLUMNS do
        _G["ArmoryIconGuildBankColumn"..i]:StripTextures()

        for j = 1, NUM_SLOTS_PER_GUILDBANK_GROUP do
            U.SkinInventoryButton(_G["ArmoryIconGuildBankColumn"..i.."Button"..j])
        end
    end

    for i = 1, MAX_GUILDBANK_TABS do
        local button = _G["ArmoryIconGuildBankTab"..i.."Button"]
        local texture = _G["ArmoryIconGuildBankTab"..i.."ButtonIconTexture"]
        _G["ArmoryIconGuildBankTab"..i]:StripTextures(true)

        button:StripTextures()
        button:StyleButton(true)
		button:CreateBackdrop(nil, true)
		button.backdrop:SetAllPoints()

        texture:SetInside()
        texture:SetTexCoord(unpack(U.TexCoords))
    end

    hooksecurefunc("ArmoryIconGuildBankFrame_AllignCommonControls", function(self)
        ArmoryGuildBankFactionFrame:ClearAllPoints()
        ArmoryGuildBankFactionFrame:Point("LEFT", ArmoryGuildBankNameDropDown, "RIGHT", 15, -3)

        if not self.searchBox then
            ArmoryGuildBankFrameEditBox:SetHeight(22)
            U.SkinSearchBox(ArmoryGuildBankFrameEditBox, 135)
            self.searchBox = true
        end
        ArmoryGuildBankFrameEditBox:ClearAllPoints()
        ArmoryGuildBankFrameEditBox:Point("TOPLEFT", 8, -40)

        ArmoryGuildBankFilterDropDown:ClearAllPoints()
        ArmoryGuildBankFilterDropDown:Point("TOPRIGHT", 33, -35)

        ArmoryGuildBankNameDropDown:ClearAllPoints()
        ArmoryGuildBankNameDropDown:Point("TOPLEFT", -13, -3)
        ArmoryGuildBankNameDropDown:Width(164)
    end)
end

local function SkinGuildBank()
    ArmoryGuildBankFrame.filter = ""

    ArmoryGuildBankFrameDeleteButton:Kill()
    U.SkinDropDownBox(ArmoryGuildBankNameDropDown, 160)

    ArmoryGuildBankFilterDropDownText:ClearAllPoints()
    ArmoryGuildBankFilterDropDownText:Point("RIGHT", ArmoryGuildBankFilterDropDown, "RIGHT", 0, 0)
    ArmoryDropDownMenu_JustifyText(ArmoryGuildBankFilterDropDown, "RIGHT")

    SkinListGuildBank()
    SkinIconGuildBank()
end

do
    if not AGB then return end

    SkinOptions()
    SkinInventory()
    SkinGuildBank()
end
