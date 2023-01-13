--  LocalScript in StarterGui

local config = {
	defSpeed = 16,
	runSpeed = 30,
	runTweenTime = 3,
	defFov = 70,
	runFov = 75,
	runKeyCode = Enum.KeyCode.LeftShift
}

local can = (script.Parent:FindFirstChild("CanRun") and script.Parent.CanRun.Value) or true
local isRunning = false

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == config.runKeyCode and not isRunning and can and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").MoveDirection ~= Vector3.new(0,0,0) then
		isRunning = true
		game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:WaitForChild("Humanoid"),TweenInfo.new(config.runTweenTime,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{WalkSpeed = config.runSpeed}):Play()
		game:GetService("TweenService"):Create(game.Workspace.CurrentCamera,TweenInfo.new(2.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{FieldOfView = config.runFov}):Play()
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(key)
	if key.KeyCode == config.runKeyCode and isRunning and can then
		isRunning = false
		game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:WaitForChild("Humanoid"),TweenInfo.new(config.runTweenTime/5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{WalkSpeed = config.defSpeed}):Play()
		game:GetService("TweenService"):Create(game.Workspace.CurrentCamera,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{FieldOfView = config.defFov}):Play()
	end
end)
