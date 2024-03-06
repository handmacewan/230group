using Godot;
using System;

public partial class MenuNode : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GetNode<ColorRect>("BlackScreen").Hide();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
async public void OnStartButtonPressed()
{
	GetNode<ColorRect>("BlackScreen").Show();
	var fadeAnimation = GetNode<AnimationPlayer>("AnimationPlayer");
	fadeAnimation.Play("MenuFadeBlack");
	await ToSignal(GetTree().CreateTimer(1.0), SceneTreeTimer.SignalName.Timeout);
	
}


async private void OnQuitButtonPressed()
{
	GetNode<ColorRect>("BlackScreen").Show();
	var fadeAnimation = GetNode<AnimationPlayer>("AnimationPlayer");
	fadeAnimation.Play("MenuFadeBlack");
	await ToSignal(GetTree().CreateTimer(1.0), SceneTreeTimer.SignalName.Timeout);
	GetTree().Quit();
}
}
