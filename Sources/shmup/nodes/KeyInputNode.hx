package shmup.nodes;
import ash.core.Node;
import shmup.components.KeyStates;
import shmup.components.types.KeyInput;

/**
 * ...
 * @author Urs Stutz
 */
class KeyInputNode extends Node<KeyInputNode> {

	public var keyInput:KeyInput;
	public var keyStates:KeyStates;
}