using Godot;
using System;

public partial class Player : CharacterBody2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		var animatedSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
		
		// bug: when holding opposite keys, it is possible to walk in place
		if (Input.IsActionPressed("MoveRight"))
		{
			animatedSprite2D.Play();
			animatedSprite2D.Animation = "walkR";
			animatedSprite2D.FlipH = false;
		}
		else if (Input.IsActionPressed("MoveLeft"))
		{
			animatedSprite2D.Play();
			animatedSprite2D.Animation = "walkR";
			animatedSprite2D.FlipH = true;
		}
		else if (Input.IsActionPressed("MoveUp"))
		{
			animatedSprite2D.Play();
			animatedSprite2D.Animation = "walkUp";
		}
		else if (Input.IsActionPressed("MoveDown"))
		{
			animatedSprite2D.Play();
			animatedSprite2D.Animation = "walkDown";
		}
		else
		{
			animatedSprite2D.Stop();
		}
		
	}
	
	public override void _PhysicsProcess(double delta)
	{
		float moveSpeed = 150;
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
		
		if (velocity.Length() != 0)
		{
			// Change the number here to speed up the character
			velocity = velocity.Normalized() * moveSpeed;
		}
		
		// Velocity is an inherent property so isnt passed to moveandslide
		Velocity = velocity;
		MoveAndSlide();
		}
}
