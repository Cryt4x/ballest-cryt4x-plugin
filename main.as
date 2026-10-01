// The smallest plugin: logs once when loaded, then a message every so often. Its two settings show how a plugin
// gets a settings page (footer plugins > open > installed > Hello World > settings).

[Setting name="Message Enabled" description="Whether the message is enabled"]
bool MessageEnabled = false;

[Setting name="Message" description="A message written to the log"]
string Message = "Hello o7";

[Setting name="Every" min=5 max=600 description="Seconds between messages"]
float Every = 60;

// A clear ball with a 3D model file inside (models/wiege_kugeln.glb placed by models/wiege.txt), added to the
// Customize page through Cosmetic Kit (a dependency: see info.toml).
import bool AddBall(const string &in, const string &in, const string &in, const string &in, const string &in) from "cosmetic-kit";

float elapsed = 0;

void Main()
{
    Log::Info("First plugin from CryT4x!");
    PrintCryT4x();

    string f = Plugins::Folder();
    AddBall("cryt4x.wiege", "Waage", "", f + "wiege_preview.png", f + "models/wiege.txt");
}

// The player changed a setting: say so, and start counting again.
void OnSettingsChanged()
{
    Log::Info("Settings changed: MSG Status: " + MessageEnabled + "; MSG: '" + Message + "'; Time Between: " + int(Every));
    elapsed = 0;
}

void PrintCryT4x()
{
    //    ______             ______  __   __
    //   / ____/____  __  _ /_  __/ / /  / /
    //  / /    / ___// / / / / /   / /__/ /__  __
    // / /___ / /   / /_/ / / /    |___  / \ \/ /
    // \____//_/    \__, / /_/        /_/  /_/\_\
    //             /____/
    Log::Info("    _____                          _______ __     __");
    Log::Info("  / ____/   ____  __   __ /__    __//  /   /  /");
    Log::Info(" / /         / ___//  /  /  /    /  /    /  /__/  / __   __      ");
    Log::Info("/ /___   / /     /  /_/  /     /  /     \\___    /  \\  \\/  /     ");
    Log::Info("\\____//_/     _\\__,  /     /_/             /_/    /_/\\_\\    ");
    Log::Info("                  /_____/");
}

void Update(float dt)
{
    elapsed += dt;
    if (elapsed >= Every && MessageEnabled)
    {
        elapsed = 0;
        Log::Info(Message);
    }
}
