local objeler = {}
function aractopla(thePlayer, cmd, text)
if getElementData(thePlayer, "objeelde") then
return
end
if getElementData(thePlayer, "sokuyor") then
return
end
if getDistanceBetweenPoints3D(-1783.6259765625, -1612.9140625, 21.801774978638, getElementPosition(thePlayer)) > 5 then
outputChatBox("#FF0000[!]#FFFFFF Araç parçalarını sökmek için uzaktasın!", thePlayer, 255, 255, 255, true)
return
end
if text == "kapi" then
outputChatBox("#dede03[!]#FFFFFF Aracın kapısını sökmeye başladınız!", thePlayer, 255, 255, 255, true)
setElementFrozen(thePlayer, true)
exports.global:applyAnimation(thePlayer, "CAR_CHAT", "car_talkm_loop", 10000, true, false, false)
triggerClientEvent("sokme:ses", thePlayer, thePlayer)
setElementData(thePlayer, "sokuyor", true)
setTimer(
function(nothing)
exports.global:giveItem(thePlayer, 1)
outputChatBox("#dede03[!]#FFFFFF Başarı ile aracın kapısını söktünüz! Şimdi kapıyı gidip teslim edin.", thePlayer, 255, 255, 255, true)
exports.global:giveItem(thePlayer, 17, 1)
setElementFrozen(thePlayer, false)
setElementData(thePlayer, "sokuyor", nill)
end, 10000, 1, true)
end
if text == "tekerlek" then
outputChatBox("#dede03[!]#FFFFFF Aracın tekerleğini sökmeye başladınız!", thePlayer, 255, 255, 255, true)
exports.global:applyAnimation(thePlayer, "CAMERA", "camcrch_idleloop", 10000, true, false, false)
setElementFrozen(thePlayer, true)
triggerClientEvent("sokme:ses", thePlayer, thePlayer)
setElementData(thePlayer, "sokuyor", true)
setTimer(
function(nothing)
outputChatBox("#dede03[!]#FFFFFF Başarı ile aracın tekerleğini söktünüz!", thePlayer, 255, 255, 255, true)
setElementData(thePlayer, "sokuyor", nill)
setElementFrozen(thePlayer, false)
exports.global:giveItem(thePlayer, 18, 1)
end, 10000, 1, true)
end
if text == "kaput" then
outputChatBox("#dede03[!]#FFFFFF Aracın kaputunu sökmeye başladınız!", thePlayer, 255, 255, 255, true)
setElementFrozen(thePlayer, true)
exports.global:applyAnimation(thePlayer, "CAR_CHAT", "car_talkm_loop", 10000, true, false, false)
setElementData(thePlayer, "sokuyor", true)
triggerClientEvent("sokme:ses", thePlayer, thePlayer)
setTimer(
function(nothing)
outputChatBox("#dede03[!]#FFFFFF Başarı ile aracın kaputunu söktünüz!", thePlayer, 255, 255, 255, true)
setElementFrozen(thePlayer, false)
setElementData(thePlayer, "sokuyor", nill)
exports.global:giveItem(thePlayer, 19, 1)
end, 10000, 1, true)
end
end
addCommandHandler("sok", aractopla)

function teslimet(thePlayer, down)
local kaputPara = 250
local kapiPara = 150
local tekerlekPara = 100
if exports.global:hasItem(thePlayer, 17) or exports.global:hasItem(thePlayer, 18) or exports.global:hasItem(thePlayer, 19) then
local kapiMiktar = exports["item-system"]:countItems(thePlayer, 17, 1)
	local kaputMiktar = exports["item-system"]:countItems(thePlayer, 19, 1)
	local tekerlekMiktar = exports["item-system"]:countItems(thePlayer, 18, 1)
		local toplamesya = kapiMiktar + kaputMiktar + tekerlekMiktar
			for i = 0, kapiMiktar do
				exports["item-system"]:takeItem(thePlayer, 17, 1)
			end
			for i = 0, tekerlekMiktar do
				exports["item-system"]:takeItem(thePlayer, 18, 1)
			end
			for i = 0, kaputMiktar do
				exports["item-system"]:takeItem(thePlayer, 19, 1)
			end
			verilecekPara = (tekerlekMiktar * tekerlekPara) + (kaputMiktar * kaputPara) + (kapiMiktar * kapiPara)
			outputChatBox("[!] #ffffff" .. tostring(toplamesya) .. " tane hurdadan toplam ₺" .. tostring(verilecekPara) .. " kazandınız!", thePlayer, 0, 255, 0, true)
			outputChatBox("[!] #ffffffToplam eşyalar;", thePlayer, 0, 0, 255, true)
			outputChatBox("✹ #ffffff '" .. tostring(kapiMiktar) .. "' Kapıdan '₺" .. tostring(kapiMiktar * kapiPara) .. " kazandınız.", thePlayer, 0, 0, 255, true)
			outputChatBox("✹ #ffffff '" .. tostring(kaputMiktar) .. "' Kaputtan '₺" .. tostring(kaputMiktar * kaputPara) .. " kazandınız.", thePlayer, 0, 0, 255, true)
			outputChatBox("✹ #ffffff '" .. tostring(tekerlekMiktar) .. "' Tekerlekten '₺" .. tostring(tekerlekMiktar * tekerlekPara) .. " kazandınız.", thePlayer, 0, 0, 255, true)
exports.global:giveMoney(thePlayer, verilecekPara)
end
end
addCommandHandler("teslimet", teslimet)