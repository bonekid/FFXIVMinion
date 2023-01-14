-- ------------------------- Core ------------------------

RevoltDawnFix = {}
local self = RevoltDawnFix
local someTime = Now()
-- ------------------------- Info ------------------------

self.Info = {
    Author      = "bonekid",
    AddonName   = "RevoltDawnFix",
    ClassName   = "RevoltDawnFix",
    Version     = 1,
    StartDate   = "01-12-2023",
    LastUpdate  = "01-12-2023",
    Description = "Automatically switches the Trust tab to the first one so that Revolt doesn't freeze when trying to choose the EW dungeons",
    ChangeLog = {
        [1] = { Version = [[0.0.1]], Description = [[Starting development.]] }
    }
}
function RevoltDawnFix.Log(log)
    local content = "==== [" .. self.Info.AddonName .. "] " .. tostring(log)
    d(content)
end

function RevoltDawnFix.Init()
    RevoltDawnFix.Log([[Addon started]])
end

function RevoltDawnFix.Update()
    if(IsControlOpen("Dawn")) then
        if TimeSince(someTime) > 5000 then
            RevoltDawnFix.Log("Dawn is open")
            local Dawn = GetControlData("Dawn")
            RevoltDawnFix.Log("Dawn tab index is " .. Dawn.selectedindex)
            if Dawn.selectedindex > 0 then
                RevoltDawnFix.Log("Changing back to first tab")
                GetControl("Dawn"):Action("SetTabIndex", 0)
            end
            someTime = Now()
        end
    end
end


RegisterEventHandler([[Module.Initalize]], RevoltDawnFix.Init, [[RevoltDawnFix.Init]])
RegisterEventHandler([[Gameloop.Update]], RevoltDawnFix.Update, [[RevoltDawnFix.Update]])