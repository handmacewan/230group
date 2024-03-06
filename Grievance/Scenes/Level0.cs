using Godot;
using System;

public partial class Level0 : Node2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}


private void OnGoalBodyEntered(Node2D body)
{
	// Because this is done as a physics step, the call to remove objects must be deferred
	GetTree().CallDeferred("change_scene_to_file", "res://Scenes/Level1.tscn");
}

}
