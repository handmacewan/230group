using Godot;
using System;

public partial class Player : Area2D
{
	[Export]
	public int Speed { get; set; } = 300;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		var velocity = Vector2.Zero;
		
		if (Input.IsActionPressed("MoveRight"))
		{
			velocity.X += 1;
		}
		if (Input.IsActionPressed("MoveLeft"))
		{
			velocity.X -= 1;
		}
		if (Input.IsActionPressed("MoveUp"))
		{
			velocity.Y -= 1;
		}
		if (Input.IsActionPressed("MoveDown"))
		{
			velocity.Y += 1;
		}
		
		var animatedSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
		
		if (velocity.Length() > 0)
		{
			velocity = velocity.Normalized() * Speed;
			animatedSprite2D.Play();
		}
		else
		{
			animatedSprite2D.Stop();
		}
		
		Position += velocity * (float)delta;
		Position = new Vector2(
			x: Position.X,
			y: Position.Y
		);
		
		if (velocity.X !=0)
		{
			animatedSprite2D.Animation = "walkR";
			animatedSprite2D.FlipV = false;
			animatedSprite2D.FlipH = velocity.X < 0;
		}
		else if (velocity.Y > 0)
		{
			animatedSprite2D.Animation = "walkDown";
		}
		else if (velocity.Y < 0)
		{
			animatedSprite2D.Animation = "walkUp";
		}
		
	}
}
