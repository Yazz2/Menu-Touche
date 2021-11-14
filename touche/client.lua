ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Menu --
local open = false
local main = RageUI.CreateMenu("Menu Touches", "Intéractions disponibles")

main.Display.Header = true
main.Closed = function()
    open = false
end

function OpenMenuTouche() 
    if open then 
        open = false
        RageUI.Visible(main, false)
        return
    else
        open = true
        RageUI.Visible(main, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(main, function()

                    RageUI.Checkbox("Ouvrir | Fermer Le Menu Touche", false, Config.ouvert, {}, {
                        onChecked = function()
                            ouvert = true 
                        end,
                        onUnChecked = function()
                            ouvert = false
                        end,
                        onSelected = function(Index)
                            Config.ouvert = Index
                        end
                    }) 
                    if ouvert then
                        
                        RageUI.Separator("↓ ~g~Liste des Touches~s~ ↓")
                        for k,v in pairs(Config.Touche) do
                            RageUI.Button(v.label, false, {RightLabel = v.right}, true, {
                                onSelected = function()
                                    
                                end
                            })
                        end

                        
                        RageUI.Button("Fermer", nil, {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "→→"}, true , {
                            onSelected = function()
                                RageUI.CloseAll()
                            end
                        })
                    end 
                end)
            Wait(0)
            end
        end)
    end
end





Keys.Register('F11','F11', 'Menu Personnel ', function()
    OpenMenuTouche()
end)

RegisterCommand("touche", function()

    OpenMenuTouche()

end, false)