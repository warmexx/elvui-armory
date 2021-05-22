if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end

local U = select(2, ...)
local s, c

if ElvUI then
    local E, L, V, P, G, DF = unpack(ElvUI)
    local S = E:GetModule("Skins")
    U.s = S
    U.c = E
    U.ccolor = E.myclass
    s = S
    c = E
else
    local T, C, L, G = unpack(Tukui)
    U.s = T
    U.c = C
    U.ccolor = T.myclass
    s = T
    c = C
    c.TexCoords = {.08, .92, .08, .92}
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
    local tex = self:GetNormalTexture()
    if not texture then
        texture = tex:GetTexture()
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
        s:HandleDropDownBox(self, width)
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
    self:SetTemplate("Transparent")
end

function U.SkinTooltip(self)
    self:SetTemplate("Transparent", nil, true)
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
    button:SetTemplate("Default", true)

    icon:SetInside()
    icon:SetTexCoord(unpack(c.TexCoords))

    hooksecurefunc(button.IconBorder, "SetVertexColor", function(self, r, g, b)
        self:GetParent():SetBackdropBorderColor(r, g, b)
        self:SetTexture("")
    end)
    hooksecurefunc(button.IconBorder, "Hide", function(self)
        if c.media then
            self:GetParent():SetBackdropBorderColor(unpack(c.media.bordercolor))
        elseif c.Medias then
            self:GetParent():SetBackdropBorderColor(unpack(c.Medias.BorderColor))
        end
    end)
end

function U.ColorItemBorder(object, quality)
    if quality and quality > 1 then
        object:SetBackdropBorderColor(GetItemQualityColor(quality))
    elseif c.media then
        object:SetBackdropBorderColor(unpack(c.media.bordercolor))
    elseif c.Medias then
        object:SetBackdropBorderColor(unpack(c.Medias.BorderColor))
    end
end

function U.SkinInventoryLine(object)
    object:SetHighlightFontObject(object:GetNormalFontObject())
    object:GetNormalTexture():SetTexCoord(unpack(c.TexCoords))
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
