-- ==========================================
-- MAIN SERVICES & VARIABLES
-- ==========================================

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local VisualKorless = Instance.new("ScreenGui")
VisualKorless.Name = "VisualKorless"
VisualKorless.DisplayOrder = 99
VisualKorless.ResetOnSpawn = false
VisualKorless.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
VisualKorless.Parent = playerGui

local onLoadingFinished = Instance.new("BindableEvent")


-- ==========================================
-- SAFE SCOPE RUNNER
-- ==========================================

local function RunScope(namaScope, fungsiScope)

	task.spawn(function()

		local success, errorMsg = xpcall(
			fungsiScope,
			function(err)
				return "Error di ["
					.. namaScope
					.. "]: "
					.. tostring(err)
					.. "\n"
					.. debug.traceback()
			end
		)

		if not success then
			warn(errorMsg)
		end

	end)

end


-- ==========================================
-- SCOPE 1 : LOADING UI
-- ==========================================

local function Scope_UI1()

	local Loading = Instance.new("CanvasGroup")

	Loading.Name = "Loading"
	Loading.BorderSizePixel = 1
	Loading.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Loading.AnchorPoint = Vector2.new(0.50, 0.50)
	Loading.Size = UDim2.new(0.22, 0.00, 0.24, 0.00)
	Loading.BorderColor3 = Color3.new(0.40, 0.40, 0.40)
	Loading.BackgroundTransparency = 0
	Loading.Position = UDim2.new(0.50, 0.00, 0.50, 0.00)
	Loading.Visible = false
	Loading.Parent = VisualKorless


	-- ==========================================
	-- LOADING GRADIENT
	-- ==========================================

	local LoadingGradient = Instance.new("UIGradient")

	LoadingGradient.Name = "LoadingGradient"
	LoadingGradient.Enabled = false

	LoadingGradient.Transparency = NumberSequence.new({

		NumberSequenceKeypoint.new(0.00, 0.00, 0.00),
		NumberSequenceKeypoint.new(0.30, 0.00, 0.00),
		NumberSequenceKeypoint.new(0.60, 1.00, 0.00),
		NumberSequenceKeypoint.new(1.00, 1.00, 0.00)

	})

	LoadingGradient.Offset = Vector2.new(-1.00, 0.00)
	LoadingGradient.Rotation = 45
	LoadingGradient.Parent = Loading


	-- ==========================================
	-- MAIN FRAME
	-- ==========================================

	local MainFrame = Instance.new("Frame")

	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Vector2.new(0.50, 0.50)
	MainFrame.Size = UDim2.new(1.00, 0.00, 1.00, 0.00)
	MainFrame.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	MainFrame.Position = UDim2.new(0.50, 0.00, 0.50, 0.00)
	MainFrame.BorderSizePixel = 0
	MainFrame.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	MainFrame.Parent = Loading


	-- ==========================================
	-- MAIN GRADIENT
	-- ==========================================

	local UIGradient1 = Instance.new("UIGradient")

	UIGradient1.Name = "UIGradient1"

	UIGradient1.Color = ColorSequence.new({

		ColorSequenceKeypoint.new(
			0.00,
			Color3.new(0.10, 0.10, 0.10)
		),

		ColorSequenceKeypoint.new(
			1.00,
			Color3.new(0.29, 0.29, 0.29)
		)

	})

	UIGradient1.Rotation = -90
	UIGradient1.Parent = MainFrame


	-- ==========================================
	-- TITLE
	-- ==========================================

	local Title = Instance.new("Frame")

	Title.Name = "Title"
	Title.ClipsDescendants = true
	Title.AnchorPoint = Vector2.new(0.0, 0.00)
	Title.Size = UDim2.new(1.00, 0.00, 0.27, 0.00)
	Title.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Title.Position = UDim2.new(0.0, 0.00, 0.15, 0.00)
	Title.BorderSizePixel = 0
	Title.ZIndex = 2
	Title.BackgroundTransparency = 1
	Title.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Title.Parent = MainFrame


	local Title_1 = Instance.new("TextLabel")

	Title_1.Name = "Title"
	Title_1.TextWrapped = true
	Title_1.BorderSizePixel = 0
	Title_1.TextScaled = true
	Title_1.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)

	Title_1.FontFace = Font.new(
		"rbxasset://fonts/families/Nunito.json",
		Enum.FontWeight.Bold,
		Enum.FontStyle.Normal
	)

	Title_1.AnchorPoint = Vector2.new(0.00, 0.00)
	Title_1.TextSize = 14
	Title_1.Size = UDim2.new(1.00, 0.00, 0.80, 0.00)
	Title_1.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Title_1.Text = "Visual Korless"
	Title_1.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	Title_1.BackgroundTransparency = 1
	Title_1.Position = UDim2.new(0.00, 0.00, 0.00, 0.00)
	Title_1.Parent = Title


	-- ==========================================
	-- DESCRIPTION
	-- ==========================================

	local Desc = Instance.new("TextLabel")

	Desc.Name = "Desc"
	Desc.TextWrapped = true
	Desc.BorderSizePixel = 0
	Desc.TextScaled = true
	Desc.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)

	Desc.FontFace = Font.new(
		"rbxasset://fonts/families/Nunito.json",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	)

	Desc.AnchorPoint = Vector2.new(0.00, 1.00)
	Desc.TextSize = 14
	Desc.Size = UDim2.new(1.00, 0.00, 0.30, 0.00)
	Desc.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Desc.Text = "- Improve ur look with this visual -"
	Desc.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	Desc.BackgroundTransparency = 1
	Desc.Position = UDim2.new(0.00, 0.00, 1.00, 0.00)
	Desc.Parent = Title


	-- ==========================================
	-- LOADING BAR
	-- ==========================================

	local LoadingBar = Instance.new("Frame")

	LoadingBar.Name = "LoadingBar"
	LoadingBar.AnchorPoint = Vector2.new(0.00, 0.50)
	LoadingBar.Size = UDim2.new(1.00, 0.00, 0.10, 0.00)
	LoadingBar.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	LoadingBar.Position = UDim2.new(0.00, 0.00, 0.65, 0.00)
	LoadingBar.BorderSizePixel = 0
	LoadingBar.ZIndex = 2
	LoadingBar.BackgroundTransparency = 1
	LoadingBar.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	LoadingBar.Parent = MainFrame


	local LoadingText = Instance.new("TextLabel")

	LoadingText.Name = "LoadingText"
	LoadingText.TextWrapped = true
	LoadingText.BorderSizePixel = 0
	LoadingText.TextScaled = true
	LoadingText.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)

	LoadingText.FontFace = Font.new(
		"rbxasset://fonts/families/Nunito.json",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	)

	LoadingText.AnchorPoint = Vector2.new(0.50, 0.00)
	LoadingText.TextXAlignment = Enum.TextXAlignment.Left
	LoadingText.TextSize = 14
	LoadingText.Size = UDim2.new(0.64, 0.00, 0.67, 0.00)
	LoadingText.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	LoadingText.Text = "Loading..."
	LoadingText.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	LoadingText.BackgroundTransparency = 1
	LoadingText.Position = UDim2.new(0.50, 0.00, 0.00, 0.00)
	LoadingText.Parent = LoadingBar


	-- ==========================================
	-- LINE
	-- ==========================================

	local Line = Instance.new("CanvasGroup")

	Line.Name = "Line"
	Line.BorderSizePixel = 0
	Line.BackgroundColor3 = Color3.new(0.29, 0.29, 0.29)
	Line.AnchorPoint = Vector2.new(0.50, 1.00)
	Line.Size = UDim2.new(0.66, 0.00, 0.20, 0.00)
	Line.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Line.Position = UDim2.new(0.50, 0.00, 1.00, 0.00)
	Line.Parent = LoadingBar


	local UICorner = Instance.new("UICorner")

	UICorner.CornerRadius = UDim.new(1.00, 0.00)
	UICorner.Parent = Line


	-- ==========================================
	-- FILL
	-- ==========================================

	local Fill = Instance.new("Frame")

	Fill.Name = "Fill"
	Fill.AnchorPoint = Vector2.new(0.00, 0.50)
	Fill.Size = UDim2.new(0.50, 0.00, 1.00, 0.00)
	Fill.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Fill.Position = UDim2.new(0.00, 0.00, 0.50, 0.00)
	Fill.BorderSizePixel = 0
	Fill.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Fill.Parent = Line


	local UIGradient2 = Instance.new("UIGradient")

	UIGradient2.Name = "UIGradient2"

	UIGradient2.Color = ColorSequence.new({

		ColorSequenceKeypoint.new(
			0.00,
			Color3.new(0.00, 0.00, 1.00)
		),

		ColorSequenceKeypoint.new(
			1.00,
			Color3.new(0.00, 1.00, 1.00)
		)

	})

	UIGradient2.Parent = Fill


	-- ==========================================
	-- CREDIT
	-- ==========================================

	local Credit = Instance.new("Frame")

	Credit.Name = "Credit"
	Credit.AnchorPoint = Vector2.new(0.50, 1.00)
	Credit.Size = UDim2.new(0.92, 0.00, 0.13, 0.00)
	Credit.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Credit.Position = UDim2.new(0.50, 0.00, 0.95, 0.00)
	Credit.BorderSizePixel = 0
	Credit.ZIndex = 2
	Credit.BackgroundTransparency = 1
	Credit.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Credit.Parent = MainFrame


	local Credit_1 = Instance.new("TextLabel")

	Credit_1.Name = "Credit"
	Credit_1.TextWrapped = true
	Credit_1.BorderSizePixel = 0
	Credit_1.TextScaled = true
	Credit_1.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)

	Credit_1.FontFace = Font.new(
		"rbxasset://fonts/families/Nunito.json",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	)

	Credit_1.AnchorPoint = Vector2.new(1.00, 1.00)
	Credit_1.TextXAlignment = Enum.TextXAlignment.Right
	Credit_1.TextSize = 14
	Credit_1.Size = UDim2.new(0.65, 0.00, 0.50, 0.00)
	Credit_1.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Credit_1.Text = "Developed by Honami"
	Credit_1.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	Credit_1.BackgroundTransparency = 1
	Credit_1.Position = UDim2.new(1.00, 0.00, 1.00, 0.00)
	Credit_1.Parent = Credit


	-- ==========================================
	-- VERSION
	-- ==========================================

	local Version = Instance.new("TextLabel")

	Version.Name = "Version"
	Version.TextWrapped = true
	Version.BorderSizePixel = 0
	Version.TextScaled = true
	Version.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)

	Version.FontFace = Font.new(
		"rbxasset://fonts/families/Nunito.json",
		Enum.FontWeight.Regular,
		Enum.FontStyle.Normal
	)

	Version.AnchorPoint = Vector2.new(1.00, 0.00)
	Version.TextXAlignment = Enum.TextXAlignment.Right
	Version.TextSize = 14
	Version.Size = UDim2.new(0.65, 0.00, 0.50, 0.00)
	Version.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Version.Text = "Version 4.0"
	Version.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	Version.BackgroundTransparency = 1
	Version.Position = UDim2.new(1.00, 0.00, 0.00, 0.00)
	Version.Parent = Credit


	-- ==========================================
	-- GRADIENT OVERLAY
	-- ==========================================

	local Gradient = Instance.new("Frame")

	Gradient.Name = "Gradient"
	Gradient.AnchorPoint = Vector2.new(0.50, 0.50)
	Gradient.Size = UDim2.new(1.00, 0.00, 1.00, 0.00)
	Gradient.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Gradient.Position = UDim2.new(0.50, 0.00, 0.50, 0.00)
	Gradient.BorderSizePixel = 0
	Gradient.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Gradient.Parent = MainFrame


	local UIGradient3 = Instance.new("UIGradient")

	UIGradient3.Name = "UIGradient3"

	UIGradient3.Transparency = NumberSequence.new({

		NumberSequenceKeypoint.new(0.00, 1.00, 0.00),
		NumberSequenceKeypoint.new(0.50, 1.00, 0.00),
		NumberSequenceKeypoint.new(0.50, 0.00, 0.00),
		NumberSequenceKeypoint.new(1.00, 0.00, 0.00)

	})

	UIGradient3.Color = ColorSequence.new({

		ColorSequenceKeypoint.new(
			0.00,
			Color3.new(0.00, 0.00, 0.00)
		),

		ColorSequenceKeypoint.new(
			1.00,
			Color3.new(0.20, 0.20, 0.20)
		)

	})

	UIGradient3.Rotation = 60
	UIGradient3.Parent = Gradient


	-- ==========================================
	-- CONSTRAINTS
	-- ==========================================

	local UIAspectRatioConstraint =
		Instance.new("UIAspectRatioConstraint")

	UIAspectRatioConstraint.AspectRatio =
		1.7000000476837158

	UIAspectRatioConstraint.Parent = Loading


	-- ==========================================
	-- INITIAL VALUES
	-- ==========================================

	LoadingGradient.Enabled = true
	LoadingGradient.Offset = Vector2.new(-1, 0)
	LoadingGradient.Rotation = 45

	UIGradient3.Offset = Vector2.new(1, 0)

	Title.AnchorPoint = Vector2.new(1, 0)
	Desc.AnchorPoint = Vector2.new(1, 1)
	LoadingBar.AnchorPoint = Vector2.new(1, 0.5)
	Version.AnchorPoint = Vector2.new(0, 0)
	Credit_1.AnchorPoint = Vector2.new(0, 1)

	Fill.Size = UDim2.new(0, 0, 1, 0)


	-- ==========================================
	-- TWEEN FUNCTION
	-- ==========================================

	local function tween(obj, time, props)

		local tw = TweenService:Create(

			obj,

			TweenInfo.new(
				time,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.Out
			),

			props

		)

		tw:Play()

		return tw

	end


	-- ==========================================
	-- LOADING ANIMATION
	-- ==========================================

	task.wait(1.0)

	Loading.Visible = true

	tween(
		LoadingGradient,
		1.0,
		{
			Offset = Vector2.new(1, 0)
		}
	)

	tween(
		UIGradient3,
		1.0,
		{
			Offset = Vector2.new(0, 0)
		}
	)

	tween(
		Title,
		1.0,
		{
			AnchorPoint = Vector2.new(0, 0)
		}
	)


	task.wait(0.2)

	tween(
		Desc,
		1.0,
		{
			AnchorPoint = Vector2.new(0, 1)
		}
	)


	task.wait(0.2)

	LoadingGradient.Enabled = false
	LoadingGradient.Offset = Vector2.new(1, 0)

	tween(
		LoadingBar,
		1.0,
		{
			AnchorPoint = Vector2.new(0, 0.5)
		}
	)


	task.wait(0.2)

	tween(
		Version,
		1.0,
		{
			AnchorPoint = Vector2.new(1, 0)
		}
	)


	task.wait(0.2)

	tween(
		Credit_1,
		1.0,
		{
			AnchorPoint = Vector2.new(1, 1)
		}
	)


	task.wait(0.5)


	-- ==========================================
	-- STUTTER LOADING
	-- ==========================================

	local function stutterLoading()

		tween(
			Fill,
			0.8,
			{
				Size = UDim2.new(
					0.3,
					0,
					1,
					0
				)
			}
		)

		task.wait(1.0)


		tween(
			Fill,
			0.6,
			{
				Size = UDim2.new(
					0.65,
					0,
					1,
					0
				)
			}
		)

		task.wait(0.8)


		tween(
			Fill,
			0.4,
			{
				Size = UDim2.new(
					0.9,
					0,
					1,
					0
				)
			}
		)

		task.wait(0.5)


		tween(
			Fill,
			0.4,
			{
				Size = UDim2.new(
					1,
					0,
					1,
					0
				)
			}
		)

	end


	stutterLoading()


	task.wait(0.5)

	LoadingText.Text = "Complete"


	task.wait(0.5)

	LoadingGradient.Enabled = true

	tween(
		LoadingGradient,
		1.0,
		{
			Offset = Vector2.new(-1, 0)
		}
	)


	task.wait(1.0)

	Loading.Visible = false

	onLoadingFinished:Fire()

end


-- ==========================================
-- SCOPE 2 : LOGIC SWAP
-- ==========================================

local function Scope_Logic4()

	local TARGET_USERNAME = "honamichandesu"

	local avatarDescription = nil
	local isProcessing = false


	-- ==========================================
	-- SMART FIND
	-- ==========================================

	local function smartFind(parentObject, nameToFind)

		if not parentObject then
			return nil
		end

		return parentObject:FindFirstChild(
			nameToFind,
			true
		)

	end


	-- ==========================================
	-- HEADLESS
	-- ==========================================

	local function hilangkanKepala(rigTarget)

		if not rigTarget then
			return
		end

		local head =
			rigTarget:FindFirstChild("Head")

		if head then

			head.Transparency = 1

			local face =
				head:FindFirstChild("face")
				or head:FindFirstChild("Decal")

			if face then
				face:Destroy()
			end

		end

	end


	local function doHeadless()

		local rigsFolder =
			workspace:FindFirstChild("Rigs")

		local myRig =
			rigsFolder
			and rigsFolder:FindFirstChild(
				player.Name
			)

		hilangkanKepala(myRig)
		hilangkanKepala(player.Character)

	end


	-- ==========================================
	-- LOAD AVATAR
	-- ==========================================

	local function initVisuals()

		local successId, userId =
			pcall(function()

				return Players:GetUserIdFromNameAsync(
					TARGET_USERNAME
				)

			end)


		if not successId then
			return
		end


		local successDesc, description =
			pcall(function()

				return Players:GetHumanoidDescriptionFromUserId(
					userId
				)

			end)


		if not successDesc then
			return
		end


		avatarDescription = description


		local farCFrame =
			CFrame.new(
				2048,
				100,
				0
			)


		-- ==========================================
		-- R15 VISUAL
		-- ==========================================

		local spawnedR15 =
			Players:CreateHumanoidModelFromDescription(
				description,
				Enum.HumanoidRigType.R15
			)

		spawnedR15.Name =
			TARGET_USERNAME
			.. "_Visual_R15"

		spawnedR15.Parent = workspace

		spawnedR15:PivotTo(
			farCFrame
		)


		if spawnedR15:FindFirstChild(
			"HumanoidRootPart"
		) then

			spawnedR15.HumanoidRootPart.Anchored =
				true

		end


		-- ==========================================
		-- R6 VISUAL
		-- ==========================================

		local spawnedR6 =
			Players:CreateHumanoidModelFromDescription(
				description,
				Enum.HumanoidRigType.R6
			)

		spawnedR6.Name =
			TARGET_USERNAME
			.. "_Visual_R6"

		spawnedR6.Parent = workspace

		spawnedR6:PivotTo(
			farCFrame
				* CFrame.new(
					5,
					0,
					0
				)
		)


		if spawnedR6:FindFirstChild(
			"HumanoidRootPart"
		) then

			spawnedR6.HumanoidRootPart.Anchored =
				true

		end

	end


	-- ==========================================
	-- KORBLOX - TAHAP 1
	-- ==========================================

	local function runTahap1()

		local rigsFolder =
			workspace:FindFirstChild("Rigs")


		local myRig =
			rigsFolder
			and rigsFolder:FindFirstChild(
				player.Name
			)


		if not myRig then
			return false
		end


		local myHum =
			myRig:FindFirstChild(
				"Humanoid"
			)


		if not myHum then
			return false
		end


		local isR15 =
			myHum.RigType ==
			Enum.HumanoidRigType.R15


		local dummyRig =
			Players:CreateHumanoidModelFromDescription(
				avatarDescription,
				myHum.RigType
			)


		dummyRig.Name =
			"TumbalKorblox_Tahap1"

		dummyRig.Parent =
			workspace


		task.wait(0.3)


		local sukses = false


		-- ==========================================
		-- R15
		-- ==========================================

		if isR15 then

			local oldUpper =
				myRig:FindFirstChild(
					"RightUpperLeg"
				)

			local oldLower =
				myRig:FindFirstChild(
					"RightLowerLeg"
				)

			local oldFoot =
				myRig:FindFirstChild(
					"RightFoot"
				)


			local newUpper =
				dummyRig:FindFirstChild(
					"RightUpperLeg"
				)

			local newLower =
				dummyRig:FindFirstChild(
					"RightLowerLeg"
				)

			local newFoot =
				dummyRig:FindFirstChild(
					"RightFoot"
				)


			if
				oldUpper
				and oldLower
				and oldFoot
				and newUpper
				and newLower
				and newFoot
			then

				local joints =
					myRig:FindFirstChild(
						"Joints"
					)


				local rightHip =
					(joints
						and joints:FindFirstChild(
							"RightHip"
						))
					or (
						myRig:FindFirstChild(
							"LowerTorso"
						)
						and myRig.LowerTorso:FindFirstChild(
							"RightHip"
						)
					)
					or oldUpper:FindFirstChild(
						"RightHip"
					)


				local rightKnee =
					(joints
						and joints:FindFirstChild(
							"RightKnee"
						))
					or oldLower:FindFirstChild(
						"RightKnee"
					)


				local rightAnkle =
					(joints
						and joints:FindFirstChild(
							"RightAnkle"
						))
					or oldFoot:FindFirstChild(
						"RightAnkle"
					)


				if
					rightHip
					and rightKnee
					and rightAnkle
				then

					newUpper.Parent =
						myRig

					newLower.Parent =
						myRig

					newFoot.Parent =
						myRig


					rightHip.Part1 =
						newUpper


					rightKnee.Part0 =
						newUpper

					rightKnee.Part1 =
						newLower


					rightAnkle.Part0 =
						newLower

					rightAnkle.Part1 =
						newFoot


					newUpper.Massless =
						true

					newLower.Massless =
						true

					newFoot.Massless =
						true


					local myColors =
						myRig:FindFirstChildOfClass(
							"BodyColors"
						)


					if myColors then

						newUpper.Color =
							myColors.RightLegColor3

						newLower.Color =
							myColors.RightLegColor3

						newFoot.Color =
							myColors.RightLegColor3

					end


					oldUpper:Destroy()
					oldLower:Destroy()
					oldFoot:Destroy()


					sukses = true

				end

			end


		-- ==========================================
		-- R6
		-- ==========================================

		else

			local myOldLeg =
				myRig:FindFirstChild(
					"Right Leg"
				)


			local jointsFolder =
				myRig:FindFirstChild(
					"Joints"
				)


			local rightLegMotor =
				jointsFolder
				and jointsFolder:FindFirstChild(
					"Right Leg"
				)


			local targetLeg =
				dummyRig:FindFirstChild(
					"Right Leg"
				)


			if
				myOldLeg
				and rightLegMotor
				and targetLeg
			then

				for _, obj in ipairs(
					dummyRig:GetChildren()
				) do

					if
						obj:IsA(
							"CharacterMesh"
						)
						and obj.BodyPart ==
						Enum.BodyPart.RightLeg
					then

						for _, oldMesh in ipairs(
							myRig:GetChildren()
						) do

							if
								oldMesh:IsA(
									"CharacterMesh"
								)
								and oldMesh.BodyPart ==
								Enum.BodyPart.RightLeg
							then

								oldMesh:Destroy()

							end

						end


						obj.Parent =
							myRig

					end

				end


				targetLeg.Parent =
					myRig

				rightLegMotor.Part1 =
					targetLeg

				targetLeg.Massless =
					true


				local myColors =
					myRig:FindFirstChildOfClass(
						"BodyColors"
					)


				if myColors then

					targetLeg.Color =
						myColors.RightLegColor3

				end


				myOldLeg:Destroy()

				sukses = true

			end

		end


		dummyRig:Destroy()

		return sukses

	end


	-- ==========================================
	-- KORBLOX - TAHAP 2
	-- ==========================================

	local function runTahap2()

		local character =
			player.Character


		if not character then
			return false
		end


		local humanoid =
			character:FindFirstChild(
				"Humanoid"
			)


		if not humanoid then
			return false
		end


		local isR15 =
			humanoid.RigType ==
			Enum.HumanoidRigType.R15


		local dummyRig =
			Players:CreateHumanoidModelFromDescription(
				avatarDescription,
				humanoid.RigType
			)


		local sukses = false


		-- ==========================================
		-- R15
		-- ==========================================

		if isR15 then

			local donorUpper =
				smartFind(
					dummyRig,
					"RightUpperLeg"
				)


			local donorLower =
				smartFind(
					dummyRig,
					"RightLowerLeg"
				)


			local donorFoot =
				smartFind(
					dummyRig,
					"RightFoot"
				)


			local lowerTorso =
				smartFind(
					character,
					"LowerTorso"
				)


			local oldUpper =
				smartFind(
					character,
					"RightUpperLeg"
				)


			local oldLower =
				smartFind(
					character,
					"RightLowerLeg"
				)


			local oldFoot =
				smartFind(
					character,
					"RightFoot"
				)


			if
				donorUpper
				and donorLower
				and donorFoot
				and lowerTorso
				and oldUpper
				and oldLower
				and oldFoot
			then

				local newUpper =
					donorUpper:Clone()

				local newLower =
					donorLower:Clone()

				local newFoot =
					donorFoot:Clone()


				-- ==========================================
				-- REMOVE MOTOR6D
				-- ==========================================

				for _, v in ipairs(
					newUpper:GetDescendants()
				) do

					if v:IsA("Motor6D") then
						v:Destroy()
					end

				end


				for _, v in ipairs(
					newLower:GetDescendants()
				) do

					if v:IsA("Motor6D") then
						v:Destroy()
					end

				end


				for _, v in ipairs(
					newFoot:GetDescendants()
				) do

					if v:IsA("Motor6D") then
						v:Destroy()
					end

				end


				-- ==========================================
				-- RIGHT HIP
				-- ==========================================

				local newHip =
					Instance.new(
						"Motor6D"
					)

				newHip.Name =
					"RightHip"

				newHip.Part0 =
					lowerTorso

				newHip.Part1 =
					newUpper


				local hipAtt0 =
					lowerTorso:FindFirstChild(
						"RightHipRigAttachment"
					)


				local hipAtt1 =
					newUpper:FindFirstChild(
						"RightHipRigAttachment"
					)


				if hipAtt0 and hipAtt1 then

					newHip.C0 =
						hipAtt0.CFrame

					newHip.C1 =
						hipAtt1.CFrame

				end


				newHip.Parent =
					newUpper


				-- ==========================================
				-- RIGHT KNEE
				-- ==========================================

				local newKnee =
					Instance.new(
						"Motor6D"
					)

				newKnee.Name =
					"RightKnee"

				newKnee.Part0 =
					newUpper

				newKnee.Part1 =
					newLower


				local kneeAtt0 =
					newUpper:FindFirstChild(
						"RightKneeRigAttachment"
					)


				local kneeAtt1 =
					newLower:FindFirstChild(
						"RightKneeRigAttachment"
					)


				if kneeAtt0 and kneeAtt1 then

					newKnee.C0 =
						kneeAtt0.CFrame

					newKnee.C1 =
						kneeAtt1.CFrame

				end


				newKnee.Parent =
					newLower


				-- ==========================================
				-- RIGHT ANKLE
				-- ==========================================

				local newAnkle =
					Instance.new(
						"Motor6D"
					)

				newAnkle.Name =
					"RightAnkle"

				newAnkle.Part0 =
					newLower

				newAnkle.Part1 =
					newFoot


				local ankleAtt0 =
					newLower:FindFirstChild(
						"RightAnkleRigAttachment"
					)


				local ankleAtt1 =
					newFoot:FindFirstChild(
						"RightAnkleRigAttachment"
					)


				if ankleAtt0 and ankleAtt1 then

					newAnkle.C0 =
						ankleAtt0.CFrame

					newAnkle.C1 =
						ankleAtt1.CFrame

				end


				newAnkle.Parent =
					newFoot


				-- ==========================================
				-- APPLY NEW PARTS
				-- ==========================================

				newUpper.Parent =
					character

				newLower.Parent =
					character

				newFoot.Parent =
					character


				oldUpper:Destroy()
				oldLower:Destroy()
				oldFoot:Destroy()


				sukses = true

			end


		-- ==========================================
		-- R6
		-- ==========================================

		else

			local donorLeg =
				smartFind(
					dummyRig,
					"Right Leg"
				)


			local torso =
				smartFind(
					character,
					"Torso"
				)


			local oldLeg =
				smartFind(
					character,
					"Right Leg"
				)


			if donorLeg and torso and oldLeg then

				local newLeg =
					donorLeg:Clone()


				local oldHip =
					smartFind(
						character,
						"Right Hip"
					)


				local newHip =
					Instance.new(
						"Motor6D"
					)


				newHip.Name =
					"Right Hip"

				newHip.Part0 =
					torso

				newHip.Part1 =
					newLeg


				if oldHip then

					newHip.C0 =
						oldHip.C0

					newHip.C1 =
						oldHip.C1

				end


				newHip.Parent =
					torso

				newLeg.Parent =
					character


				-- ==========================================
				-- CHARACTER MESH
				-- ==========================================

				for _, obj in ipairs(
					dummyRig:GetDescendants()
				) do

					if
						obj:IsA(
							"CharacterMesh"
						)
						and obj.BodyPart ==
						Enum.BodyPart.RightLeg
					then

						for _, myObj in ipairs(
							character:GetDescendants()
						) do

							if
								myObj:IsA(
									"CharacterMesh"
								)
								and myObj.BodyPart ==
								Enum.BodyPart.RightLeg
							then

								myObj:Destroy()

							end

						end


						obj:Clone().Parent =
							character

					end

				end


				oldLeg:Destroy()


				if oldHip then
					oldHip:Destroy()
				end


				sukses = true

			end

		end


		dummyRig:Destroy()

		return sukses

	end


	-- ==========================================
	-- MAIN ACTION
	-- ==========================================

	local function executeAction(mode)

		if isProcessing then
			return
		end


		isProcessing = true


		-- ==========================================
		-- WAIT FOR AVATAR DATA
		-- ==========================================

		if not avatarDescription then

			isProcessing = false

			return

		end


		local finalSuccess = false


		-- ==========================================
		-- HEADLESS
		-- ==========================================

		if
			mode == "Headless"
			or mode == "Korless"
		then

			doHeadless()

			finalSuccess = true

		end


		-- ==========================================
		-- KORLESS DELAY
		-- ==========================================

		if mode == "Korless" then
			task.wait(0.1)
		end


		-- ==========================================
		-- KORBLOX
		-- ==========================================

		if
			mode == "Korblox"
			or mode == "Korless"
		then

			local t1 =
				runTahap1()


			if t1 then

				finalSuccess = true

			else

				local t2 =
					runTahap2()


				if t2 then

					finalSuccess = true

				else

					if mode == "Korblox" then
						finalSuccess = false
					end

				end

			end

		end


		-- ==========================================
		-- FINISH
		-- NO SUCCESS NOTIFICATION
		-- NO FAILED NOTIFICATION
		-- ==========================================

		isProcessing = false

	end


	-- ==========================================
	-- F8 HOTKEY
	--
	-- Korless =
	-- Headless + Korblox
	-- ==========================================

	UserInputService.InputBegan:Connect(
		function(
			input,
			gameProcessed
		)

			if gameProcessed then
				return
			end


			if input.KeyCode ==
				Enum.KeyCode.F8
			then

				executeAction(
					"Korless"
				)

			end

		end
	)


	-- ==========================================
	-- INITIALIZE AVATAR DATA
	-- ==========================================

	task.spawn(
		initVisuals
	)

end


-- ==========================================
-- EXECUTION
-- ==========================================

RunScope(
	"Scope_UI1_Loading",
	Scope_UI1
)


RunScope(
	"Scope_Logic4_Avatar",
	Scope_Logic4
)