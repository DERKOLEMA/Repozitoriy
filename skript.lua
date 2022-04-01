local GlobalExploitEnv = getgenv and getgenv() or _G

if hookmetamethod and newcclosure then
    local index; index = hookmetamethod(game, '__index', newcclosure(function(self, arg, ...)
        
        if not checkcaller() then
            if GlobalExploitEnv.ScriptSettings.Player.WalkSpeed ~= 'Default' then
                if arg:lower() == 'walkspeed' then
                    return 10
                end
            end
            
            if GlobalExploitEnv.ScriptSettings.Player.JumpPower ~= 'Default' then
                if arg:lower() == 'jumppower' then
                    return 50
                end
            end
        end
        
        return index(self, arg, ...)
    end))
end
