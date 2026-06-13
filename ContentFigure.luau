local fcs = {
	Enum.NormalId.Top, Enum.NormalId.Bottom, 
	Enum.NormalId.Left, Enum.NormalId.Right, 
	Enum.NormalId.Front, Enum.NormalId.Back
}

for _, obj in ipairs(workspace:GetDescendants()) do
	if obj.Name == "FigureRig" then
		for _, o in ipairs(obj:GetDescendants()) do
			if o:IsA("BasePart") and o.Name ~= "Hitbox" then
				for _, f in ipairs(fcs) do
					local dec = Instance.new("Decal")
					dec.Texture = "http://www.roblox.com/asset/?id=118955218442919"
					dec.Face = f
					dec.Parent = o
				end
			end
		end
	end
end
