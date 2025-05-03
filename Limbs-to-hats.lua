local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()

-- Remove limbs
for _, limb in ipairs({"Left Arm", "Right Arm", "Left Leg", "Right Leg"}) do
	local part = c:FindFirstChild(limb)
	if part then part:Destroy() end
end

-- Attach hats as limbs
local count = 0
for _, accessory in ipairs(p.Character:GetChildren()) do
	if accessory:IsA("Accessory") and accessory:FindFirstChild("Handle") then
		count += 1
		local handle = accessory.Handle:Clone()
		handle.Name = "FakeLimb"..count
		handle.Parent = c

		local weld = Instance.new("Motor6D")
		weld.Part0 = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
		weld.Part1 = handle
		weld.C0 = CFrame.new(1.5 - (count * 1.5), 0, 0) -- place it on sides
		weld.Parent = weld.Part0
	end
	if count >= 4 then break end -- Only use 4 hats
end
