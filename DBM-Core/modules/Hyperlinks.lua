local L = DBM_CORE_L

local frame, text, ignore, cancel

local function CreateOurFrame()
	frame = CreateFrame("Frame", "DBMHyperLinks", UIParent)
	frame.backdropInfo = {
		bgFile		= "Interface\\DialogFrame\\UI-DialogBox-Background-Dark", -- 312922
		edgeFile	= "Interface\\DialogFrame\\UI-DialogBox-Border", -- 131072
		tile		= true,
		tileSize	= 16,
		edgeSize	= 16,
		insets		= { left = 1, right = 1, top = 1, bottom = 1 }
	}
	frame:SetBackdrop(frame.backdropInfo)
	frame:SetSize(500, 80)
	frame:SetPoint("TOP", UIParent, "TOP", 0, -200)
	frame:SetFrameStrata("DIALOG")

	text = frame:CreateFontString()
	text:SetFontObject(ChatFontNormal)
	text:SetWidth(470)
	text:SetWordWrap(true)
	text:SetPoint("TOP", frame, "TOP", 0, -15)

	local accept = CreateFrame("Button", nil, frame)
	accept:SetNormalTexture("Interface\\Buttons\\UI-DialogBox-Button-Up") -- 130763
	accept:SetPushedTexture("Interface\\Buttons\\UI-DialogBox-Button-Down") -- 130761
	accept:SetHighlightTexture("Interface\\Buttons\\UI-DialogBox-Button-Highlight", "ADD") -- 130762
	accept:SetSize(128, 35)
	accept:SetPoint("BOTTOM", frame, "BOTTOM", -75, 0)
	accept:SetScript("OnClick", function()
		DBM:AddToPizzaIgnore(ignore)
		DBT:CancelBar(cancel)
		frame:Hide()
	end)

	local atext = accept:CreateFontString()
	atext:SetFontObject(ChatFontNormal)
	atext:SetPoint("CENTER", accept, "CENTER", 0, 5)
	atext:SetText(YES)

	local decline = CreateFrame("Button", nil, frame)
	decline:SetNormalTexture("Interface\\Buttons\\UI-DialogBox-Button-Up") -- 130763
	decline:SetPushedTexture("Interface\\Buttons\\UI-DialogBox-Button-Down") -- 130761
	decline:SetHighlightTexture("Interface\\Buttons\\UI-DialogBox-Button-Highlight", "ADD") -- 130762
	decline:SetSize(128, 35)
	decline:SetPoint("BOTTOM", frame, "BOTTOM", 75, 0)
	decline:SetScript("OnClick", function()
		frame:Hide()
	end)

	local dtext = decline:CreateFontString()
	dtext:SetFontObject(ChatFontNormal)
	dtext:SetPoint("CENTER", decline, "CENTER", 0, 5)
	dtext:SetText(NO)
	DBM:PlaySound(850)
end

local function LinkHook(self, link)
	local  linkType, arg1, arg2, arg3, arg4, arg5, arg6 = strsplit(":", link)
	if linkType ~= "DBM" then
		return
	end
	if arg1 == "cancel" then
		DBT:CancelBar(link:match("DBM:cancel:(.+):nil$"))
	elseif arg1 == "ignore" then
		cancel = link:match("DBM:ignore:(.+):[^%s:]+$")
		ignore = link:match(":([^:]+)$")
		if not frame then
			CreateOurFrame()
		end
		text:SetText(L.PIZZA_CONFIRM_IGNORE:format(ignore))
		frame:Show()
	elseif arg1 == "update" then
		DBM:ShowUpdateReminder(arg2, arg3) -- displayVersion, revision
	elseif arg1 == "news" then
		DBM:ShowUpdateReminder(nil, nil, L.COPY_URL_DIALOG_NEWS, "https://patreon.com/posts/dbm-9-1-9-false-55047651")
	elseif arg1 == "noteshare" then
		local mod = DBM:GetModByName(arg2 or "")
		if mod then
			DBM:ShowNoteEditor(mod, arg3, arg4, arg5, arg6)--modvar, ability, text, sender
		else   --Should not happen, since mod was verified before getting this far, but just in case
			DBM:Debug("Bad note share, mod not valid")
		end
	end
end

local _SetItemRef = SetItemRef


function SetItemRef(link, textref, button, chatFrame)
	if 	link:match("DBM:") then
		-- print(link, textref, button, chatFrame)
		LinkHook(chatFrame,link)
	else
		_SetItemRef(link, textref, button, chatFrame)
	end

end



DEFAULT_CHAT_FRAME:HookScript("OnHyperlinkClick", LinkHook) -- Handles the weird case that the default chat frame is not one of the normal chat frames (3rd party chat frames or whatever causes this)
local i = 1
while _G["ChatFrame" .. i] do
	if _G["ChatFrame" .. i] ~= DEFAULT_CHAT_FRAME then
		_G["ChatFrame" .. i]:HookScript("OnHyperlinkClick", LinkHook)
	end
	i = i + 1
end