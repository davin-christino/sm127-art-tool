# sm127-art-tool
A tool to streamline making art in SM127

### 1. WELCOME
A nice tool that minimises the tedium of making art with lava objects in Super Mario 127.
This tool supersedes the old Google Sheets tool, with multiple improvements!

### 2. HOW TO USE
The tool completely runs in the Godot 4.4 editor. tool.tscn contains a demo, but it can be used with any new scene with a Generator as the root node.
Once creating a Generator root node, use ColorRects to build the art you make, using the Layout > Transform properties (except skewing). You can nest nodes however you want, add nodes that aren't ColorRects (they will be ignored in the generation), and even add instantiated scenes. Take a look at the sample scenes to get an idea of the tool's potential!

Add attributes with the Lava Attributes property in the inspector, and click the button to copy your code. Paste it at the end of an area code before the right bracket ], and it will appear in the level.

The art will appear at the top left corner 0, 0 at a scale of 1px in Godot = 1xpx in game. This can be changed with the Layout > Transform properties.

### 3. LIMITATIONS
a. Skewed ColorRects (parallelograms) are not supported by the game, hence they will look incorrect in-game.
b. Modulate is not supported. Intended to be in a future version. (The tool will omit ColorRects made invisible with visible=false though!)
c. Water art is not supported. Intended to be in a future version.
d. There is no equivalent to Sheets Theme colours. Not sure if I will implement this.

Ask to me (davinchristino) on the 127 discord server for further queries!
