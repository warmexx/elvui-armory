local AddOnName, U = ...
local s, c

local GetItemQualityColor = C_Item.GetItemQualityColor or GetItemQualityColor;

U.IsRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
U.IsClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC

U.TexCoords = { 0.1, 0.9, 0.1, 0.9 }

if ElvUI then
    local E, L, V, P, G, DF = unpack(ElvUI)
    local S = E:GetModule("Skins")
    U.s = S
    U.c = E
    U.ccolor = E.myclass
    s = S
    c = E

    E.Libs.EP:RegisterPlugin(AddOnName)
else
    local T, C, L, G = unpack(Tukui)
    U.s = T
    U.c = C
    U.ccolor = T.myclass
    s = T
    c = C
end

function U.SkinButton(self, strip)
    if ElvUI then
        s:HandleButton(self, strip)
    else
        s.SkinButton(self, strip)
    end
end

function U.SkinScrollBar(self)
    if ElvUI then
        s:HandleScrollBar(self)
    else
        s.SkinScrollBar(self)
    end
end

function U.SkinTab(self)
    if ElvUI then
        s:HandleTab(self)
    else
        s.SkinTab(self)
    end
end

function U.SkinIcon(self, backdrop)
    if ElvUI then
        s:HandleIcon(self, backdrop)
    end
end

function U.SkinNextPrevButton(self, horizonal)
    if ElvUI then
        s:HandleNextPrevButton(self)
    elseif s.SkinNextPrevButton then
        s.SkinNextPrevButton(self, horizonal)
    elseif s.SkinArrowButton then
        s.SkinArrowButton(self, not horizonal)
    end
end

function U.SkinPlusMinButton(self, texture)
    local tex = self.GetNormalTexture and self:GetNormalTexture() or self
    if not texture then
        texture = tex:GetTexture()
    end

    if type(texture) ~= "string" then
        if texture == 130821 then
            texture = "MinusButton"
        elseif texture == 130838 then
            texture = "PlusButton"
        else
            return
        end
    end

    tex:Size(15)
    tex:SetTexCoord(0, 1, 0, 1)

    if strfind(texture, "MinusButton") then
        tex:SetTexture(c.Media.Textures.MinusButton)
    elseif strfind(texture, "PlusButton") then
        tex:SetTexture(c.Media.Textures.PlusButton)
    else
        tex:SetTexture()
    end
end

function U.SkinEditBox(self)
    if ElvUI then
        s:HandleEditBox(self)
    else
        for i = 1, self:GetNumRegions() do
            local region = select(i, self:GetRegions())
            if region and region:GetObjectType() == "Texture" and region ~= self.searchIcon then
                region:SetTexture(nil)
            end
        end
        s.SkinEditBox(self)
    end
end

function U.SkinDropDownBox(self, width)
    if ElvUI then
        s:HandleDropDownBox(self, width, nil, true)
    else
        s.SkinDropDown(self, width)
    end
end

function U.SkinCheckBox(self)
    if ElvUI then
        s:HandleCheckBox(self)
    else
        s.SkinCheckBox(self)
    end
end

function U.SkinCloseButton(self)
    if ElvUI then
        s:HandleCloseButton(self)
    else
        s.SkinCloseButton(self)
    end
end

function U.SkinSliderFrame(self, height)
    if ElvUI then
        s:HandleSliderFrame(self)
    elseif s.SkinSlideBar then
        s.SkinSlideBar(self, height)
    end
end

function U.SkinFrame(self)
    self:StripTextures(true)
    if U.IsRetail then
        self:CreateBackdrop("Transparent")
    else
        self:SetTemplate("Transparent")
    end
end

function U.SkinTooltip(self)
    if U.IsRetail then
        if not self.backdrop then self:CreateBackdrop() end
        self.NineSlice:SetTemplate("Transparent")
    else
        self:SetTemplate("Transparent", nil, true)
    end
end

function U.SkinStatusBar(self)
    self:StripTextures(true)
    self:CreateBackdrop()
    if c.media then
        self:SetStatusBarTexture(c.media.normTex)
    elseif c.Medias then
        self:SetStatusBarTexture(c.Medias.Normal)
    end
end

function U.SkinItemButton(button, icon)
    button:StripTextures()
    button:StyleButton()
    if U.IsRetail then
        button:CreateBackdrop()
    else
        button:SetTemplate("Default", true)
    end
    icon:SetTexCoord(unpack(U.TexCoords))
    icon:SetInside()

    hooksecurefunc(button.IconBorder, "SetVertexColor", function(self, r, g, b)
        local backdrop = U.IsRetail and self:GetParent().backdrop or self:GetParent()
        backdrop:SetBackdropBorderColor(r, g, b)
        self:SetTexture("")
    end)
    hooksecurefunc(button.IconBorder, "Hide", function(self)
        local backdrop = U.IsRetail and self:GetParent().backdrop or self:GetParent()
        if c.media then
            backdrop:SetBackdropBorderColor(unpack(c.media.bordercolor))
        elseif c.Medias then
            backdrop:SetBackdropBorderColor(unpack(c.Medias.BorderColor))
        end
    end)
end

local function SetIconTexture(icon, ...)
    local arg1 = ...
    if (arg1 == 130764 or arg1 == "Interface\\Buttons\\UI-EmptySlot-Disabled") or (arg1 == 130841 or arg1 == "Interface\\Buttons\\UI-Quickslot2") then
        icon:SetTexture(nil)
    else
        icon:SetTexture(...)
        icon:SetTexCoord(unpack(U.TexCoords))
    end
end

function U.SkinInventoryButton(button)
    if button.inset then return end

    for i = 1, button:GetNumRegions() do
        local region = select(i, button:GetRegions())
        if region and region:GetObjectType() == "Texture" and region ~= button.searchOverlay and region ~= button.icon then
            region:SetTexture(nil)
        end
    end

    button.inset = CreateFrame("Button", nil, button)
    button.inset:SetTemplate("Default", true)
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
end

function U.ColorItemBorder(object, quality)
    local backdrop = U.IsRetail and object.backdrop or object
    if not backdrop.SetBackdropBorderColor then return end
    if quality and quality > 1 then
        local r, g, b = GetItemQualityColor(quality)
        backdrop:SetBackdropBorderColor(r, g, b)
    elseif c.media then
        backdrop:SetBackdropBorderColor(unpack(c.media.bordercolor))
    elseif c.Medias then
        backdrop:SetBackdropBorderColor(unpack(c.Medias.BorderColor))
    end
end

function U.SkinInventoryLine(object)
    object:SetHighlightFontObject(object:GetNormalFontObject())
    object:GetNormalTexture():SetTexCoord(unpack(U.TexCoords))
    object:GetNormalTexture():SetSize(14, 14)
    object:GetDisabledTexture():Height(14)
end

function U.SkinSearchBox(editBox, width)
    U.SkinEditBox(editBox)
    editBox:Size(width or editBox:GetWidth(), editBox:GetHeight() - 5)
end

function U.SkinArmoryFrame(frame, isSideFrame)
    local closeButton = _G[frame:GetName().."CloseButton"] or _G[frame:GetName():gsub("Frame", "CloseButton")]
    local title = _G[frame:GetName().."TitleText"] or _G[frame:GetName():gsub("Frame", "TitleText")] or frame.TitleText
    U.SkinCloseButton(closeButton)
    U.SkinFrame(frame)
    frame:SetSize(338, 424)
    closeButton:Point("TOPRIGHT", frame, "TOPRIGHT", 3, 3)
    title:SetTextColor(1, 1, 1)
    title:ClearAllPoints()
    title:Point("TOP", frame, "TOP", 0, -3)
    if isSideFrame then
        frame:Point("TOPLEFT", ArmoryFrame, "TOPRIGHT", 45, 0)
    end
end

function U.HandleButtonHighlight(button, r, g, b)
    if ElvUI then
        s:HandleButtonHighlight(button, r, g, b)
    end
end