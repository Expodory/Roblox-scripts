game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local accessories = {}
        for _, acc in ipairs(char:GetChildren()) do
            if acc:IsA("Accessory") then
                table.insert(accessories, acc)
            end
        end

        local rightArm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
        local leftLeg = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftUpperLeg")

        if #accessories >= 1 and rightArm then
            local hat = accessories[1]:Clone()
            hat.Parent = char
            local handle = hat:FindFirstChild("Handle")
            if handle then
                local weld = Instance.new("Weld")
                weld.Part0 = rightArm
                weld.Part1 = handle
                weld.C0 = CFrame.new(0, 0, 0)
                weld.Parent = handle
                handle.Anchored = false
                handle.CanCollide = false
            end
        end

        if #accessories >= 2 and leftLeg then
            local hat = accessories[2]:Clone()
            hat.Parent = char
            local handle = hat:FindFirstChild("Handle")
            if handle then
                local weld = Instance.new("Weld")
                weld.Part0 = leftLeg
                weld.Part1 = handle
                weld.C0 = CFrame.new(0, 0, 0)
                weld.Parent = handle
                handle.Anchored = false
                handle.CanCollide = false
            end
        end
    end)
end)
