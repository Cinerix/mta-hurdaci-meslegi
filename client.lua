local entradaB = createMarker( -1782.6259765625, -1612.9140625, 21.801774978638, "cylinder", 1, 183, 0, 196, 0)
addEventHandler( "onClientRender", root, function()
       local x, y, z = getElementPosition( entradaB )
       local Mx, My, Mz = getCameraMatrix(   )
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 15 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +0.2, 0.07 )
           local WorldPositionX2, WorldPositionY2 = getScreenFromWorldPosition( x, y, z +0.08, 0.07 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("/sok kapi\n /sok tekerlek \n /sok kaput #ffffff", WorldPositionX - 2, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(255,255,255, 255), 1, "bankgothic", "center", "center", false, false, false, true, false)
			    dxDrawText("/sok kapi\n /sok tekerlek \n /sok kaput #ffffff", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(255,255,255, 255), 1, "bankgothic", "center", "center", false, false, false, true, false)
            end
      end
end 
)
--
local entradaB = createMarker( -1794.787109375, -1617.37890625, 21.771265029907, "cylinder", 1, 183, 0, 196, 0)
local entradaB = createMarker( -1794.787109375, -1617.37890625, 20.771265029907, "cylinder", 1, 183, 0, 196, 255)
addEventHandler( "onClientRender", root, function()
       local x, y, z = getElementPosition( entradaB )
       local Mx, My, Mz = getCameraMatrix(   )
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 15 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +0.2, 0.07 )
           local WorldPositionX2, WorldPositionY2 = getScreenFromWorldPosition( x, y, z +0.08, 0.07 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("/teslimet #ffffff", WorldPositionX - 2, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(255,255,255, 255), 2, "pricedown", "center", "center", false, false, false, true, false)
			    dxDrawText("/teslimet #ffffff", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(255,255,255, 255), 2, "pricedown", "center", "center", false, false, false, true, false)
            end
      end
end 
)

objem = createObject(12957, -1784.5322265625, -1612.740234375, 21.799797058105, 0, 0, 0)

function sescikar()
local x, y, z = getElementPosition(localPlayer)
ses = playSound3D("ses.mp3", x, y, z)
attachElements(ses, localPlayer, 0, 0, 0)
end
addEvent("sokme:ses", true)
addEventHandler("sokme:ses", root, sescikar)