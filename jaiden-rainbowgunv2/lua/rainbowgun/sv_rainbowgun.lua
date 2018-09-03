-- Entire Rainbow Gun Script (Server Side)

-- update rate and speed vars
local updaterate = 0.09
local colorspeed = 60

-- other settings
local adminonly = true

-- !DO NOT CHANGE ANYTHING BELOW!
local function rainbowgun(targetply)

local col = HSVToColor( CurTime() % 6 * colorspeed, 1, 1 )
	  targetply:SetWeaponColor( Vector( col.r / 255, col.g / 255, col.b / 255 ) )


end 

local function playerisadmin(targetply)
        -- Check if the player has the needed access (admin)
        if targetply:IsAdmin() then 
           rainbowgun(targetply)
        end 
end 

-- super simple code to loop through players
local function playerloop()

for k, targetply in pairs( player.GetAll() ) do
	
	-- if adminonly then check if the player is admin, if not admin only then use rainbowgun
	if adminonly then
	playerisadmin(targetply)
	else
	rainbowgun(targetply)
	end
	
end


end 

-- use a timer instead of a hook to save resources
timer.Create( "loop_hook", updaterate, 0, playerloop )

