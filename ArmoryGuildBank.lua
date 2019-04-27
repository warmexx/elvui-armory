if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

local U = select(2, ...)
local s = U.s
local c = U.c

local function SkinOptions()
    local checkBoxes = {
        "ArmoryOptionsGuildBankPanelUniItemCountColor",
        "ArmoryOptionsGuildBankPanelMyGuildItemCount",
        "ArmoryOptionsGuildBankPanelPersonalGuildItemCount",
        "ArmoryOptionsGuildBankPanelGlobalItemCount",
        "ArmoryOptionsGuildBankPanelCrossFactionItemCount",
        "ArmoryOptionsGuildBankPanelIncludeInFind",
        "ArmoryOptionsGuildBankPanelIntegrate",
    }
    local swatches = {
        "ArmoryOptionsGuildBankPanelShowItemCount",
    }

    for _, name in ipairs(checkBoxes) do
        U.SkinCheckBox(_G[name])
    end

    for _, name in ipairs(swatches) do
        U.SkinCheckBox(_G[name.."Check"])
    end
end

local function SkinInventory()
    ArmoryInventoryGuildBankFrame:Point("TOPRIGHT", -33, -86)
    ArmoryInventoryGuildBankScrollFrame:StripTextures()
    U.SkinScrollBar(ArmoryInventoryGuildBankScrollFrameScrollBar)

    for i = 1, ARMORY_INVENTORY_LINES_DISPLAYED do
        U.SkinInventoryLine(_G["ArmoryInventoryGuildBankLine"..i])
    end
    
    U.SkinTab(ArmoryInventoryFrameTab3)
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
        _G["ArmoryListGuildBankFrame"..name]:Kill()
    end
    
    ArmoryListGuildBankFrameTab1:ClearAllPoints()
    ArmoryListGuildBankFrameTab1:Point("TOPLEFT", ArmoryListGuildBankFrame, "BOTTOMLEFT", 19, 2)
    U.SkinTab(ArmoryListGuildBankFrameTab1)
    U.SkinTab(ArmoryListGuildBankFrameTab2)

    ArmoryListGuildBankFrameMoneyBackgroundFrame:StripTextures()
    ArmoryListGuildBankFrameMoneyBackgroundFrame:SetWidth(150)
    ArmoryListGuildBankFrameMoneyBackgroundFrame:ClearAllPoints()
    ArmoryListGuildBankFrameMoneyBackgroundFrame:Point("TOPRIGHT", -8, -35)
    
    U.SkinScrollBar(ArmoryListGuildBankScrollFrameScrollBar)
    ArmoryListGuildBankScrollFrame:Point("TOPRIGHT", -33, -96)
    ArmoryListGuildBankScrollFrame:Height(321)

    ArmoryGuildBankLine1:Point("TOPLEFT", 10, -98)
    for i = 1 ,ARMORY_GUILDBANK_LINES_DISPLAYED do
        U.SkinInventoryLine(_G["ArmoryGuildBankLine"..i])
    end
    
    hooksecurefunc("ArmoryListGuildBankFrame_AllignCommonControls", function(self)
        ArmoryGuildBankFactionFrame:ClearAllPoints()
        ArmoryGuildBankFactionFrame:Point("TOP", 0, -62)
        
        if not self.searchBox then
            ArmoryGuildBankFrameEditBox:SetHeight(20)
            U.SkinSearchBox(ArmoryGuildBankFrameEditBox)
            self.searchBox = true
        end
        ArmoryGuildBankFrameEditBox:ClearAllPoints()
        ArmoryGuildBankFrameEditBox:Point("TOPLEFT", 8, -35)

        ArmoryGuildBankFilterDropDown:ClearAllPoints()
        ArmoryGuildBankFilterDropDown:Point("TOPRIGHT", ArmoryListGuildBankFrameMoneyBackgroundFrame, "BOTTOMRIGHT",  40, 0)
        
        ArmoryGuildBankNameDropDown:ClearAllPoints()
        ArmoryGuildBankNameDropDown:Point("TOPLEFT", -15, -56)
        ArmoryGuildBankNameDropDown:Width(160)
    end)
end

local function SkinIconGuildBank()
    ArmoryIconGuildBankFrame:StripTextures()
    ArmoryIconGuildBankFrame:SetTemplate("Transparent")
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
    U.SkinTab(ArmoryIconGuildBankFrameTab1)
    U.SkinTab(ArmoryIconGuildBankFrameTab2)
    
    for i = 1, ARMORY_NUM_GUILDBANK_COLUMNS do
        _G["ArmoryIconGuildBankColumn"..i]:StripTextures()
        
        for j = 1, ARMORY_NUM_SLOTS_PER_GUILDBANK_GROUP do
            local button = _G["ArmoryIconGuildBankColumn"..i.."Button"..j]
            local icon = _G["ArmoryIconGuildBankColumn"..i.."Button"..j.."IconTexture"]
            local texture = _G["ArmoryIconGuildBankColumn"..i.."Button"..j.."NormalTexture"]
            if texture then
                texture:SetTexture(nil)
            end
            button.searchOverlay:Hide()
            U.SkinItemButton(button, icon)
        end
    end
    
    for i = 1, MAX_GUILDBANK_TABS do
        local button = _G["ArmoryIconGuildBankTab"..i.."Button"]
        local texture = _G["ArmoryIconGuildBankTab"..i.."ButtonIconTexture"]
        _G["ArmoryIconGuildBankTab"..i]:StripTextures(true)
        
        button:StripTextures()
        button:StyleButton(true)
        button:SetTemplate("Default", true)

        texture:SetInside()
        texture:SetTexCoord(unpack(c.TexCoords))
    end
        
    hooksecurefunc("ArmoryIconGuildBankFrame_AllignCommonControls", function(self)
        ArmoryGuildBankFactionFrame:ClearAllPoints()
        ArmoryGuildBankFactionFrame:Point("LEFT", ArmoryGuildBankNameDropDown, "RIGHT", 15, -3)
        
        if not self.searchBox then
            ArmoryGuildBankFrameEditBox:SetHeight(20)
            U.SkinSearchBox(ArmoryGuildBankFrameEditBox)
            self.searchBox = true
        end
        ArmoryGuildBankFrameEditBox:ClearAllPoints()
        ArmoryGuildBankFrameEditBox:Point("TOPLEFT", 8, -40)

        ArmoryGuildBankFilterDropDown:ClearAllPoints()
        ArmoryGuildBankFilterDropDown:Point("TOPRIGHT", 33, -35)
        
        ArmoryGuildBankNameDropDown:ClearAllPoints()
        ArmoryGuildBankNameDropDown:Point("TOPLEFT", -15, -3)
        ArmoryGuildBankNameDropDown:Width(160)
    end)
end

local function SkinGuildBank()
    ArmoryGuildBankFrame.filter = ""
    
    ArmoryGuildBankFrameDeleteButton:Kill()
    U.SkinDropDownBox(ArmoryGuildBankNameDropDown)

    ArmoryGuildBankFilterDropDownText:ClearAllPoints()
    ArmoryGuildBankFilterDropDownText:Point("RIGHT", ArmoryGuildBankFilterDropDown, "RIGHT", 0, 0)
    ArmoryDropDownMenu_JustifyText(ArmoryGuildBankFilterDropDown, "RIGHT")

    SkinListGuildBank()
    SkinIconGuildBank()
end

Armory:Execute(function()
    if not AGB then return end
    SkinOptions()
    SkinInventory()
    SkinGuildBank()
end)
