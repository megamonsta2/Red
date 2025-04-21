local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

if RunService:IsServer() then
	if not ReplicatedStorage:FindFirstChild("ReliableRedEvent") then
		local ReliableRemote = Instance.new("RemoteEvent")
		ReliableRemote.Name = "ReliableRedEvent"
		ReliableRemote.Parent = ReplicatedStorage
	end

	if not ReplicatedStorage:FindFirstChild("UnreliableRedEvent") then
		local UnreliableRemote = Instance.new("UnreliableRemoteEvent")
		UnreliableRemote.Name = "UnreliableRedEvent"
		UnreliableRemote.Parent = ReplicatedStorage
	end

	require(script.Net).Server.Start()
else
	ReplicatedStorage:WaitForChild("ReliableRedEvent")
	ReplicatedStorage:WaitForChild("UnreliableRedEvent")

	require(script.Net).Client.Start()
end

local Event = require(script.Event)
local Function = require(script.Function)
local SharedEvents = require(script.SharedEvent)

export type Event<T...> = Event.Event<T...>
export type Function<T..., R...> = Function.Function<T..., R...>
export type SharedCallEvent<T...> = SharedEvents.SharedCallEvent<T...>
export type SharedSignalEvent<T...> = SharedEvents.SharedSignalEvent<T...>

return {
	Event = Event,
	Function = Function,
	SharedEvent = SharedEvents.SharedCallEvent,
	SharedSignalEvent = SharedEvents.SharedSignalEvent,
}
