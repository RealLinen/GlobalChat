--discord.gg/boronide, code generated using luamin.js™



if keyType:match("end")then return end;local a= Funcs.searchFor(PlayerData, "Data.Misc.CurrentTransformation")if not a then a="SSJB"end;local a= Funcs.searchFor(game:GetService("ServerStorage"), Format("Transformations.%s", a))if not a then PlayerData.Data["Misc"]["CurrentTransformation"]=nil;return end;if LocalData.Transforming then return end;local b=Character and Character:GetPivot()or Vector3.new(10, 9, 3)if Character and typeof(Character.PrimaryPart)=="Instance"then Character.PrimaryPart.Anchored=true end;Funcs.LoadAnimationTime(Animations["Transform"], {
	["0.4"] = function()
		if typeof(LocalData.CachedParts)=="table" or LocalData.Transformed then
			LocalData.CachedParts = typeof(LocalData.CachedParts)=="table" and LocalData.CachedParts or {}
			for a,a in pairs(LocalData.CachedParts) do
				pcall(function()
					a:Destroy();a:Remove()
				end)
			end
			pcall(function()		
				if Character and typeof(Character.PrimaryPart)=="Instance" then
					Character.PrimaryPart.Anchored = false
				end
			end)
			LocalData.CachedParts = nil
			LocalData.Transformed = nil
			return;
		end
		-- < ____ > |:O|~~~~~~~~~~~~|O:| < ____ > --	
		-- < ____ > |:O|~~~~~~~~~~~~|O:| < ____ > --
		local c = {}
		for d,d in pairs(a:GetDescendants()) do
			local e = pcall(function()return d.Position and d.Size and d.Anchored end)
			if e and not defaultRigParts[d.Name] then
				local e = d
				local d = clostestToBodyPart(d, a)
				if not d then continue; end
				local f = Character:FindFirstChild(d.Name)
				if not f then continue; end
				pcall(function()
					Character:PivotTo(a:FindFirstChild("HumanoidRootPart").CFrame)
				end)
				local a = f.Position.Y + (e.Position.Y-d.Position.Y)
				local g = f.Position.X + (e.Position.X-d.Position.X)
				local d = f.Position.Z + (e.Position.Z-d.Position.Z)

				local a = Vector3.new(g, a, d)
				e = e:Clone();c[#c+1] = e;e.Anchored = true;local c = e.CanCollide;e.CanCollide = false
				e.Position = a

				local a = Instance.new("WeldConstraint")	
				a.Part0 = f
				a.Part1 = e

				e.Parent = f
				a.Parent = e
				e.Anchored = false
				Character:PivotTo(b)
			end
		end
		for b,d in pairs(defaultRigParts) do
			local d = Character:FindFirstChild(b)
			local a = a:FindFirstChild(b)
			if d and a then
				for a,a in pairs(a:GetChildren()) do
					if not d:FindFirstChild(a.Name) and not getObjectsProperties(a)["Part0"] then
						local a = a:Clone()
						c[#c+1] = a
						pcall(function() a.Anchored = false end)
						a.Parent = d
					end
				end
			end
		end
		pcall(function()		
			if Character and typeof(Character.PrimaryPart)=="Instance" then
				Character.PrimaryPart.Anchored = false
			end
		end)
		LocalData.Transformed = true
		LocalData.CachedParts = c
	end,
}, true)